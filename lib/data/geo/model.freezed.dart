// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Feature {
  String get name => throw _privateConstructorUsedError;
  FeatureType get type => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  GeoJSONGeometry get geometry => throw _privateConstructorUsedError;
  int? get level => throw _privateConstructorUsedError;
  String? get building => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FeatureCopyWith<Feature> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureCopyWith<$Res> {
  factory $FeatureCopyWith(Feature value, $Res Function(Feature) then) =
      _$FeatureCopyWithImpl<$Res, Feature>;
  @useResult
  $Res call(
      {String name,
      FeatureType type,
      String? description,
      GeoJSONGeometry geometry,
      int? level,
      String? building});

  $FeatureTypeCopyWith<$Res> get type;
}

/// @nodoc
class _$FeatureCopyWithImpl<$Res, $Val extends Feature>
    implements $FeatureCopyWith<$Res> {
  _$FeatureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? description = freezed,
    Object? geometry = null,
    Object? level = freezed,
    Object? building = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeatureType,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as GeoJSONGeometry,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      building: freezed == building
          ? _value.building
          : building // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FeatureTypeCopyWith<$Res> get type {
    return $FeatureTypeCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FeatureImplCopyWith<$Res> implements $FeatureCopyWith<$Res> {
  factory _$$FeatureImplCopyWith(
          _$FeatureImpl value, $Res Function(_$FeatureImpl) then) =
      __$$FeatureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      FeatureType type,
      String? description,
      GeoJSONGeometry geometry,
      int? level,
      String? building});

  @override
  $FeatureTypeCopyWith<$Res> get type;
}

/// @nodoc
class __$$FeatureImplCopyWithImpl<$Res>
    extends _$FeatureCopyWithImpl<$Res, _$FeatureImpl>
    implements _$$FeatureImplCopyWith<$Res> {
  __$$FeatureImplCopyWithImpl(
      _$FeatureImpl _value, $Res Function(_$FeatureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? description = freezed,
    Object? geometry = null,
    Object? level = freezed,
    Object? building = freezed,
  }) {
    return _then(_$FeatureImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeatureType,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as GeoJSONGeometry,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      building: freezed == building
          ? _value.building
          : building // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FeatureImpl extends _Feature {
  const _$FeatureImpl(
      {required this.name,
      required this.type,
      this.description,
      required this.geometry,
      this.level,
      this.building})
      : super._();

  @override
  final String name;
  @override
  final FeatureType type;
  @override
  final String? description;
  @override
  final GeoJSONGeometry geometry;
  @override
  final int? level;
  @override
  final String? building;

  @override
  String toString() {
    return 'Feature(name: $name, type: $type, description: $description, geometry: $geometry, level: $level, building: $building)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeatureImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.building, building) ||
                other.building == building));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, type, description, geometry, level, building);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeatureImplCopyWith<_$FeatureImpl> get copyWith =>
      __$$FeatureImplCopyWithImpl<_$FeatureImpl>(this, _$identity);
}

abstract class _Feature extends Feature {
  const factory _Feature(
      {required final String name,
      required final FeatureType type,
      final String? description,
      required final GeoJSONGeometry geometry,
      final int? level,
      final String? building}) = _$FeatureImpl;
  const _Feature._() : super._();

  @override
  String get name;
  @override
  FeatureType get type;
  @override
  String? get description;
  @override
  GeoJSONGeometry get geometry;
  @override
  int? get level;
  @override
  String? get building;
  @override
  @JsonKey(ignore: true)
  _$$FeatureImplCopyWith<_$FeatureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FeatureType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() building,
    required TResult Function() lectureHall,
    required TResult Function() room,
    required TResult Function(List<String> connects) door,
    required TResult Function(String toilet_type) toilet,
    required TResult Function(List<int> connects_levels) stairs,
    required TResult Function(List<int> connects_levels) lift,
    required TResult Function(List<String> bus_lines, List<String> tram_lines)
        publicTransport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? building,
    TResult? Function()? lectureHall,
    TResult? Function()? room,
    TResult? Function(List<String> connects)? door,
    TResult? Function(String toilet_type)? toilet,
    TResult? Function(List<int> connects_levels)? stairs,
    TResult? Function(List<int> connects_levels)? lift,
    TResult? Function(List<String> bus_lines, List<String> tram_lines)?
        publicTransport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? building,
    TResult Function()? lectureHall,
    TResult Function()? room,
    TResult Function(List<String> connects)? door,
    TResult Function(String toilet_type)? toilet,
    TResult Function(List<int> connects_levels)? stairs,
    TResult Function(List<int> connects_levels)? lift,
    TResult Function(List<String> bus_lines, List<String> tram_lines)?
        publicTransport,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Building value) building,
    required TResult Function(LectureHall value) lectureHall,
    required TResult Function(Room value) room,
    required TResult Function(Door value) door,
    required TResult Function(Toilet value) toilet,
    required TResult Function(Stairs value) stairs,
    required TResult Function(Lift value) lift,
    required TResult Function(PublicTransport value) publicTransport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Building value)? building,
    TResult? Function(LectureHall value)? lectureHall,
    TResult? Function(Room value)? room,
    TResult? Function(Door value)? door,
    TResult? Function(Toilet value)? toilet,
    TResult? Function(Stairs value)? stairs,
    TResult? Function(Lift value)? lift,
    TResult? Function(PublicTransport value)? publicTransport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Building value)? building,
    TResult Function(LectureHall value)? lectureHall,
    TResult Function(Room value)? room,
    TResult Function(Door value)? door,
    TResult Function(Toilet value)? toilet,
    TResult Function(Stairs value)? stairs,
    TResult Function(Lift value)? lift,
    TResult Function(PublicTransport value)? publicTransport,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeatureTypeCopyWith<$Res> {
  factory $FeatureTypeCopyWith(
          FeatureType value, $Res Function(FeatureType) then) =
      _$FeatureTypeCopyWithImpl<$Res, FeatureType>;
}

