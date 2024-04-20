import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:uninav/controllers/map_controller.dart';
import 'package:uninav/data/geo/model.dart';
import 'package:uninav/map.dart';
import 'package:uninav/util/geomath.dart';

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
