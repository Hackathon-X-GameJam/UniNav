// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_prefs_controller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsImpl _$$SettingsImplFromJson(Map<String, dynamic> json) =>
    _$SettingsImpl(
      id: json['id'] as int? ?? 1,
      showIcons: json['showIcons'] as bool? ?? true,
      showElevators: json['showElevators'] as bool? ?? true,
      showFoodAndDrink: json['showFoodAndDrink'] as bool? ?? true,
      showLectureHalls: json['showLectureHalls'] as bool? ?? true,
      showComputerPools: json['showComputerPools'] as bool? ?? true,
      showSeminarRooms: json['showSeminarRooms'] as bool? ?? true,
      showToilets: json['showToilets'] as bool? ?? true,
      showStairs: json['showStairs'] as bool? ?? true,
      showDoors: json['showDoors'] as bool? ?? true,
      maleToilets: json['maleToilets'] as bool? ?? false,
      femaleToilets: json['femaleToilets'] as bool? ?? false,
      handicapToilets: json['handicapToilets'] as bool? ?? false,
    );

Map<String, dynamic> _$$SettingsImplToJson(_$SettingsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'showIcons': instance.showIcons,
      'showElevators': instance.showElevators,
      'showFoodAndDrink': instance.showFoodAndDrink,
      'showLectureHalls': instance.showLectureHalls,
      'showComputerPools': instance.showComputerPools,
      'showSeminarRooms': instance.showSeminarRooms,
      'showToilets': instance.showToilets,
      'showStairs': instance.showStairs,
      'showDoors': instance.showDoors,
      'maleToilets': instance.maleToilets,
      'femaleToilets': instance.femaleToilets,
      'handicapToilets': instance.handicapToilets,
    };