/// @nodoc
class _$FeatureTypeCopyWithImpl<$Res, $Val extends FeatureType>
    implements $FeatureTypeCopyWith<$Res> {
  _$FeatureTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$BuildingImplCopyWith<$Res> {
  factory _$$BuildingImplCopyWith(
          _$BuildingImpl value, $Res Function(_$BuildingImpl) then) =
      __$$BuildingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BuildingImplCopyWithImpl<$Res>
    extends _$FeatureTypeCopyWithImpl<$Res, _$BuildingImpl>
    implements _$$BuildingImplCopyWith<$Res> {
  __$$BuildingImplCopyWithImpl(
      _$BuildingImpl _value, $Res Function(_$BuildingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BuildingImpl implements Building {
  const _$BuildingImpl();

  @override
  String toString() {
    return 'FeatureType.building()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BuildingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() building,
    required TResult Function() lectureHall,
    required TResult Function() room,
    required TResult Function(List<String> connects) door,
    required TResult Function(String toilet_type) toilet,
    required TResult Function(List<int> connects_levels) stairs,
    required TResult Function(List<int> connects_levels) lift,
    required TResult Function(List<String> bus_lines, List<String> tram_lines)
        publicTransport,
  }) {
    return building();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? building,
    TResult? Function()? lectureHall,
    TResult? Function()? room,
    TResult? Function(List<String> connects)? door,
    TResult? Function(String toilet_type)? toilet,
    TResult? Function(List<int> connects_levels)? stairs,
    TResult? Function(List<int> connects_levels)? lift,
    TResult? Function(List<String> bus_lines, List<String> tram_lines)?
        publicTransport,
  }) {
    return building?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? building,
    TResult Function()? lectureHall,
    TResult Function()? room,
    TResult Function(List<String> connects)? door,
    TResult Function(String toilet_type)? toilet,
    TResult Function(List<int> connects_levels)? stairs,
    TResult Function(List<int> connects_levels)? lift,
    TResult Function(List<String> bus_lines, List<String> tram_lines)?
        publicTransport,
    required TResult orElse(),
  }) {
    if (building != null) {
      return building();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Building value) building,
    required TResult Function(LectureHall value) lectureHall,
    required TResult Function(Room value) room,
    required TResult Function(Door value) door,
    required TResult Function(Toilet value) toilet,
    required TResult Function(Stairs value) stairs,
    required TResult Function(Lift value) lift,
    required TResult Function(PublicTransport value) publicTransport,
  }) {
    return building(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Building value)? building,
    TResult? Function(LectureHall value)? lectureHall,
    TResult? Function(Room value)? room,
    TResult? Function(Door value)? door,
    TResult? Function(Toilet value)? toilet,
    TResult? Function(Stairs value)? stairs,
    TResult? Function(Lift value)? lift,
    TResult? Function(PublicTransport value)? publicTransport,
  }) {
    return building?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Building value)? building,
    TResult Function(LectureHall value)? lectureHall,
    TResult Function(Room value)? room,
    TResult Function(Door value)? door,
    TResult Function(Toilet value)? toilet,
    TResult Function(Stairs value)? stairs,
    TResult Function(Lift value)? lift,
    TResult Function(PublicTransport value)? publicTransport,
    required TResult orElse(),
  }) {
    if (building != null) {
      return building(this);
    }
    return orElse();
  }
}

abstract class Building implements FeatureType {
  const factory Building() = _$BuildingImpl;
}

