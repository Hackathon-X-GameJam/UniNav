import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uninav/controllers/map_controller.dart';
import 'package:uninav/map.dart';
import 'package:uninav/settings.dart';

void main() {
  Get.put(MyMapController());
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
