import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uninav/components/colorful_chips.dart';
import 'package:uninav/controllers/map_controller.dart';
import 'package:uninav/controllers/navigation_controller.dart';
import 'package:uninav/data/geo/model.dart';
import 'package:uninav/nav/graph.dart';
import 'package:uninav/util/util.dart';

final _colorfulBoxDeco = BoxDecoration(
  color: Colors.black,
  border: Border.all(color: Colors.orange, width: 2),
  borderRadius: BorderRadius.circular(10),
);

Future<void> showFeatureBottomSheet(
    Feature feature, List<Feature>? closestFeatures) {
  return Get.bottomSheet(
    Theme(
      data: ThemeData.light(),
      child: Container(
        constraints: const BoxConstraints(
            // minHeight: 300,
            ),
        width: Get.mediaQuery.size.width,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Center(
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(formatFeatureTitle(feature),
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 14),
          if (closestFeatures != null) ...[
            const Text('Did you mean:'),
            Wrap(
              spacing: 8,
              children: closestFeatures
                  .map((nearFeature) => ColorfulActionChip(
                        label: formatFeatureTitle(nearFeature),
                        onPressed: () {
                          Get.back();
                          final newClosestFeatures = closestFeatures
                              .where((element) => element != nearFeature)
                              .toList();
                          newClosestFeatures.add(feature);

                          Get.find<MyMapController>().focusOnFeature(
                              nearFeature,
                              closestFeatures: newClosestFeatures);
                        },
                      ))
                  .toList(),
            ),
            const SizedBox(height: 14),
          ],
          if (feature.description != null) ...[
            Text(feature.description!),
            const SizedBox(height: 10),
          ],
          ..._buildFeatureContent(feature),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                child: const Row(
                  children: [
                    Icon(
                      Icons.share_location,
                      color: Colors.black,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "Start Navigation",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                onPressed: () {
                  print("trying to start navigation...");
                  final navController = Get.find<NavigationController>();
                  final mapController = Get.find<MyMapController>();

                  // make feature into graphFeature
                  final wrapped = wrap(
                          feature,
                          mapController.currentLevel.value,
                          feature.buildingName ?? "")
                      .first;

                  print("1");
                  Get.back();
                  if (navController.position.value == null) {
                    print("2");
                    Get.snackbar(
                      "Navigation failed!",
                      "Please set your position first!",
                      snackPosition: SnackPosition.BOTTOM,
                      margin: const EdgeInsets.only(
                          bottom: 20, left: 10, right: 10),
                      colorText: Colors.white,
                      backgroundColor: Colors.red,
                      duration: const Duration(seconds: 3),
                    );
                  } else {
                    print("3");
                    navController.navigate(navController.position.value!,
                        (feature) => feature.id == wrapped.id);
                  }
                  print("4");
                },
              ),
            ],
          )
        ]),
      ),
    ),
    isScrollControlled: true,
    enterBottomSheetDuration: const Duration(milliseconds: 150),
    exitBottomSheetDuration: const Duration(milliseconds: 200),
  );
}

List<Widget> _buildFeatureContent(Feature feature) {
  return feature.type.when(
    building: () => _buildBuildingContent(feature),
    lectureHall: () => _buildLectureHallContent(feature),
    room: (number) => _buildRoomContent(feature, number),
    pcPool: (number) => _buildPcPoolContent(feature, number),
    foodDrink: () => _buildFoodAndDrinkContent(feature),
    door: (connects) => _buildDoorContent(feature, connects),
    toilet: (toiletType) => _buildToiletContent(feature, toiletType),
    stairs: (connectsLevels) => _buildStairsContent(feature, connectsLevels),
    lift: (connectsLevels) => _buildLiftContent(feature, connectsLevels),
    publicTransport: (busLines, tramLines) =>
        _buildPublicTransportContent(feature, busLines, tramLines),
  );
}

/// Builds the content for the Building feature type.
List<Widget> _buildBuildingContent(Feature feature) {
  return [
    Text(feature.name),
  ];
}

/// Builds the content for the LectureHall feature type.
List<Widget> _buildLectureHallContent(Feature feature) {
  return [Text('Lecture Hall: ${feature.name}')];
}

/// Builds the content for the Room feature type.
List<Widget> _buildRoomContent(Feature feature, String roomNumber) {
  return [Text('Room: ${feature.name}')];
}

List<Widget> _buildPcPoolContent(Feature feature, String roomNumber) {
  return [Text('PC Pool: ${feature.name}')];
}

List<Widget> _buildFoodAndDrinkContent(Feature feature) {
  return [Text('${feature.name} (Food/Drink)')];
}

/// Builds the content for the Door feature type.
List<Widget> _buildDoorContent(Feature feature, List<String> connects) {
  return [
    Text(
      feature.name,
      style: const TextStyle(fontSize: 18),
    ),
    const SizedBox(height: 10),
    if (connects.isNotEmpty) ...[
      const Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(right: 4),
          child: Text(
            'Connects:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Wrap(
          spacing: 8,
          runSpacing: 4,
          children: connects.map((place) {
            return ColorfulChip(label: place.toString());
          }).toList(),
        ),
      ),
    ],
  ];
}

/// Builds the content for the Toilet feature type.
List<Widget> _buildToiletContent(Feature feature, String toiletType) {
  return [
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.wc,
          size: 60,
          color: Colors.white,
        ),
        Icon(
          findToiletIcon(toiletType),
          size: 60,
          color: Colors.white,
        )
      ],
    )
  ];
}

/// Builds the content for the Stairs feature type.
List<Widget> _buildStairsContent(Feature feature, List<int> connectsLevels) {
  return [
    Text(
      feature.name,
      style: const TextStyle(fontSize: 18),
    ),
    const SizedBox(height: 10),
    if (connectsLevels.isNotEmpty) ...[
      const Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(right: 4),
          child: Text(
            'Connects Levels:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Wrap(
          spacing: 8,
          runSpacing: 4,
          children: connectsLevels.map((level) {
            return ColorfulChip(label: level.toString());
          }).toList(),
        ),
      ),
    ],
  ];
}

/// Builds the content for the Lift feature type.
List<Widget> _buildLiftContent(Feature feature, List<int> connectsLevels) {
  return [
    Text(
      feature.name,
      style: const TextStyle(fontSize: 18),
    ),
    const SizedBox(height: 10),
    if (connectsLevels.isNotEmpty) ...[
      const Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(right: 4),
          child: Text(
            'Connects Levels:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Wrap(
          spacing: 8,
          runSpacing: 4,
          children: connectsLevels.map((level) {
            return ColorfulChip(label: level.toString());
          }).toList(),
        ),
      ),
    ],
  ];
}

/// Builds the content for the PublicTransport feature type.
List<Widget> _buildPublicTransportContent(
    Feature feature, List<String> busLines, List<String> tramLines) {
  return [
    Text(
      feature.name,
      style: const TextStyle(fontSize: 18),
    ),
    const SizedBox(height: 10),
    if (busLines.isNotEmpty) ...[
      const Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(right: 4),
          child: Text(
            'Bus Lines:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Wrap(
          spacing: 8,
          runSpacing: 4,
          children: busLines.map((line) {
            return ColorfulChip(label: line);
          }).toList(),
        ),
      ),
      const SizedBox(height: 10),
    ],
    if (tramLines.isNotEmpty) ...[
      const Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(right: 4),
          child: Text(
            'Tram Lines:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Wrap(
          spacing: 8,
          runSpacing: 4,
          children: tramLines.map((line) {
            return ColorfulChip(label: line);
          }).toList(),
        ),
      ),
    ],
  ];
}