/// @nodoc
abstract class _$$LectureHallImplCopyWith<$Res> {
  factory _$$LectureHallImplCopyWith(
          _$LectureHallImpl value, $Res Function(_$LectureHallImpl) then) =
      __$$LectureHallImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LectureHallImplCopyWithImpl<$Res>
    extends _$FeatureTypeCopyWithImpl<$Res, _$LectureHallImpl>
    implements _$$LectureHallImplCopyWith<$Res> {
  __$$LectureHallImplCopyWithImpl(
      _$LectureHallImpl _value, $Res Function(_$LectureHallImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LectureHallImpl implements LectureHall {
  const _$LectureHallImpl();

  @override
  String toString() {
    return 'FeatureType.lectureHall()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LectureHallImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() building,
    required TResult Function() lectureHall,
    required TResult Function() room,
    required TResult Function(List<String> connects) door,
    required TResult Function(String toilet_type) toilet,
    required TResult Function(List<int> connects_levels) stairs,
    required TResult Function(List<int> connects_levels) lift,
    required TResult Function(List<String> bus_lines, List<String> tram_lines)
        publicTransport,
  }) {
    return lectureHall();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? building,
    TResult? Function()? lectureHall,
    TResult? Function()? room,
    TResult? Function(List<String> connects)? door,
    TResult? Function(String toilet_type)? toilet,
    TResult? Function(List<int> connects_levels)? stairs,
    TResult? Function(List<int> connects_levels)? lift,
    TResult? Function(List<String> bus_lines, List<String> tram_lines)?
        publicTransport,
  }) {
    return lectureHall?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? building,
    TResult Function()? lectureHall,
    TResult Function()? room,
    TResult Function(List<String> connects)? door,
    TResult Function(String toilet_type)? toilet,
    TResult Function(List<int> connects_levels)? stairs,
    TResult Function(List<int> connects_levels)? lift,
    TResult Function(List<String> bus_lines, List<String> tram_lines)?
        publicTransport,
    required TResult orElse(),
  }) {
    if (lectureHall != null) {
      return lectureHall();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Building value) building,
    required TResult Function(LectureHall value) lectureHall,
    required TResult Function(Room value) room,
    required TResult Function(Door value) door,
    required TResult Function(Toilet value) toilet,
    required TResult Function(Stairs value) stairs,
    required TResult Function(Lift value) lift,
    required TResult Function(PublicTransport value) publicTransport,
  }) {
    return lectureHall(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Building value)? building,
    TResult? Function(LectureHall value)? lectureHall,
    TResult? Function(Room value)? room,
    TResult? Function(Door value)? door,
    TResult? Function(Toilet value)? toilet,
    TResult? Function(Stairs value)? stairs,
    TResult? Function(Lift value)? lift,
    TResult? Function(PublicTransport value)? publicTransport,
  }) {
    return lectureHall?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Building value)? building,
    TResult Function(LectureHall value)? lectureHall,
    TResult Function(Room value)? room,
    TResult Function(Door value)? door,
    TResult Function(Toilet value)? toilet,
    TResult Function(Stairs value)? stairs,
    TResult Function(Lift value)? lift,
    TResult Function(PublicTransport value)? publicTransport,
    required TResult orElse(),
  }) {
    if (lectureHall != null) {
      return lectureHall(this);
    }
    return orElse();
  }
}

abstract class LectureHall implements FeatureType {
  const factory LectureHall() = _$LectureHallImpl;
}

