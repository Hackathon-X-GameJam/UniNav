import 'package:anyhow/anyhow.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rust_core/iter.dart';
import 'package:uninav/controllers/map_controller.dart';
import 'package:uninav/data/geo/model.dart';
import 'package:uninav/nav/graph.dart';

class NavigationController extends GetxController {
  // Add controller logic and variables here

  final RxList<(GraphFeature, double)> nav = RxList();

  final Rx<GraphFeature?> position = Rx(null);

  void navigate(
      GraphFeature start, bool Function(GraphFeature) endSelector) async {
    position.value = start;

    final path = await compute(
      (data) {
        final start = data.$1;
        final endSelector = data.$2;
        final features = data.$3;

        final path = findShortestPath(start, endSelector, features);

        return path;
      },
      (
        start,
        endSelector,
        Get.find<MyMapController>().features.iter().toList()
      ),
    );

    if (path.isErr()) {
      Get.snackbar(
        'Navigation Error',
        'Unable to find a path to the destination\nMessage: ${path.unwrapErr().toString().split('\n')[0]}',
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
        colorText: Colors.white,
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      );
      return;
    }

    nav.value = path.unwrap();
    update();
  }

  void updatePosition(GraphFeature? newPosition) {
    position.value = newPosition;
    update();
  }
}

class _PathFindingData {
  final GraphFeature start;
  final bool Function(GraphFeature) endSelector;
  final List<Feature> features;

  _PathFindingData(this.start, this.endSelector, this.features);
}

Result<List<(GraphFeature, double)>> _findShortestPathIsolate(
    _PathFindingData data) {
  return findShortestPath(data.start, data.endSelector, data.features);
}
