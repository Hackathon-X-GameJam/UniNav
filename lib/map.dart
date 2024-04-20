import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
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
    final LayerHitNotifier hitNotifier = ValueNotifier(null);
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
            await Get.find<MyMapController>().loadGeoJson(
                await rootBundle.loadString('assets/geo/uulm_beta.geojson'));
          },
          child: const Icon(Icons.add),
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
                    notifier: hitNotifier,
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
                                  hitValue: feature,
                                ))
                        .unwrap(),
                    notifier: hitNotifier,
                  ),
                ),

                // current level
                Obx(
                  () => Stack(
                      children: renderLevel(
                          Get.find<MyMapController>().currentLevel.value,
                          hitNotifier: hitNotifier)),
                ),
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
                  child: Obx(
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
                )),
          ],
        ));
  }
}