/// @nodoc
abstract class _$$RoomImplCopyWith<$Res> {
  factory _$$RoomImplCopyWith(
          _$RoomImpl value, $Res Function(_$RoomImpl) then) =
      __$$RoomImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RoomImplCopyWithImpl<$Res>
    extends _$FeatureTypeCopyWithImpl<$Res, _$RoomImpl>
    implements _$$RoomImplCopyWith<$Res> {
  __$$RoomImplCopyWithImpl(_$RoomImpl _value, $Res Function(_$RoomImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RoomImpl implements Room {
  const _$RoomImpl();

  @override
  String toString() {
    return 'FeatureType.room()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RoomImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() building,
    required TResult Function() lectureHall,
    required TResult Function() room,
    required TResult Function(List<String> connects) door,
    required TResult Function(String toilet_type) toilet,
    required TResult Function(List<int> connects_levels) stairs,
    required TResult Function(List<int> connects_levels) lift,
    required TResult Function(List<String> bus_lines, List<String> tram_lines)
        publicTransport,
  }) {
    return room();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? building,
    TResult? Function()? lectureHall,
    TResult? Function()? room,
    TResult? Function(List<String> connects)? door,
    TResult? Function(String toilet_type)? toilet,
    TResult? Function(List<int> connects_levels)? stairs,
    TResult? Function(List<int> connects_levels)? lift,
    TResult? Function(List<String> bus_lines, List<String> tram_lines)?
        publicTransport,
  }) {
    return room?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? building,
    TResult Function()? lectureHall,
    TResult Function()? room,
    TResult Function(List<String> connects)? door,
    TResult Function(String toilet_type)? toilet,
    TResult Function(List<int> connects_levels)? stairs,
    TResult Function(List<int> connects_levels)? lift,
    TResult Function(List<String> bus_lines, List<String> tram_lines)?
        publicTransport,
    required TResult orElse(),
  }) {
    if (room != null) {
      return room();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Building value) building,
    required TResult Function(LectureHall value) lectureHall,
    required TResult Function(Room value) room,
    required TResult Function(Door value) door,
    required TResult Function(Toilet value) toilet,
    required TResult Function(Stairs value) stairs,
    required TResult Function(Lift value) lift,
    required TResult Function(PublicTransport value) publicTransport,
  }) {
    return room(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Building value)? building,
    TResult? Function(LectureHall value)? lectureHall,
    TResult? Function(Room value)? room,
    TResult? Function(Door value)? door,
    TResult? Function(Toilet value)? toilet,
    TResult? Function(Stairs value)? stairs,
    TResult? Function(Lift value)? lift,
    TResult? Function(PublicTransport value)? publicTransport,
  }) {
    return room?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Building value)? building,
    TResult Function(LectureHall value)? lectureHall,
    TResult Function(Room value)? room,
    TResult Function(Door value)? door,
    TResult Function(Toilet value)? toilet,
    TResult Function(Stairs value)? stairs,
    TResult Function(Lift value)? lift,
    TResult Function(PublicTransport value)? publicTransport,
    required TResult orElse(),
  }) {
    if (room != null) {
      return room(this);
    }
    return orElse();
  }
}

abstract class Room implements FeatureType {
  const factory Room() = _$RoomImpl;
}

/// @nodoc
abstract class _$$DoorImplCopyWith<$Res> {
  factory _$$DoorImplCopyWith(
          _$DoorImpl value, $Res Function(_$DoorImpl) then) =
      __$$DoorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> connects});
}

/// @nodoc
class __$$DoorImplCopyWithImpl<$Res>
    extends _$FeatureTypeCopyWithImpl<$Res, _$DoorImpl>
    implements _$$DoorImplCopyWith<$Res> {
  __$$DoorImplCopyWithImpl(_$DoorImpl _value, $Res Function(_$DoorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connects = null,
  }) {
    return _then(_$DoorImpl(
      null == connects
          ? _value._connects
          : connects // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$DoorImpl implements Door {
  const _$DoorImpl(final List<String> connects) : _connects = connects;

  final List<String> _connects;
  @override
  List<String> get connects {
    if (_connects is EqualUnmodifiableListView) return _connects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_connects);
  }

  @override
  String toString() {
    return 'FeatureType.door(connects: $connects)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoorImpl &&
            const DeepCollectionEquality().equals(other._connects, _connects));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_connects));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DoorImplCopyWith<_$DoorImpl> get copyWith =>
      __$$DoorImplCopyWithImpl<_$DoorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() building,
    required TResult Function() lectureHall,
    required TResult Function() room,
    required TResult Function(List<String> connects) door,
    required TResult Function(String toilet_type) toilet,
    required TResult Function(List<int> connects_levels) stairs,
    required TResult Function(List<int> connects_levels) lift,
    required TResult Function(List<String> bus_lines, List<String> tram_lines)
        publicTransport,
  }) {
    return door(connects);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? building,
    TResult? Function()? lectureHall,
    TResult? Function()? room,
    TResult? Function(List<String> connects)? door,
    TResult? Function(String toilet_type)? toilet,
    TResult? Function(List<int> connects_levels)? stairs,
    TResult? Function(List<int> connects_levels)? lift,
    TResult? Function(List<String> bus_lines, List<String> tram_lines)?
        publicTransport,
  }) {
    return door?.call(connects);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? building,
    TResult Function()? lectureHall,
    TResult Function()? room,
    TResult Function(List<String> connects)? door,
    TResult Function(String toilet_type)? toilet,
    TResult Function(List<int> connects_levels)? stairs,
    TResult Function(List<int> connects_levels)? lift,
    TResult Function(List<String> bus_lines, List<String> tram_lines)?
        publicTransport,
    required TResult orElse(),
  }) {
    if (door != null) {
      return door(connects);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Building value) building,
    required TResult Function(LectureHall value) lectureHall,
    required TResult Function(Room value) room,
    required TResult Function(Door value) door,
    required TResult Function(Toilet value) toilet,
    required TResult Function(Stairs value) stairs,
    required TResult Function(Lift value) lift,
    required TResult Function(PublicTransport value) publicTransport,
  }) {
    return door(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Building value)? building,
    TResult? Function(LectureHall value)? lectureHall,
    TResult? Function(Room value)? room,
    TResult? Function(Door value)? door,
    TResult? Function(Toilet value)? toilet,
    TResult? Function(Stairs value)? stairs,
    TResult? Function(Lift value)? lift,
    TResult? Function(PublicTransport value)? publicTransport,
  }) {
    return door?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Building value)? building,
    TResult Function(LectureHall value)? lectureHall,
    TResult Function(Room value)? room,
    TResult Function(Door value)? door,
    TResult Function(Toilet value)? toilet,
    TResult Function(Stairs value)? stairs,
    TResult Function(Lift value)? lift,
    TResult Function(PublicTransport value)? publicTransport,
    required TResult orElse(),
  }) {
    if (door != null) {
      return door(this);
    }
    return orElse();
  }
}

