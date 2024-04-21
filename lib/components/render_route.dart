import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:rust_core/iter.dart';
import 'package:uninav/controllers/navigation_controller.dart';
import 'package:uninav/nav/graph.dart';

class NavigationPathLayer extends StatelessWidget {
  const NavigationPathLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // compute the polylines and markers
      List<(GraphFeature, double)> route =
          Get.find<NavigationController>().nav.iter().toList();

      // distance-position pairs
      // List<Polyline> polylines = [];

      List<LatLng> polylinePoints =
          route.map((e) => e.$1.getCenter().unwrap()).toList();

      return PolylineLayer(polylines: [
        Polyline(
          points: polylinePoints,
          strokeWidth: 4.0,
          color: Colors.blue,
        ),
      ]);
    });
  }
}
