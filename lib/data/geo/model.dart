import 'package:anyhow/anyhow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geojson_vi/geojson_vi.dart';
import 'package:latlong2/latlong.dart';

part 'model.freezed.dart';

@freezed
class Feature with _$Feature {
  const Feature._();

  const factory Feature({
    required String name,
    required FeatureType type,
    String? description,
    required GeoJSONGeometry geometry,
    int? level,
  }) = _Feature;

  bool isPolygon() {
    return geometry is GeoJSONPolygon;
  }

  bool isPoint() {
    return geometry is GeoJSONPoint;
  }

  Result<Polygon> getPolygon({Polygon Function(List<LatLng>)? constructor}) {
    if (isPolygon()) {
      constructor ??= (pts) => Polygon(
            points: pts,
            borderColor: Colors.black26,
            borderStrokeWidth: 2.0,
          );
      final polygon = geometry as GeoJSONPolygon;
      // print(polygon.geometry!.geoSeries[0].geoPoints);
      final points =
          // polygon.coordinates[0].map((e) => LatLng(e[0], e[1])).toList();
          polygon.coordinates[0].map((e) => LatLng(e[1], e[0])).toList();

      // print(points);
      return Ok(constructor(points));
    } else {
      return bail("Feature Geometry is not a Polygon");
    }
  }

  Result<LatLng> getPoint() {
    if (isPoint()) {
      final point = geometry as GeoJSONPoint;
      return Ok(LatLng(point.coordinates[1], point.coordinates[0]));
    } else {
      return bail("Feature Geometry is not a Point");
    }
  }
}

@freezed
class FeatureType with _$FeatureType {
  // multiple feature types like lecture hall, toliet, ...
  const factory FeatureType.building() = Building;
  const factory FeatureType.lectureHall() = LectureHall;
  const factory FeatureType.room() = Room;
  const factory FeatureType.door(List<String> connects) = Door;
  const factory FeatureType.toilet(String toilet_type) = Toilet;
  const factory FeatureType.stairs(List<int> connects_levels) = Stairs;
  const factory FeatureType.lift(List<int> connects_levels) = Lift;
  const factory FeatureType.publicTransport(
      List<String> bus_lines, List<String> tram_lines) = PublicTransport;
}
