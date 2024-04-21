import 'dart:convert';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shared_prefs_controller.freezed.dart';
part 'shared_prefs_controller.g.dart';

class SharedPrefsController {
  late SharedPreferences _sharedPrefs;

  final Rx<Settings> settings = Settings().obs;

  SharedPrefsController();

  Future<void> initialize() async {
    _sharedPrefs = await SharedPreferences.getInstance();
    try {
      final settingsJson = _sharedPrefs.getString("settings");
      if (settingsJson != null) {
        settings.value = Settings.fromJson(jsonDecode(settingsJson));
      } else {
        settings.value = const Settings();
      }
    } catch (e) {
      settings.value = const Settings();
    }
  }

  Future<void> persistSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('settings', jsonEncode(settings.value));
  }

  Future<Settings> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final settingsJson = prefs.getString('settings');
    return settingsJson != null
        ? Settings.fromJson(jsonDecode(settingsJson))
        : const Settings();
  }
}

@freezed
class Settings with _$Settings {
  const factory Settings({
    @Default(1) int id,
    @Default(true) bool showIcons,
    @Default(true) bool showElevators,
    @Default(true) bool showFoodAndDrink,
    @Default(true) bool showLectureHalls,
    @Default(true) bool showComputerPools,
    @Default(true) bool showSeminarRooms,
    @Default(true) bool showToilets,
    @Default(true) bool showStairs,
    @Default(true) bool showDoors,
    @Default(false) bool maleToilets,
    @Default(false) bool femaleToilets,
    @Default(false) bool handicapToilets,
  }) = _Settings;

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);
}

enum ToiletPreference {
  male,
  female,
  disabled,
}