abstract class Door implements FeatureType {
  const factory Door(final List<String> connects) = _$DoorImpl;

  List<String> get connects;
  @JsonKey(ignore: true)
  _$$DoorImplCopyWith<_$DoorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToiletImplCopyWith<$Res> {
  factory _$$ToiletImplCopyWith(
          _$ToiletImpl value, $Res Function(_$ToiletImpl) then) =
      __$$ToiletImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String toilet_type});
}

/// @nodoc
class __$$ToiletImplCopyWithImpl<$Res>
    extends _$FeatureTypeCopyWithImpl<$Res, _$ToiletImpl>
    implements _$$ToiletImplCopyWith<$Res> {
  __$$ToiletImplCopyWithImpl(
      _$ToiletImpl _value, $Res Function(_$ToiletImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? toilet_type = null,
  }) {
    return _then(_$ToiletImpl(
      null == toilet_type
          ? _value.toilet_type
          : toilet_type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ToiletImpl implements Toilet {
  const _$ToiletImpl(this.toilet_type);

  @override
  final String toilet_type;

  @override
  String toString() {
    return 'FeatureType.toilet(toilet_type: $toilet_type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToiletImpl &&
            (identical(other.toilet_type, toilet_type) ||
                other.toilet_type == toilet_type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, toilet_type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToiletImplCopyWith<_$ToiletImpl> get copyWith =>
      __$$ToiletImplCopyWithImpl<_$ToiletImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() building,
    required TResult Function() lectureHall,
    required TResult Function() room,
    required TResult Function(List<String> connects) door,
    required TResult Function(String toilet_type) toilet,
    required TResult Function(List<int> connects_levels) stairs,
    required TResult Function(List<int> connects_levels) lift,
    required TResult Function(List<String> bus_lines, List<String> tram_lines)
        publicTransport,
  }) {
    return toilet(toilet_type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? building,
    TResult? Function()? lectureHall,
    TResult? Function()? room,
    TResult? Function(List<String> connects)? door,
    TResult? Function(String toilet_type)? toilet,
    TResult? Function(List<int> connects_levels)? stairs,
    TResult? Function(List<int> connects_levels)? lift,
    TResult? Function(List<String> bus_lines, List<String> tram_lines)?
        publicTransport,
  }) {
    return toilet?.call(toilet_type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? building,
    TResult Function()? lectureHall,
    TResult Function()? room,
    TResult Function(List<String> connects)? door,
    TResult Function(String toilet_type)? toilet,
    TResult Function(List<int> connects_levels)? stairs,
    TResult Function(List<int> connects_levels)? lift,
    TResult Function(List<String> bus_lines, List<String> tram_lines)?
        publicTransport,
    required TResult orElse(),
  }) {
    if (toilet != null) {
      return toilet(toilet_type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Building value) building,
    required TResult Function(LectureHall value) lectureHall,
    required TResult Function(Room value) room,
    required TResult Function(Door value) door,
    required TResult Function(Toilet value) toilet,
    required TResult Function(Stairs value) stairs,
    required TResult Function(Lift value) lift,
    required TResult Function(PublicTransport value) publicTransport,
  }) {
    return toilet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Building value)? building,
    TResult? Function(LectureHall value)? lectureHall,
    TResult? Function(Room value)? room,
    TResult? Function(Door value)? door,
    TResult? Function(Toilet value)? toilet,
    TResult? Function(Stairs value)? stairs,
    TResult? Function(Lift value)? lift,
    TResult? Function(PublicTransport value)? publicTransport,
  }) {
    return toilet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Building value)? building,
    TResult Function(LectureHall value)? lectureHall,
    TResult Function(Room value)? room,
    TResult Function(Door value)? door,
    TResult Function(Toilet value)? toilet,
    TResult Function(Stairs value)? stairs,
    TResult Function(Lift value)? lift,
    TResult Function(PublicTransport value)? publicTransport,
    required TResult orElse(),
  }) {
    if (toilet != null) {
      return toilet(this);
    }
    return orElse();
  }
}

