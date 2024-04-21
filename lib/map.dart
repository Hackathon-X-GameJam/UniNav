import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:anyhow/anyhow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:rust_core/slice.dart';
import 'package:uninav/components/drawer.dart';
import 'package:uninav/components/hamburger_menu.dart';
import 'package:uninav/components/map_render_level.dart';
import 'package:uninav/controllers/map_controller.dart';
import 'package:uninav/data/geo/model.dart';
import 'package:uninav/util/geojson_util.dart';
import 'package:uninav/util/geomath.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
            title: const Text('Map'),
            leading: HamburgerMenu(),

            // right side expanding search bar widget
            actions: [
              AnimSearchBar(
                width: /* media query device width  */ 300,
                textController: TextEditingController(),
                onSuffixTap: () {
                  print('Search');
                },
                closeSearchOnSuffixTap: false,
                onSubmitted: (p0) => {
                  print('Search: $p0'),
                },
              ),
            ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // Add onPressed logic here
            var future = Get.find<MyMapController>().getCurrentPosition();
            locationBottomSheet();
          },
          child: const Icon(Icons.location_searching),
        ),
        body: Stack(
          children: [
            FlutterMap(
              mapController: Get.find<MyMapController>().mapController,
              options: MapOptions(
                initialCenter: const LatLng(48.422766, 9.9564),
                initialZoom: 16.0,
                // camera constraints
                maxZoom: 19,
                onTap: (tapPosition, point) {
                  print('Tap: $tapPosition, $point');
                  Get.find<MyMapController>().handleTap(tapPosition, point);
                },
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  maxZoom: 19,
                ),
                TranslucentPointer(
                  child: LevelLayer(
                    filter: (feature) => feature.type is Building,
                  ),
                ),

                // public transport
                TranslucentPointer(
                  child: LevelLayer(
                    filter: (feature) =>
                        feature.level == null &&
                        feature.type is PublicTransport,
                    polyCenterMarkerConstructor: (center, name) => Marker(
                      width: 100,
                      height: 100,
                      point: center,
                      child: const Icon(
                        Icons.train,
                        color: Colors.black,
                      ),
                      alignment: Alignment.center,
                    ),
                    polyConstructor: (feature) => feature
                        .getPolygon(
                            constructor: (pts) => Polygon(
                                  points: pts,
                                  color: Colors.green.withOpacity(0.2),
                                  borderColor: Colors.green,
                                  borderStrokeWidth: 1,
                                ))
                        .unwrap(),
                  ),
                ),

                // current level
                Obx(
                  () => Stack(
                      children: renderLevel(
                    Get.find<MyMapController>().currentLevel.value,
                  )),
                ),
                CurrentLocationLayer(),
              ],
            ),
            Positioned(
                left: 16,
                bottom: 16,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    children: [
                      Obx(
                        () => DropdownButton<int>(
                          value: Get.find<MyMapController>().currentLevel.value,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface),
                          dropdownColor: Theme.of(context).colorScheme.surface,
                          onChanged: (int? newValue) {
                            if (newValue != null) {
                              Get.find<MyMapController>().setLevel(newValue);
                            }
                            // Handle dropdown value change
                          },
                          items: Get.find<MyMapController>()
                              .levels
                              .map<DropdownMenuItem<int>>((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: Text("Level $value"),
                            );
                          }).toList(),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_upward),
                        onPressed: () {
                          int currentLevel =
                              Get.find<MyMapController>().currentLevel.value;
                          if (currentLevel <
                              Get.find<MyMapController>().levels.last) {
                            Get.find<MyMapController>()
                                .setLevel(currentLevel + 1);
                          }
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_downward),
                        onPressed: () {
                          int currentLevel =
                              Get.find<MyMapController>().currentLevel.value;
                          if (currentLevel >
                              Get.find<MyMapController>().levels.first) {
                            Get.find<MyMapController>()
                                .setLevel(currentLevel - 1);
                          }
                        },
                      ),
                    ],
                  ),
                )),
          ],
        ));
  }
}

void locationBottomSheet() {
  print(Get.find<MyMapController>().position.value);
  String buttonText = "Search for Location";
  IconData locationIcon = Icons.location_searching;
  bool spinner = false;
  Get.bottomSheet(
    Theme(
      data: ThemeData.light(),
      child: Container(
        constraints: const BoxConstraints(
            // minHeight: 300,
            ),
        width: Get.mediaQuery.size.width,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Select Location',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 300,
                    color: Colors.transparent,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: StatefulBuilder(builder: (context, setState) {
                    // TODO: make this persist closing the bottom sheet
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(300, 300),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.all(15),
                      ),
                      onPressed: () async {
                        if (spinner) {
                          return;
                        }
                        setState(() {
                          buttonText = "Searching...";
                          locationIcon = Icons.location_searching;
                          spinner = true;
                        });
                        final pos = await Get.find<MyMapController>()
                            .getCurrentPosition();
                        if (!context.mounted) {
                          return;
                        }
                        if (pos case Ok(:final ok)) {
                          setState(() {
                            buttonText = "Location found!";
                            locationIcon = Icons.my_location;
                            spinner = false;
                          });
                        } else {
                          setState(() {
                            buttonText = "Location not found! Try again";
                            locationIcon = Icons.error;
                            spinner = false;
                          });
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(locationIcon,
                                  size: 80,
                                  color: Get.theme.colorScheme.inversePrimary),
                              if (spinner)
                                CircularProgressIndicator(
                                  color: Get.theme.colorScheme.inversePrimary,
                                ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            buttonText,
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
            /*
            ListTile(
              title: const Text(
                'Current Location',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Get.back();
              },
            ),
            ListTile(
              title: const Text(
                'Search Location',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Get.back();
              },
            ),
            const SizedBox(height: 20),
            */
            ElevatedButton(
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    ),
    isScrollControlled: true,
    enterBottomSheetDuration: const Duration(milliseconds: 150),
    exitBottomSheetDuration: const Duration(milliseconds: 200),
  );
}
