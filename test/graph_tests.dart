import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:uninav/controllers/map_controller.dart';
import 'package:uninav/data/geo/model.dart';
import 'package:uninav/nav/graph.dart';
import 'package:uninav/util/util.dart';

String formatGraphFeature(GraphFeature feature) {
  return feature.when(
    buildingFloor: (floor, building) => "(bfl ${building.name}:$floor)",
    portal: (fromFloor, from, toFloor, to, baseFeat) {
      return "(p ${formatFeatureTitle(baseFeat)} $from:$fromFloor -> $to:$toFloor)";
    },
    basicFeature: (lv, building, bf) =>
        "(bf ${formatFeatureTitle(bf)} $building:$lv)",
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('findAdjacent', () {
    late MyMapController mapController;
    late List<Feature> allFeatures;

    setUp(() async {
      // Initialize the MyMapController and load the GeoJSON data
      mapController = MyMapController();
      await mapController.loadGeoJson(
          await rootBundle.loadString('assets/geo/uulm_beta.geojson'));
      allFeatures = mapController.features;
    });

    test('generates a graph', () {
      // Find a building feature
      // final buildingFeature = allFeatures.firstWhere((f) => f.type is Building);
      final buildingFeature = allFeatures
          .firstWhere((f) => f.type is Building && eq(f.name, 'o28'));

      final graph = createGraph(
          wrap(buildingFeature, 2, buildingFeature.name).first, allFeatures);
      // print(graph);
    });

    test('generates a graph map', () {
      // Find a building feature
      // final buildingFeature = allFeatures.firstWhere((f) => f.type is Building);
      final buildingFeature = allFeatures
          .firstWhere((f) => f.type is Building && eq(f.name, 'o28'));

      final graph = createGraphMap(
          wrap(buildingFeature, 2, buildingFeature.name).first, allFeatures);

      print(graph.entries
          .map((entry) => "${formatGraphFeature(entry.key)}: "
              "{${entry.value.entries.map((e) => "${formatGraphFeature(entry.key)}: ${entry.value.map((key, value) => MapEntry(formatGraphFeature(key), value))}").join(', ')}")
          .join('\n'));
    });

    test('generates a graph list', () {
      // Find a building feature
      // final buildingFeature = allFeatures.firstWhere((f) => f.type is Building);
      final buildingFeature = allFeatures
          .firstWhere((f) => f.type is Building && eq(f.name, 'o28'));

      final graph = createGraphList(
          wrap(buildingFeature, 2, buildingFeature.name).first, allFeatures);
      var text = graph.map(formatGraphFeature).join(' ');
      print(text);
    });

    test('finds adjacent features for a building', () {
      // Find a building feature
      // final buildingFeature = allFeatures.firstWhere((f) => f.type is Building);
      final buildingFeature = allFeatures
          .firstWhere((f) => f.type is Building && eq(f.name, 'o28'));

      // Find adjacent features for the building
      final adjacentFeatures = findAdjacent(
          wrap(buildingFeature, 2, buildingFeature.name).first, allFeatures);

      final doorPortal = adjacentFeatures
          .firstWhere((f) => f is Portal && f.baseFeature.type is Door);
      print(
          "adjacent for building ${buildingFeature.name}: \n${adjacentFeatures.map((e) => "${e.toString()}\n")}");
      print(adjacentFeatures.map(unwrap).map(formatFeatureTitle));

      final doorAdjacentFeatures = findAdjacent(doorPortal, allFeatures);

      print("\n\ndoor $doorPortal : ");
      print(doorAdjacentFeatures.map((e) => "${e.toString()}\n"));
      print(doorAdjacentFeatures.map(unwrap).map(formatFeatureTitle));

      final stairsPortal = adjacentFeatures
          .firstWhere((f) => f is Portal && f.baseFeature.type is Stairs);

      final stairsAdjacentFeatures = findAdjacent(stairsPortal, allFeatures);

      print("\n\nstairs $stairsPortal : ");
      print(stairsAdjacentFeatures.map((e) => "${e.toString()}\n"));
      print(stairsAdjacentFeatures.map(unwrap).map(formatFeatureTitle));

      final baseFeature = adjacentFeatures.firstWhere((f) => f is BasicFeature);

      final baseAdjacentFeatures = findAdjacent(baseFeature, allFeatures);

      print("\n\nbase $baseFeature : ");
      print(baseAdjacentFeatures.map((e) => "${e.toString()}\n"));
      print(baseAdjacentFeatures.map(unwrap).map(formatFeatureTitle));

      // Check if all adjacent features are in the same building
      expect(
          true, // TODO
          true);
    });

    test('tries to find a path through the graph using own method', () async {
      // Find a building feature
      // final buildingFeature = allFeatures.firstWhere((f) => f.type is Building);
      final startFeature = allFeatures
          .firstWhere((f) => f.type is Building && eq(f.name, 'o28'));

      // final endFeature = allFeatures
      //     .firstWhere((f) => f.type is Building && eq(f.name, 'o25'));

      final endFeature = allFeatures
          .firstWhere((f) => f.type is LectureHall && eq(f.name, 'H1'));

      print(endFeature);

      final path = findShortestPath(
        wrap(startFeature, 2, startFeature.name).first,
        // wrap(endFeature, 2, endFeature.name).first,
        wrap(endFeature, endFeature.level!, endFeature.building!).first,
        allFeatures,
      );
      print(path
          .unwrap()
          .map((e) => "${formatGraphFeature(e.$1)} (${e.$2}m)")
          .join(' -> '));
    });

    /*
    test('tries to find a path through the graph', () async {
      // Find a building feature
      // final buildingFeature = allFeatures.firstWhere((f) => f.type is Building);
      final startFeature = allFeatures
          .firstWhere((f) => f.type is Building && eq(f.name, 'o28'));

      final endFeature = allFeatures
          .firstWhere((f) => f.type is Building && eq(f.name, 'o25'));

      // final endFeature = allFeatures
      //     .firstWhere((f) => f.type is LectureHall && eq(f.name, 'H1'));

      final graph = createGraph(
          wrap(startFeature, 2, startFeature.name).first, allFeatures);

      final path = await Future.any([
        Future.delayed(const Duration(seconds: 5),
            () => throw TimeoutException('Test timed out after 5 seconds')),
        Future(() => graph.shortestPath(
              wrap(startFeature, 1, startFeature.name).first,
              wrap(endFeature, 2, endFeature.name).first,
              //wrap(endFeature, endFeature.level!, endFeature.building!).first,
            )),
      ]);

      print(path.map(formatGraphFeature).join('\n'));
    });
    */
  });
}
