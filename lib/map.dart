import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:rust_core/slice.dart';
import 'package:uninav/components/drawer.dart';
import 'package:uninav/components/hamburger_menu.dart';
import 'package:uninav/controllers/map_controller.dart';
import 'package:uninav/data/geo/model.dart';
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
            await Get.find<MyMapController>().loadGeoJson(
                await rootBundle.loadString('assets/geo/uulm_beta.geojson'));
          },
          child: const Icon(Icons.add),
        ),
        body: Stack(
          children: [
            FlutterMap(
              mapController: MapController(),
              options: MapOptions(
                center: LatLng(48.422766, 9.9564),
                zoom: 16.0,
                // camera constraints
                maxZoom: 19,
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                  maxZoom: 19,
                ),

                // buildings
                LevelLayer(
                  filter: (feature) => feature.type is Building,
                ),

                // public transport
                LevelLayer(
                  filter: (feature) =>
                      feature.level == null && feature.type is PublicTransport,
                  polyCenterMarkerConstructor: (center, name) => Marker(
                    width: 100,
                    height: 100,
                    point: center,
                    builder: (cx) => const Center(
                      child: Icon(
                        Icons.train,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  polyConstructor: (feature) => feature
                      .getPolygon(
                          constructor: (pts) => Polygon(
                                points: pts,
                                color: Colors.green.withOpacity(0.2),
                                borderColor: Colors.green,
                                isFilled: true,
                                borderStrokeWidth: 1,
                              ))
                      .unwrap(),
                ),

                // current level
                Obx(
                  () => Stack(
                    children: renderLevel(
                        Get.find<MyMapController>().currentLevel.value),
                  ),
                )

                // RichAttributionWidget(attributions: [
                //   TextSourceAttribution(
                //     'OpenStreetMap contributors',
                //     onTap: () =>
                //         launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
                //   )
                // ]),
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

List<Widget> renderLevel(int level) {
  return <Widget>[
    LevelLayer(
        filter: (feature) =>
            feature.level == level && feature.type is LectureHall,
        polyConstructor: (feature) => feature
            .getPolygon(
              constructor: (pts) => Polygon(
                points: pts,
                color: Colors.orange.withOpacity(0.2),
                borderColor: Colors.orange,
                isFilled: true,
                borderStrokeWidth: 1,
              ),
            )
            .unwrap(),
        markerConstructor: (feature) => Marker(
              width: 150,
              height: 60,
              point: feature.getPoint().unwrap(),
              builder: (cx) => Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.class_,
                      color: Colors.black,
                    ),
                    Text('${feature.name}'),
                  ],
                ),
              ),
            )),
    LevelLayer(
      filter: (feature) => feature.level == level && feature.type is Room,
      polyConstructor: (feature) => feature
          .getPolygon(
            constructor: (pts) => Polygon(
              points: pts,
              color: Colors.green.withOpacity(0.2),
              borderColor: Colors.green,
              isFilled: true,
              borderStrokeWidth: 1,
            ),
          )
          .unwrap(),
    ),
    LevelLayer(
      filter: (feature) => feature.level == level && feature.type is Door,
      markerConstructor: (feature) {
        final point = feature.getPoint().unwrap();
        return Marker(
          width: 20,
          height: 20,
          point: point,
          builder: (ctx) => const Icon(
            Icons.door_front_door,
            color: Colors.brown,
          ),
        );
      },
    ),
    LevelLayer(
      filter: (feature) => feature.level == level && feature.type is Toilet,
      markerConstructor: (feature) {
        final type = (feature.type as Toilet).toilet_type;
        IconData icon;
        switch (type.toLowerCase()) {
          case 'male':
            icon = Icons.male;
            break;
          case 'female':
            icon = Icons.female;
            break;
          case 'handicap':
            icon = Icons.wheelchair_pickup;
            break;
          default:
            print("WARN: Toilet didn't have recognizable type! "
                "(Level ${feature.level}, Name ${feature.name}, "
                "Location: ${feature.getPoint().unwrap()})");
            icon = Icons.wc;
            break;
        }

        final point = feature.getPoint().unwrap();
        return Marker(
          width: 20,
          height: 20,
          point: point,
          builder: (ctx) => Icon(
            icon,
            color: Colors.purple,
          ),
          rotateAlignment: Alignment.center,
        );
      },
    ),
    LevelLayer(
      filter: (feature) =>
          feature.type is Stairs &&
          (feature.type as Stairs).connects_levels.contains(level),
      markerConstructor: (feature) {
        final point = feature.getPoint().unwrap();
        return Marker(
          width: 20,
          height: 20,
          point: point,
          builder: (ctx) => Icon(
            Icons.stairs_outlined,
            color: Colors.deepPurple.shade300,
          ),
        );
      },
    ),
    LevelLayer(
      filter: (feature) =>
          feature.type is Lift &&
          (feature.type as Lift).connects_levels.contains(level),
      markerConstructor: (feature) {
        final point = feature.getPoint().unwrap();
        return Marker(
          width: 20,
          height: 20,
          point: point,
          builder: (ctx) => const Icon(
            Icons.elevator_outlined,
            color: Colors.deepPurple,
          ),
        );
      },
    ),
  ];
}

class LevelLayer extends StatelessWidget {
  final bool Function(Feature)? filter;
  final Polygon Function(Feature)? polyConstructor;
  final Marker Function(LatLng, String)? polyCenterMarkerConstructor;
  final Marker Function(Feature)? markerConstructor;
  final int? level;

  const LevelLayer({
    this.level,
    this.filter,
    this.polyConstructor,
    this.polyCenterMarkerConstructor,
    this.markerConstructor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final myMapController = Get.find<MyMapController>();

    return Obx(() {
      final List<Polygon> filteredPolygons = [];
      final List<Marker> polygonCenterMarkers = [];
      final List<Marker> filteredMarkers = [];

      for (final feature in myMapController.features) {
        if (filter == null || filter!(feature)) {
          if (feature.isPolygon()) {
            if (polyConstructor != null) {
              filteredPolygons.add(polyConstructor!(feature));
            } else {
              filteredPolygons.add(feature.getPolygon().unwrap());
            }

            // calculate polygon center
            final center =
                polygonCenterMinmax(feature.getPolygon().unwrap().points);
            if (polyCenterMarkerConstructor != null) {
              polygonCenterMarkers
                  .add(polyCenterMarkerConstructor!(center, feature.name));
            } else {
              polygonCenterMarkers.add(Marker(
                width: 100,
                height: 100,
                point: center,
                builder: (cx) => Center(
                  child: Text(
                    feature.name,
                    style: const TextStyle(
                      color: Colors.black54,
                      // backgroundColor: Colors.white,
                    ),
                  ),
                ),
              ));
            }
          } else if (feature.isPoint()) {
            if (markerConstructor != null) {
              filteredMarkers.add(markerConstructor!(feature));
            } else {
              final point = feature.getPoint().unwrap();
              filteredMarkers.add(Marker(
                width: 100,
                height: 100,
                point: point,
                builder: (cx) => Center(
                  child: Text(
                    feature.name,
                    style: const TextStyle(
                      color: Colors.black54,
                      // backgroundColor: Colors.white,
                    ),
                  ),
                ),
              ));
            }
          }
        }
      }
      // print(filteredPolygons.length);
      // print(filteredPolygons);

      // print(filteredPolygons[0].points[0]);
      // print(myMapController.features.length);

      final List<Widget> widgets = [];
      if (filteredPolygons.isNotEmpty) {
        if (polyConstructor != null) {
          widgets.add(PolygonLayer(polygons: filteredPolygons));
        } else {
          widgets.add(PolygonLayer(
              polygons: filteredPolygons
                  .map((poly) => Polygon(
                        points: poly.points,
                        borderColor: Colors.black26,
                        borderStrokeWidth: 2.0,
                      ))
                  .toList()));
        }
        widgets.add(MarkerLayer(
          markers: polygonCenterMarkers,
          rotate: true,
        ));
      }

      if (filteredMarkers.isNotEmpty) {
        widgets.add(MarkerLayer(markers: filteredMarkers, rotate: true));
      }

      return Stack(children: widgets);
    });
  }
}
