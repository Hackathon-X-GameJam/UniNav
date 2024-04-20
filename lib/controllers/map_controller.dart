import 'dart:convert';

import 'package:anyhow/anyhow.dart';
import 'package:geojson_vi/geojson_vi.dart';
import 'package:get/get.dart';
import 'package:uninav/data/geo/model.dart';
import 'package:uninav/data/geo/parser.dart';

class MyMapController extends GetxController {
  // constructor that calls loadgeojson with a default geojson string
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

  Future<void> loadGeoJson(String geoJsonString) async {
    try {
      // print(geoJsonString);

      final featuresList = <Feature>[];

      print('doing');
      final geojson = GeoJSONFeatureCollection.fromJSON(geoJsonString);
      print('done');

      for (final feature in geojson.features) {
        print(feature);
        print(feature?.properties);
        if (feature == null) continue;
        print(feature.properties);
        final parsed = parseFeature(
            feature.properties ?? <String, dynamic>{}, feature.geometry);
        if (parsed case Ok(:final ok)) {
          featuresList.add(ok);
        }
      }

      features.value = featuresList;
    } catch (e) {
      print('Error parsing GeoJSON: $e');
    }
  }
}
