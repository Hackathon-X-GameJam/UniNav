import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

part 'isar_controller.g.dart';

/// Manages the initialization and access to the Isar database instance.
///
/// The `IsarController` class is responsible for initializing the Isar database
/// and providing access to the database instance. It ensures that the Isar
/// instance is properly initialized before it can be accessed.
///
/// The `initializeIsar()` method is used to initialize the Isar instance by
/// opening the database with the provided schema. Make sure to call this before
/// calling anything else!. The `isar` getter returns the
/// Isar instance, throwing an exception if the instance is not yet initialized.
class IsarController {
  late Isar _isar;

  late final Rx<Settings> settings;

  IsarController();

  Future<void> initializeIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [SettingsSchema],
      directory: dir.path,
    );
    settings = (await _isar.settings.get(1) ?? Settings()).obs;
    _isar.settings.watchObject(1).forEach((element) {
      if (element != null) settings.value = element;
    });
  }

  Future<void> persistSettings() async {
    await _isar.writeTxn(() async {
      await _isar.settings.put(settings.value);
    });
  }

  Isar get isar {
    if (_isar == null) {
      throw Exception('Isar is not initialized');
    }
    return _isar;
  }
}

@collection
class Settings {
  Id id = 1;

  bool showIcons = true;

  bool showElevators = true;
  bool showFoodAndDrink = true;
  bool showLectureHalls = true;
  bool showComputerPools = true;
  bool showSeminarRooms = true;
  bool showToilets = true;
  bool showStairs = true;
  bool showDoors = true;

  bool maleToilets = false;
  bool femaleToilets = false;
  bool handicapToilets = false;
}

enum ToiletPreference {
  male,
  female,
  disabled,
}
