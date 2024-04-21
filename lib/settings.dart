import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uninav/components/drawer.dart';
import 'package:uninav/components/hamburger_menu.dart';
import 'package:uninav/controllers/shared_prefs_controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final persistenceController = Get.find<SharedPrefsController>();
    final settings = persistenceController.settings;

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
                      settings.value = settings.value.copyWith(
                        showIcons: value,
                      );
                      persistenceController.persistSettings();
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Show Elevators'),
                    value: settings.value.showElevators,
                    onChanged: (value) {
                      settings.value = settings.value.copyWith(
                        showElevators: value,
                      );
                      persistenceController.persistSettings();
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Show Food and Drink'),
                    value: settings.value.showFoodAndDrink,
                    onChanged: (value) {
                      settings.value = settings.value.copyWith(
                        showFoodAndDrink: value,
                      );
                      persistenceController.persistSettings();
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Show Lecture Halls'),
                    value: settings.value.showLectureHalls,
                    onChanged: (value) {
                      settings.value = settings.value.copyWith(
                        showLectureHalls: value,
                      );
                      persistenceController.persistSettings();
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Show Computer Pools'),
                    value: settings.value.showComputerPools,
                    onChanged: (value) {
                      settings.value = settings.value.copyWith(
                        showComputerPools: value,
                      );
                      persistenceController.persistSettings();
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Show Seminar Rooms'),
                    value: settings.value.showSeminarRooms,
                    onChanged: (value) {
                      settings.value = settings.value.copyWith(
                        showSeminarRooms: value,
                      );
                      persistenceController.persistSettings();
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Show Toilets'),
                    value: settings.value.showToilets,
                    onChanged: (value) {
                      settings.value = settings.value.copyWith(
                        showToilets: value,
                      );
                      persistenceController.persistSettings();
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Show Stairs'),
                    value: settings.value.showStairs,
                    onChanged: (value) {
                      settings.value = settings.value.copyWith(
                        showStairs: value,
                      );
                      persistenceController.persistSettings();
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Show Doors'),
                    value: settings.value.showDoors,
                    onChanged: (value) {
                      settings.value = settings.value.copyWith(
                        showDoors: value,
                      );
                      persistenceController.persistSettings();
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
                      settings.value = settings.value.copyWith(
                        maleToilets: value ?? false,
                      );
                      persistenceController.persistSettings();
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Female Toilets'),
                    value: settings.value.femaleToilets,
                    onChanged: (value) {
                      settings.value = settings.value.copyWith(
                        femaleToilets: value ?? false,
                      );
                      persistenceController.persistSettings();
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Handicap Toilets'),
                    value: settings.value.handicapToilets,
                    onChanged: (value) {
                      settings.value = settings.value.copyWith(
                        handicapToilets: value ?? false,
                      );
                      persistenceController.persistSettings();
                    },
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      settings.value = const Settings();
                      persistenceController.persistSettings();
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