abstract class Toilet implements FeatureType {
  const factory Toilet(final String toilet_type) = _$ToiletImpl;

  String get toilet_type;
  @JsonKey(ignore: true)
  _$$ToiletImplCopyWith<_$ToiletImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StairsImplCopyWith<$Res> {
  factory _$$StairsImplCopyWith(
          _$StairsImpl value, $Res Function(_$StairsImpl) then) =
      __$$StairsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<int> connects_levels});
}

/// @nodoc
class __$$StairsImplCopyWithImpl<$Res>
    extends _$FeatureTypeCopyWithImpl<$Res, _$StairsImpl>
    implements _$$StairsImplCopyWith<$Res> {
  __$$StairsImplCopyWithImpl(
      _$StairsImpl _value, $Res Function(_$StairsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connects_levels = null,
  }) {
    return _then(_$StairsImpl(
      null == connects_levels
          ? _value._connects_levels
          : connects_levels // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$StairsImpl implements Stairs {
  const _$StairsImpl(final List<int> connects_levels)
      : _connects_levels = connects_levels;

  final List<int> _connects_levels;
  @override
  List<int> get connects_levels {
    if (_connects_levels is EqualUnmodifiableListView) return _connects_levels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_connects_levels);
  }

  @override
  String toString() {
    return 'FeatureType.stairs(connects_levels: $connects_levels)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StairsImpl &&
            const DeepCollectionEquality()
                .equals(other._connects_levels, _connects_levels));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_connects_levels));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StairsImplCopyWith<_$StairsImpl> get copyWith =>
      __$$StairsImplCopyWithImpl<_$StairsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() building,
    required TResult Function() lectureHall,
    required TResult Function() room,
    required TResult Function(List<String> connects) door,
    required TResult Function(String toilet_type) toilet,
    required TResult Function(List<int> connects_levels) stairs,
    required TResult Function(List<int> connects_levels) lift,
    required TResult Function(List<String> bus_lines, List<String> tram_lines)
        publicTransport,
  }) {
    return stairs(connects_levels);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? building,
    TResult? Function()? lectureHall,
    TResult? Function()? room,
    TResult? Function(List<String> connects)? door,
    TResult? Function(String toilet_type)? toilet,
    TResult? Function(List<int> connects_levels)? stairs,
    TResult? Function(List<int> connects_levels)? lift,
    TResult? Function(List<String> bus_lines, List<String> tram_lines)?
        publicTransport,
  }) {
    return stairs?.call(connects_levels);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? building,
    TResult Function()? lectureHall,
    TResult Function()? room,
    TResult Function(List<String> connects)? door,
    TResult Function(String toilet_type)? toilet,
    TResult Function(List<int> connects_levels)? stairs,
    TResult Function(List<int> connects_levels)? lift,
    TResult Function(List<String> bus_lines, List<String> tram_lines)?
        publicTransport,
    required TResult orElse(),
  }) {
    if (stairs != null) {
      return stairs(connects_levels);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Building value) building,
    required TResult Function(LectureHall value) lectureHall,
    required TResult Function(Room value) room,
    required TResult Function(Door value) door,
    required TResult Function(Toilet value) toilet,
    required TResult Function(Stairs value) stairs,
    required TResult Function(Lift value) lift,
    required TResult Function(PublicTransport value) publicTransport,
  }) {
    return stairs(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Building value)? building,
    TResult? Function(LectureHall value)? lectureHall,
    TResult? Function(Room value)? room,
    TResult? Function(Door value)? door,
    TResult? Function(Toilet value)? toilet,
    TResult? Function(Stairs value)? stairs,
    TResult? Function(Lift value)? lift,
    TResult? Function(PublicTransport value)? publicTransport,
  }) {
    return stairs?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Building value)? building,
    TResult Function(LectureHall value)? lectureHall,
    TResult Function(Room value)? room,
    TResult Function(Door value)? door,
    TResult Function(Toilet value)? toilet,
    TResult Function(Stairs value)? stairs,
    TResult Function(Lift value)? lift,
    TResult Function(PublicTransport value)? publicTransport,
    required TResult orElse(),
  }) {
    if (stairs != null) {
      return stairs(this);
    }
    return orElse();
  }
}

abstract class Stairs implements FeatureType {
  const factory Stairs(final List<int> connects_levels) = _$StairsImpl;

