import 'package:flutter/material.dart';
import 'package:uninav/data/geo/model.dart';

bool eq(String? a, String? b) => a?.toLowerCase() == b?.toLowerCase();

String formatDuration(Duration duration) {
  final days = duration.inDays;
  final hours = duration.inHours.remainder(24);
  final minutes = duration.inMinutes.remainder(60);
  final seconds = duration.inSeconds.remainder(60);

  String plural(int thing) => thing == 1 ? '' : 's';

  if (days > 0) {
    return '$days day${plural(days)}, $hours hour${plural(hours)}';
  } else if (hours > 0) {
    return '$hours hour${plural(hours)}, $minutes minute${plural(minutes)}';
  } else if (minutes > 0) {
    return '$minutes minute${plural(minutes)}, $seconds second${plural(seconds)}';
  } else {
    return '$seconds second${plural(seconds)}';
  }
}

String formatFeatureTitle(Feature feature) {
  return feature.type.when(
    building: () => '${feature.name} (Building)',
    lectureHall: () => '${feature.name} (Lecture Hall)',
    room: (number) => 'Room ${feature.building ?? "??"}/$number',
    pcPool: (number) => 'PC Pool ${feature.name}',
    foodDrink: () => '${feature.name} (Food/Drink)',
    door: (_) => 'Door',
    toilet: (type) => 'Toilet (${formatToiletType(feature.type as Toilet)})',
    stairs: (_) => 'Stairs',
    lift: (_) => 'Lift',
    publicTransport: (_, __) => 'Public Transport',
  );
}

String formatToiletType(Toilet toilet) {
  final type = toilet.toilet_type.toLowerCase();
  switch (type) {
    case 'male':
      return 'Male';
    case 'female':
      return 'Female';
    case 'handicap':
      return 'Handicap';
    default:
      return 'Unknown';
  }
}

String formatDistance(int distanceInMeters) {
  if (distanceInMeters < 1000) {
    // If the distance is less than 1 kilometer, display it in meters.
    return '${distanceInMeters}m';
  } else {
    // If the distance is 1 kilometer or more, display it in kilometers and meters.
    final kilometers =
        distanceInMeters ~/ 1000; // Integer division to get whole kilometers.
    final meters =
        distanceInMeters % 1000; // Remainder to get the remaining meters.
    if (meters == 0) {
      // If there are no remaining meters, display only kilometers.
      return '${kilometers}km';
    } else {
      // If there are remaining meters, display both kilometers and meters.
      return '${kilometers}km ${meters}m';
    }
  }
}

IconData findToiletIcon(String type) {
  switch (type.toLowerCase()) {
    case 'male':
      return Icons.male;
    case 'female':
      return Icons.female;
    case 'handicap':
      return Icons.accessible;
    default:
      print("WARN: Toilet didn't have recognizable type! Type was '$type'");
      return Icons.wc;
  }
}
