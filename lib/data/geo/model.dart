import 'package:anyhow/anyhow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geojson_vi/geojson_vi.dart';
import 'package:latlong2/latlong.dart';
import 'package:uninav/util/geojson_util.dart';
import 'package:uninav/util/geomath.dart';

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
    String? building,
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
            hitValue: 'test${pts.length}',
          );
      final polygon = geometry as GeoJSONPolygon;
      // print(polygon.geometry!.geoSeries[0].geoPoints);
      final points =
          // polygon.coordinates[0].map((e) => LatLng(e[0], e[1])).toList();
          polygon.coordinates[0].map(geoJSONToLatLon).toList();

      // print(points);
      return Ok(constructor(points));
    } else {
      return bail("Feature Geometry is not a Polygon");
    }
  }

  Result<LatLng> getPoint() {
    if (isPoint()) {
      final point = geometry as GeoJSONPoint;
      return Ok(geoJSONToLatLon(point.coordinates));
    } else {
      return bail("Feature Geometry is not a Point");
    }
  }

  /// Checks if the current feature is on the specified layer.
  ///
  /// For features that represent lifts or stairs, this method checks if the
  /// feature's `connects_levels` list contains the specified layer.
  ///
  /// For other feature types, this method simply checks if the feature's `level`
  /// property matches the specified layer.
  ///
  /// @param layer The layer to check for. **Layer can be `null`!**
  ///        `null` matches things such as Buildings without a layer.
  /// @return `true` if the feature is on the specified layer, `false` otherwise.
  bool isOnLevel(int? layer) {
    if (type is Lift) {
      return (type as Lift).connects_levels.contains(layer);
    } else if (type is Stairs) {
      return (type as Stairs).connects_levels.contains(layer);
    }
    return level == layer;
  }

  Result<LatLng> getCenterPoint() {
    if (isPolygon()) {
      final polygon = geometry as GeoJSONPolygon;
      final points = polygon.coordinates[0].map(geoJSONToLatLon).toList();
      return Ok(polygonCenterMinmax(points));
    } else if (isPoint()) {
      final point = geometry as GeoJSONPoint;
      return Ok(geoJSONToLatLon(point.coordinates));
    } else {
      return bail("Feature Geometry is not a Polygon or Point");
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