  List<int> get connects_levels;
  @JsonKey(ignore: true)
  _$$StairsImplCopyWith<_$StairsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LiftImplCopyWith<$Res> {
  factory _$$LiftImplCopyWith(
          _$LiftImpl value, $Res Function(_$LiftImpl) then) =
      __$$LiftImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<int> connects_levels});
}

/// @nodoc
class __$$LiftImplCopyWithImpl<$Res>
    extends _$FeatureTypeCopyWithImpl<$Res, _$LiftImpl>
    implements _$$LiftImplCopyWith<$Res> {
  __$$LiftImplCopyWithImpl(_$LiftImpl _value, $Res Function(_$LiftImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connects_levels = null,
  }) {
    return _then(_$LiftImpl(
      null == connects_levels
          ? _value._connects_levels
          : connects_levels // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$LiftImpl implements Lift {
  const _$LiftImpl(final List<int> connects_levels)
      : _connects_levels = connects_levels;

  final List<int> _connects_levels;
  @override
  List<int> get connects_levels {
    if (_connects_levels is EqualUnmodifiableListView) return _connects_levels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_connects_levels);
  }

  @override
  String toString() {
    return 'FeatureType.lift(connects_levels: $connects_levels)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiftImpl &&
            const DeepCollectionEquality()
                .equals(other._connects_levels, _connects_levels));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_connects_levels));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LiftImplCopyWith<_$LiftImpl> get copyWith =>
      __$$LiftImplCopyWithImpl<_$LiftImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() building,
    required TResult Function() lectureHall,
    required TResult Function() room,
    required TResult Function(List<String> connects) door,
    required TResult Function(String toilet_type) toilet,
    required TResult Function(List<int> connects_levels) stairs,
    required TResult Function(List<int> connects_levels) lift,
    required TResult Function(List<String> bus_lines, List<String> tram_lines)
        publicTransport,
  }) {
    return lift(connects_levels);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? building,
    TResult? Function()? lectureHall,
    TResult? Function()? room,
    TResult? Function(List<String> connects)? door,
    TResult? Function(String toilet_type)? toilet,
    TResult? Function(List<int> connects_levels)? stairs,
    TResult? Function(List<int> connects_levels)? lift,
    TResult? Function(List<String> bus_lines, List<String> tram_lines)?
        publicTransport,
  }) {
    return lift?.call(connects_levels);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? building,
    TResult Function()? lectureHall,
    TResult Function()? room,
    TResult Function(List<String> connects)? door,
    TResult Function(String toilet_type)? toilet,
    TResult Function(List<int> connects_levels)? stairs,
    TResult Function(List<int> connects_levels)? lift,
    TResult Function(List<String> bus_lines, List<String> tram_lines)?
        publicTransport,
    required TResult orElse(),
  }) {
    if (lift != null) {
      return lift(connects_levels);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Building value) building,
    required TResult Function(LectureHall value) lectureHall,
    required TResult Function(Room value) room,
    required TResult Function(Door value) door,
    required TResult Function(Toilet value) toilet,
    required TResult Function(Stairs value) stairs,
    required TResult Function(Lift value) lift,
    required TResult Function(PublicTransport value) publicTransport,
  }) {
    return lift(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Building value)? building,
    TResult? Function(LectureHall value)? lectureHall,
    TResult? Function(Room value)? room,
    TResult? Function(Door value)? door,
    TResult? Function(Toilet value)? toilet,
    TResult? Function(Stairs value)? stairs,
    TResult? Function(Lift value)? lift,
    TResult? Function(PublicTransport value)? publicTransport,
  }) {
    return lift?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Building value)? building,
    TResult Function(LectureHall value)? lectureHall,
    TResult Function(Room value)? room,
    TResult Function(Door value)? door,
    TResult Function(Toilet value)? toilet,
    TResult Function(Stairs value)? stairs,
    TResult Function(Lift value)? lift,
    TResult Function(PublicTransport value)? publicTransport,
    required TResult orElse(),
  }) {
    if (lift != null) {
      return lift(this);
    }
    return orElse();
  }
}

abstract class Lift implements FeatureType {
  const factory Lift(final List<int> connects_levels) = _$LiftImpl;

  List<int> get connects_levels;
  @JsonKey(ignore: true)
  _$$LiftImplCopyWith<_$LiftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PublicTransportImplCopyWith<$Res> {
  factory _$$PublicTransportImplCopyWith(_$PublicTransportImpl value,
          $Res Function(_$PublicTransportImpl) then) =
      __$$PublicTransportImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> bus_lines, List<String> tram_lines});
}

