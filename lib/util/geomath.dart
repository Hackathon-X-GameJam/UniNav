import 'dart:math';

import 'package:latlong2/latlong.dart';

LatLng polygonCenterMinmax(List<LatLng> polygon) {
  double minLat = double.infinity;
  double maxLat = double.negativeInfinity;
  double minLng = double.infinity;
  double maxLng = double.negativeInfinity;

  for (LatLng point in polygon) {
    minLat = min(minLat, point.latitude);
    maxLat = max(maxLat, point.latitude);
    minLng = min(minLng, point.longitude);
    maxLng = max(maxLng, point.longitude);
  }

  double centerLat = (minLat + maxLat) / 2;
  double centerLng = (minLng + maxLng) / 2;

  return LatLng(centerLat, centerLng);
}

LatLng polygonCenterAvg(List<LatLng> polygon) {
  double sumLat = 0;
  double sumLng = 0;

  for (LatLng point in polygon) {
    sumLat += point.latitude;
    sumLng += point.longitude;
  }

  double centerLat = sumLat / polygon.length;
  double centerLng = sumLng / polygon.length;

  return LatLng(centerLat, centerLng);
}
