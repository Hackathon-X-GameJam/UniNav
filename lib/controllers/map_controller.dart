import 'dart:convert';

import 'package:anyhow/anyhow.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geojson_vi/geojson_vi.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:uninav/components/feature_bottom_sheet.dart';
import 'package:uninav/data/geo/model.dart';
import 'package:uninav/data/geo/parser.dart';
import 'package:uninav/util/geojson_util.dart';
import 'package:uninav/util/geomath.dart';

class MyMapController extends GetxController {
  final MapController mapController = MapController();

  final RxList<Feature> features = <Feature>[].obs;
  final currentLevel = 1.obs;
  final levels = <int>[1].obs;
  @override
  onInit() async {
    print("init");
    ever(features, refreshLevels);
    super.onInit();
  }

  void refreshLevels(List<Feature> curFeatures) {
    print("refreshLevels");
    final newLevels = <int>[1];
    for (final feature in curFeatures) {
      if (feature.level != null && !newLevels.contains(feature.level)) {
        newLevels.add(feature.level!);
      }
    }
    newLevels.sort();
    levels.value = newLevels;
  }

  Result<void> setLevel(int level) {
    // check that level is in features
    if (!levels.contains(level)) {
      return bail('Level $level is not in features');
    }

    currentLevel.value = level;
    return const Ok(());
  }

  List<Feature> computeHits(LatLng position, {bool Function(Feature)? filter}) {
    final hits = <(Feature, double)>[];
    for (final feature in features) {
      if (filter != null && !filter(feature)) {
        continue;
      }
      if (feature.isPolygon()) {
        if ((feature.geometry as GeoJSONPolygon)
            .isPointInside(latLonToGeoJSON(position))) {
          // compute distance to center of polygon
          final distance = distanceBetweenLatLng(
              polygonCenterMinmax((feature.geometry as GeoJSONPolygon)
                  .coordinates[0]
                  .map(geoJSONToLatLon)
                  .toList()),
              position,
              'meters');
          hits.add((feature, distance));
        }
      } else if (feature.isPoint()) {
        final distance = distanceBetweenLatLng(
            geoJSONToLatLon((feature.geometry as GeoJSONPoint).coordinates),
            position,
            'meters');
        if (distance <= 5) {
          hits.add((feature, distance));
        }
      }
    }
    hits.sort((a, b) => a.$2.compareTo(b.$2));
    return hits.map((e) => e.$1).toList();
  }

  Future<void> loadGeoJson(String geoJsonString) async {
    try {
      // print(geoJsonString);

      final featuresList = <Feature>[];

      // print('doing');
      final geojson = GeoJSONFeatureCollection.fromJSON(geoJsonString);
      // print('done');

      for (final feature in geojson.features) {
        // print(feature);
        // print(feature?.properties);
        if (feature == null) continue;
        // print(feature.properties);
        final parsed = parseFeature(feature.properties ?? <String, dynamic>{},
            feature.geometry, feature.id);
        if (parsed case Ok(:final ok)) {
          featuresList.add(ok);
        }
      }

      features.value = featuresList;
    } catch (e) {
      print('Error parsing GeoJSON: $e');
    }
  }

  void handleTap(TapPosition tapPosition, LatLng point) {
    final hits = Get.find<MyMapController>().computeHits(point,
        filter: (feature) =>
            feature.isOnLevel(null) /* is not on a level */ ||
            feature.isOnLevel(Get.find<MyMapController>().currentLevel.value));
    print('Hits: ${hits.map((e) => e.name)}');
    if (hits.isNotEmpty) {
      focusOnFeature(hits[0],
          move: false,
          closestFeatures:
              hits.length > 1 ? hits.skip(1).toList() : null); // closest match
    }
  }

  void focusOnFeature(Feature feature,
      {bool move = true, List<Feature>? closestFeatures}) {
    try {
      if (move) {
        mapController.move(
          feature
              .getCenterPoint()
              .expect("Couldn't find Center Point of target geometry"),
          mapController.camera.zoom,
        );
      }
    } catch (e) {
      print("Error moving map controller: $e");
    }
    showFeatureBottomSheet(feature, closestFeatures);
  }
}
