import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:uninav/controllers/map_controller.dart';
import 'package:uninav/data/geo/model.dart';
import 'package:uninav/map.dart';
import 'package:uninav/util/geomath.dart';
import 'package:uninav/util/util.dart';

List<Widget> renderLevel(
  int level,
) {
  return <Widget>[
    // Lecture Halls
    LevelLayer(
      filter: (feature) =>
          feature.level == level && feature.type is LectureHall,
      polyConstructor: (feature) => feature
          .getPolygon(
            constructor: (pts) => Polygon(
              points: pts,
              color: Colors.orange.withOpacity(0.2),
              borderColor: Colors.orange,
              borderStrokeWidth: 2,
            ),
          )
          .unwrap(),
      markerConstructor: (feature) => Marker(
        width: 50,
        height: 20,
        point: feature.getPoint().unwrap(),
        child: Column(
          children: [
            Icon(
              Icons.class_,
              color: Colors.black,
            ),
            Text('${feature.name}'),
          ],
        ),
        alignment: Alignment.center,
      ),
    ),

    // Rooms (Seminar Rooms)
    LevelLayer(
        filter: (feature) => feature.level == level && feature.type is Room,
        polyConstructor: (feature) => feature
            .getPolygon(
              constructor: (pts) => Polygon(
                points: pts,
                color: Colors.green.withOpacity(1.2),
                borderColor: Colors.green,
                borderStrokeWidth: 2,
              ),
            )
            .unwrap(),
        markerConstructor: (feature) => Marker(
              width: 100,
              height: 70,
              point: feature.getPoint().unwrap(),
              child: Column(
                children: [
                  const Icon(
                    Icons.co_present_rounded,
                    color: Colors.amber,
                  ),
                  Text(
                    (feature.type as Room).roomNumber,
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              ),
              alignment: Alignment.center,
            )),
    // Doors Layer
    LevelLayer(
      filter: (feature) => feature.level == level && feature.type is Door,
      markerConstructor: (feature) {
        final point = feature.getPoint().unwrap();
        return Marker(
          width: 21,
          height: 21,
          point: point,
          child: const Icon(
            Icons.door_front_door,
            color: Colors.brown,
          ),
          alignment: Alignment.center,
        );
      },
    ),

    // Food and Drink Layer
    LevelLayer(
      filter: (feature) => feature.level == level && feature.type is FoodDrink,
      markerConstructor: (feature) {
        final point = feature.getPoint().unwrap();
        return Marker(
          width: 21,
          height: 21,
          point: point,
          child: const Icon(
            Icons.restaurant,
            color: Colors.deepOrange,
          ),
          alignment: Alignment.center,
        );
      },
      polyConstructor: (feature) => feature
          .getPolygon(
            constructor: (pts) => Polygon(
              points: pts,
              color: Colors.deepOrange.withOpacity(0.2),
              borderColor: Colors.deepOrange,
              borderStrokeWidth: 2,
            ),
          )
          .unwrap(),
    ),

    // PC Pools layer
    LevelLayer(
      filter: (feature) => feature.level == level && feature.type is PcPool,
      markerConstructor: (feature) {
        final point = feature.getPoint().unwrap();
        return Marker(
          width: 100,
          height: 70,
          point: point,
          child: Column(
            children: [
              const Icon(
                Icons.computer,
                color: Colors.cyan,
              ),
              Text(
                (feature.type as PcPool).roomNumber,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
          alignment: Alignment.center,
        );
      },
      polyConstructor: (feature) => feature
          .getPolygon(
            constructor: (pts) => Polygon(
              points: pts,
              color: Colors.cyan.withOpacity(0.2),
              borderColor: Colors.cyan,
              borderStrokeWidth: 2,
            ),
          )
          .unwrap(),
    ),

    // Toilets Layer
    LevelLayer(
      filter: (feature) => feature.level == level && feature.type is Toilet,
      markerConstructor: (feature) {
        final type = (feature.type as Toilet).toilet_type;

        final point = feature.getPoint().unwrap();
        return Marker(
          width: 21,
          height: 21,
          point: point,
          child: Icon(
            findToiletIcon(type),
            color: Colors.blue.shade700,
          ),
          alignment: Alignment.center,
        );
      },
    ),

    // Stairs layer
    LevelLayer(
      filter: (feature) =>
          feature.type is Stairs &&
          (feature.type as Stairs).connects_levels.contains(level),
      markerConstructor: (feature) {
        final point = feature.getPoint().unwrap();
        return Marker(
          width: 21,
          height: 21,
          point: point,
          child: Icon(
            Icons.stairs_outlined,
            color: Colors.deepPurple.shade300,
          ),
          alignment: Alignment.center,
        );
      },
    ),

    // Lift layer
    LevelLayer(
      filter: (feature) =>
          feature.type is Lift &&
          (feature.type as Lift).connects_levels.contains(level),
      markerConstructor: (feature) {
        final point = feature.getPoint().unwrap();
        return Marker(
          width: 21,
          height: 21,
          point: point,
          child: const Icon(
            Icons.elevator_outlined,
            color: Colors.deepPurple,
          ),
          alignment: Alignment.center,
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
              filteredPolygons.add(feature
                  .getPolygon(
                      constructor: (points) => Polygon(
                            points: points,
                            borderColor: Colors.black26,
                            borderStrokeWidth: 2.0,
                          ))
                  .unwrap());
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
                child: Center(
                  child: Text(
                    feature.name,
                    style: const TextStyle(
                      color: Colors.black54,
                      // backgroundColor: Colors.white,
                    ),
                  ),
                ),
                alignment: Alignment.center,
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
                child: Center(
                  child: Text(
                    feature.name,
                    style: const TextStyle(
                      color: Colors.black54,
                      // backgroundColor: Colors.white,
                    ),
                  ),
                ),
                alignment: Alignment.center,
              ));
            }
          }
        }
      }
      // print(filteredPolygons.length);
      // print(filteredPolygons);

      // print(filteredPolygons[0].points[0]);
      // print(myMapController.features.length);

      // filteredPolygons.forEach((element) {
      //   print(element.hitValue);
      // });

      final List<Widget> widgets = [];
      if (filteredPolygons.isNotEmpty) {
        if (polyConstructor != null) {
          widgets.add(TranslucentPointer(
            child: PolygonLayer(
              polygons: filteredPolygons,
            ),
          ));
        } else {
          widgets.add(TranslucentPointer(
            child: PolygonLayer(
              polygons: filteredPolygons,
            ),
          ));
        }
        widgets.add(TranslucentPointer(
          child: MarkerLayer(
            markers: polygonCenterMarkers,
            rotate: true,
          ),
        ));
      }

      if (filteredMarkers.isNotEmpty) {
        widgets.add(TranslucentPointer(
          child: MarkerLayer(markers: filteredMarkers, rotate: true),
        ));
      }

      return Stack(children: widgets);
    });
  }
}
