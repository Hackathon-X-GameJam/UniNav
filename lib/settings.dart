import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uninav/components/drawer.dart';
import 'package:uninav/components/hamburger_menu.dart';
import 'package:uninav/controllers/isar_controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isarController = Get.find<IsarController>();
    final settings = isarController.settings;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: HamburgerMenu(),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => Column(
                children: [
                  SwitchListTile(
                    title: const Text('Show Icons'),
                    subtitle: const Text(
                      'Warning: disables ALL icons',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                    value: settings.value.showIcons,
                    onChanged: (value) {
                      settings.update((val) {
                        val?.showIcons = value;
                      });
                      isarController.persistSettings();
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Show Elevators'),
                    value: settings.value.showElevators,
                    onChanged: (value) {
                      settings.update((val) {
                        val?.showElevators = value;
                      });
                      isarController.persistSettings();
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Show Food and Drink'),
                    value: settings.value.showFoodAndDrink,
                    onChanged: (value) {
                      settings.update((val) {
                        val?.showFoodAndDrink = value;
                      });
                      isarController.persistSettings();
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Show Lecture Halls'),
                    value: settings.value.showLectureHalls,
                    onChanged: (value) {
                      settings.update((val) {
                        val?.showLectureHalls = value;
                      });
                      isarController.persistSettings();
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Show Computer Pools'),
                    value: settings.value.showComputerPools,
                    onChanged: (value) {
                      settings.update((val) {
                        val?.showComputerPools = value;
                      });
                      isarController.persistSettings();
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Show Seminar Rooms'),
                    value: settings.value.showSeminarRooms,
                    onChanged: (value) {
                      settings.update((val) {
                        val?.showSeminarRooms = value;
                      });
                      isarController.persistSettings();
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Show Toilets'),
                    value: settings.value.showToilets,
                    onChanged: (value) {
                      settings.update((val) {
                        val?.showToilets = value;
                      });
                      isarController.persistSettings();
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Show Stairs'),
                    value: settings.value.showStairs,
                    onChanged: (value) {
                      settings.update((val) {
                        val?.showStairs = value;
                      });
                      isarController.persistSettings();
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Show Doors'),
                    value: settings.value.showDoors,
                    onChanged: (value) {
                      settings.update((val) {
                        val?.showDoors = value;
                      });
                      isarController.persistSettings();
                    },
                  ),
                  const SizedBox(height: 12),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text('Toilet Preference'),
                  ),
                  CheckboxListTile(
                    title: const Text('Male Toilets'),
                    value: settings.value.maleToilets,
                    onChanged: (value) {
                      settings.update((val) {
                        val?.maleToilets = value ?? false;
                      });
                      isarController.persistSettings();
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Female Toilets'),
                    value: settings.value.femaleToilets,
                    onChanged: (value) {
                      settings.update((val) {
                        val?.femaleToilets = value ?? false;
                      });
                      isarController.persistSettings();
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Handicap Toilets'),
                    value: settings.value.handicapToilets,
                    onChanged: (value) {
                      settings.update((val) {
                        val?.handicapToilets = value ?? false;
                      });
                      isarController.persistSettings();
                    },
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      settings.value = Settings();
                      isarController.persistSettings();
                    },
                    child: const Text("Reset Settings"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
