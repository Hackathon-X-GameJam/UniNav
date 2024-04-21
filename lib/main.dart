import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uninav/controllers/isar_controller.dart';
import 'package:uninav/controllers/map_controller.dart';
import 'package:uninav/map.dart';
import 'package:uninav/settings.dart';

// TODO: maybe make not async?
void main() async {
  Get.put(MyMapController());
  await Get.find<MyMapController>()
      .loadGeoJson(await rootBundle.loadString('assets/geo/uulm_beta.geojson'));

  await Get.putAsync(() async {
    final controller = IsarController();
    await controller.initializeIsar();
    return controller;
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ).copyWith(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.deepPurple,
        ),
      ),
      initialRoute: '/map',
      getPages: [
        GetPage(name: '/map', page: () => const MapPage()),
        GetPage(name: '/settings', page: () => const SettingsPage()),
      ],
    );
  }
}