/// @nodoc
class __$$PublicTransportImplCopyWithImpl<$Res>
    extends _$FeatureTypeCopyWithImpl<$Res, _$PublicTransportImpl>
    implements _$$PublicTransportImplCopyWith<$Res> {
  __$$PublicTransportImplCopyWithImpl(
      _$PublicTransportImpl _value, $Res Function(_$PublicTransportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bus_lines = null,
    Object? tram_lines = null,
  }) {
    return _then(_$PublicTransportImpl(
      null == bus_lines
          ? _value._bus_lines
          : bus_lines // ignore: cast_nullable_to_non_nullable
              as List<String>,
      null == tram_lines
          ? _value._tram_lines
          : tram_lines // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$PublicTransportImpl implements PublicTransport {
  const _$PublicTransportImpl(
      final List<String> bus_lines, final List<String> tram_lines)
      : _bus_lines = bus_lines,
        _tram_lines = tram_lines;

  final List<String> _bus_lines;
  @override
  List<String> get bus_lines {
    if (_bus_lines is EqualUnmodifiableListView) return _bus_lines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bus_lines);
  }

  final List<String> _tram_lines;
  @override
  List<String> get tram_lines {
    if (_tram_lines is EqualUnmodifiableListView) return _tram_lines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tram_lines);
  }

  @override
  String toString() {
    return 'FeatureType.publicTransport(bus_lines: $bus_lines, tram_lines: $tram_lines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublicTransportImpl &&
            const DeepCollectionEquality()
                .equals(other._bus_lines, _bus_lines) &&
            const DeepCollectionEquality()
                .equals(other._tram_lines, _tram_lines));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_bus_lines),
      const DeepCollectionEquality().hash(_tram_lines));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PublicTransportImplCopyWith<_$PublicTransportImpl> get copyWith =>
      __$$PublicTransportImplCopyWithImpl<_$PublicTransportImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() building,
    required TResult Function() lectureHall,
    required TResult Function() room,
    required TResult Function(List<String> connects) door,
    required TResult Function(String toilet_type) toilet,
    required TResult Function(List<int> connects_levels) stairs,
    required TResult Function(List<int> connects_levels) lift,
    required TResult Function(List<String> bus_lines, List<String> tram_lines)
        publicTransport,
  }) {
    return publicTransport(bus_lines, tram_lines);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? building,
    TResult? Function()? lectureHall,
    TResult? Function()? room,
    TResult? Function(List<String> connects)? door,
    TResult? Function(String toilet_type)? toilet,
    TResult? Function(List<int> connects_levels)? stairs,
    TResult? Function(List<int> connects_levels)? lift,
    TResult? Function(List<String> bus_lines, List<String> tram_lines)?
        publicTransport,
  }) {
    return publicTransport?.call(bus_lines, tram_lines);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? building,
    TResult Function()? lectureHall,
    TResult Function()? room,
    TResult Function(List<String> connects)? door,
    TResult Function(String toilet_type)? toilet,
    TResult Function(List<int> connects_levels)? stairs,
    TResult Function(List<int> connects_levels)? lift,
    TResult Function(List<String> bus_lines, List<String> tram_lines)?
        publicTransport,
    required TResult orElse(),
  }) {
    if (publicTransport != null) {
      return publicTransport(bus_lines, tram_lines);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Building value) building,
    required TResult Function(LectureHall value) lectureHall,
    required TResult Function(Room value) room,
    required TResult Function(Door value) door,
    required TResult Function(Toilet value) toilet,
    required TResult Function(Stairs value) stairs,
    required TResult Function(Lift value) lift,
    required TResult Function(PublicTransport value) publicTransport,
  }) {
    return publicTransport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Building value)? building,
    TResult? Function(LectureHall value)? lectureHall,
    TResult? Function(Room value)? room,
    TResult? Function(Door value)? door,
    TResult? Function(Toilet value)? toilet,
    TResult? Function(Stairs value)? stairs,
    TResult? Function(Lift value)? lift,
    TResult? Function(PublicTransport value)? publicTransport,
  }) {
    return publicTransport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Building value)? building,
    TResult Function(LectureHall value)? lectureHall,
    TResult Function(Room value)? room,
    TResult Function(Door value)? door,
    TResult Function(Toilet value)? toilet,
    TResult Function(Stairs value)? stairs,
    TResult Function(Lift value)? lift,
    TResult Function(PublicTransport value)? publicTransport,
    required TResult orElse(),
  }) {
    if (publicTransport != null) {
      return publicTransport(this);
    }
    return orElse();
  }
}

abstract class PublicTransport implements FeatureType {
  const factory PublicTransport(
          final List<String> bus_lines, final List<String> tram_lines) =
      _$PublicTransportImpl;

  List<String> get bus_lines;
  List<String> get tram_lines;
  @JsonKey(ignore: true)
  _$$PublicTransportImplCopyWith<_$PublicTransportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
