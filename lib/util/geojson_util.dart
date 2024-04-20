import 'package:geojson_vi/geojson_vi.dart';
import 'package:latlong2/latlong.dart';
import 'dart:math';

void swapLatLonGeojsonGeometry(GeoJSONGeometry geometry) {
  if (geometry is GeoJSONPolygon) {
    geometry.coordinates[0] =
        geometry.coordinates[0].map((e) => [e[1], e[0]]).toList();
  } else if (geometry is GeoJSONPoint) {
    geometry.coordinates = [geometry.coordinates[1], geometry.coordinates[0]];
  } else {
    throw UnimplementedError(
        "Geometry of type ${geometry.runtimeType} point swapping is unimplemented");
  }
}

List<double> latLonToGeoJSON(LatLng point) {
  return [point.longitude, point.latitude];
}

LatLng geoJSONToLatLon(List<double> point) {
  return LatLng(point[1], point[0]);
}

double degreesToRadians(double degrees) {
  return degrees * (pi / 180);
}

double radiansToDegrees(double radians) {
  return radians * (180 / pi);
}

double bearingBetweenLatLng(LatLng point1, LatLng point2) {
  return bearingBetween(
    point1.latitude,
    point1.longitude,
    point2.latitude,
    point2.longitude,
  );
}

double bearingBetween(double lat1, double lon1, double lat2, double lon2) {
  var dLon = degreesToRadians(lon2 - lon1);
  var y = sin(dLon) * cos(degreesToRadians(lat2));
  var x = cos(degreesToRadians(lat1)) * sin(degreesToRadians(lat2)) -
      sin(degreesToRadians(lat1)) * cos(degreesToRadians(lat2)) * cos(dLon);
  var angle = atan2(y, x);
  return (radiansToDegrees(angle) + 360) % 360;
}

double distanceBetweenLatLng(LatLng point1, LatLng point2, String unit) {
  return distanceBetween(point1.latitude, point1.longitude, point2.latitude,
      point2.longitude, unit);
}

double distanceBetween(
    double lat1, double lon1, double lat2, double lon2, String unit) {
  const earthRadius = 6371; // in km
  // assuming earth is a perfect sphere(it's not)

  // Convert degrees to radians
  final lat1Rad = degreesToRadians(lat1);
  final lon1Rad = degreesToRadians(lon1);
  final lat2Rad = degreesToRadians(lat2);
  final lon2Rad = degreesToRadians(lon2);

  final dLat = lat2Rad - lat1Rad;
  final dLon = lon2Rad - lon1Rad;

  // Haversine formula
  final a = pow(sin(dLat / 2), 2) +
      cos(lat1Rad) * cos(lat2Rad) * pow(sin(dLon / 2), 2);
  final c = 2 * atan2(sqrt(a), sqrt(1 - a));

  final distance = earthRadius * c;

  return toRequestedUnit(unit, distance);

  // return distance; // in km
}

double toRequestedUnit(String unit, double distanceInKm) {
  switch (unit) {
    case 'kilometers':
      return distanceInKm;
    case 'meters':
      return distanceInKm * 1000;
    case 'miles':
      return (distanceInKm * 1000) / 1609.344;
    case 'yards':
      return distanceInKm * 1093.61;
    case '':
      return distanceInKm;
  }
  return distanceInKm;
}
