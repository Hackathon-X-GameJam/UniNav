// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'graph.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GraphFeature {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int floor, Feature building) buildingFloor,
    required TResult Function(int fromFloor, String from, int toFloor,
            String to, Feature baseFeature)
        portal,
    required TResult Function(int floor, String building, Feature feature)
        basicFeature,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int floor, Feature building)? buildingFloor,
    TResult? Function(int fromFloor, String from, int toFloor, String to,
            Feature baseFeature)?
        portal,
    TResult? Function(int floor, String building, Feature feature)?
        basicFeature,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int floor, Feature building)? buildingFloor,
    TResult Function(int fromFloor, String from, int toFloor, String to,
            Feature baseFeature)?
        portal,
    TResult Function(int floor, String building, Feature feature)? basicFeature,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BuildingFloor value) buildingFloor,
    required TResult Function(Portal value) portal,
    required TResult Function(BasicFeature value) basicFeature,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BuildingFloor value)? buildingFloor,
    TResult? Function(Portal value)? portal,
    TResult? Function(BasicFeature value)? basicFeature,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BuildingFloor value)? buildingFloor,
    TResult Function(Portal value)? portal,
    TResult Function(BasicFeature value)? basicFeature,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GraphFeatureCopyWith<$Res> {
  factory $GraphFeatureCopyWith(
          GraphFeature value, $Res Function(GraphFeature) then) =
      _$GraphFeatureCopyWithImpl<$Res, GraphFeature>;
}

/// @nodoc
class _$GraphFeatureCopyWithImpl<$Res, $Val extends GraphFeature>
    implements $GraphFeatureCopyWith<$Res> {
  _$GraphFeatureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$BuildingFloorImplCopyWith<$Res> {
  factory _$$BuildingFloorImplCopyWith(
          _$BuildingFloorImpl value, $Res Function(_$BuildingFloorImpl) then) =
      __$$BuildingFloorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int floor, Feature building});

  $FeatureCopyWith<$Res> get building;
}

/// @nodoc
class __$$BuildingFloorImplCopyWithImpl<$Res>
    extends _$GraphFeatureCopyWithImpl<$Res, _$BuildingFloorImpl>
    implements _$$BuildingFloorImplCopyWith<$Res> {
  __$$BuildingFloorImplCopyWithImpl(
      _$BuildingFloorImpl _value, $Res Function(_$BuildingFloorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? floor = null,
    Object? building = null,
  }) {
    return _then(_$BuildingFloorImpl(
      null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int,
      null == building
          ? _value.building
          : building // ignore: cast_nullable_to_non_nullable
              as Feature,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FeatureCopyWith<$Res> get building {
    return $FeatureCopyWith<$Res>(_value.building, (value) {
      return _then(_value.copyWith(building: value));
    });
  }
}

/// @nodoc

class _$BuildingFloorImpl extends BuildingFloor {
  const _$BuildingFloorImpl(this.floor, this.building) : super._();

  @override
  final int floor;
  @override
  final Feature building;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BuildingFloorImplCopyWith<_$BuildingFloorImpl> get copyWith =>
      __$$BuildingFloorImplCopyWithImpl<_$BuildingFloorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int floor, Feature building) buildingFloor,
    required TResult Function(int fromFloor, String from, int toFloor,
            String to, Feature baseFeature)
        portal,
    required TResult Function(int floor, String building, Feature feature)
        basicFeature,
  }) {
    return buildingFloor(floor, building);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int floor, Feature building)? buildingFloor,
    TResult? Function(int fromFloor, String from, int toFloor, String to,
            Feature baseFeature)?
        portal,
    TResult? Function(int floor, String building, Feature feature)?
        basicFeature,
  }) {
    return buildingFloor?.call(floor, building);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int floor, Feature building)? buildingFloor,
    TResult Function(int fromFloor, String from, int toFloor, String to,
            Feature baseFeature)?
        portal,
    TResult Function(int floor, String building, Feature feature)? basicFeature,
    required TResult orElse(),
  }) {
    if (buildingFloor != null) {
      return buildingFloor(floor, building);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BuildingFloor value) buildingFloor,
    required TResult Function(Portal value) portal,
    required TResult Function(BasicFeature value) basicFeature,
  }) {
    return buildingFloor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BuildingFloor value)? buildingFloor,
    TResult? Function(Portal value)? portal,
    TResult? Function(BasicFeature value)? basicFeature,
  }) {
    return buildingFloor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BuildingFloor value)? buildingFloor,
    TResult Function(Portal value)? portal,
    TResult Function(BasicFeature value)? basicFeature,
    required TResult orElse(),
  }) {
    if (buildingFloor != null) {
      return buildingFloor(this);
    }
    return orElse();
  }
}

abstract class BuildingFloor extends GraphFeature {
  const factory BuildingFloor(final int floor, final Feature building) =
      _$BuildingFloorImpl;
  const BuildingFloor._() : super._();

  int get floor;
  Feature get building;
  @JsonKey(ignore: true)
  _$$BuildingFloorImplCopyWith<_$BuildingFloorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PortalImplCopyWith<$Res> {
  factory _$$PortalImplCopyWith(
          _$PortalImpl value, $Res Function(_$PortalImpl) then) =
      __$$PortalImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int fromFloor,
      String from,
      int toFloor,
      String to,
      Feature baseFeature});

  $FeatureCopyWith<$Res> get baseFeature;
}

/// @nodoc
class __$$PortalImplCopyWithImpl<$Res>
    extends _$GraphFeatureCopyWithImpl<$Res, _$PortalImpl>
    implements _$$PortalImplCopyWith<$Res> {
  __$$PortalImplCopyWithImpl(
      _$PortalImpl _value, $Res Function(_$PortalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromFloor = null,
    Object? from = null,
    Object? toFloor = null,
    Object? to = null,
    Object? baseFeature = null,
  }) {
    return _then(_$PortalImpl(
      null == fromFloor
          ? _value.fromFloor
          : fromFloor // ignore: cast_nullable_to_non_nullable
              as int,
      null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      null == toFloor
          ? _value.toFloor
          : toFloor // ignore: cast_nullable_to_non_nullable
              as int,
      null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
      null == baseFeature
          ? _value.baseFeature
          : baseFeature // ignore: cast_nullable_to_non_nullable
              as Feature,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FeatureCopyWith<$Res> get baseFeature {
    return $FeatureCopyWith<$Res>(_value.baseFeature, (value) {
      return _then(_value.copyWith(baseFeature: value));
    });
  }
}

/// @nodoc

class _$PortalImpl extends Portal {
  const _$PortalImpl(
      this.fromFloor, this.from, this.toFloor, this.to, this.baseFeature)
      : super._();

  @override
  final int fromFloor;
  @override
  final String from;
  @override
  final int toFloor;
  @override
  final String to;
  @override
  final Feature baseFeature;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PortalImplCopyWith<_$PortalImpl> get copyWith =>
      __$$PortalImplCopyWithImpl<_$PortalImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int floor, Feature building) buildingFloor,
    required TResult Function(int fromFloor, String from, int toFloor,
            String to, Feature baseFeature)
        portal,
    required TResult Function(int floor, String building, Feature feature)
        basicFeature,
  }) {
    return portal(fromFloor, from, toFloor, to, baseFeature);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int floor, Feature building)? buildingFloor,
    TResult? Function(int fromFloor, String from, int toFloor, String to,
            Feature baseFeature)?
        portal,
    TResult? Function(int floor, String building, Feature feature)?
        basicFeature,
  }) {
    return portal?.call(fromFloor, from, toFloor, to, baseFeature);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int floor, Feature building)? buildingFloor,
    TResult Function(int fromFloor, String from, int toFloor, String to,
            Feature baseFeature)?
        portal,
    TResult Function(int floor, String building, Feature feature)? basicFeature,
    required TResult orElse(),
  }) {
    if (portal != null) {
      return portal(fromFloor, from, toFloor, to, baseFeature);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BuildingFloor value) buildingFloor,
    required TResult Function(Portal value) portal,
    required TResult Function(BasicFeature value) basicFeature,
  }) {
    return portal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BuildingFloor value)? buildingFloor,
    TResult? Function(Portal value)? portal,
    TResult? Function(BasicFeature value)? basicFeature,
  }) {
    return portal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BuildingFloor value)? buildingFloor,
    TResult Function(Portal value)? portal,
    TResult Function(BasicFeature value)? basicFeature,
    required TResult orElse(),
  }) {
    if (portal != null) {
      return portal(this);
    }
    return orElse();
  }
}

abstract class Portal extends GraphFeature {
  const factory Portal(
      final int fromFloor,
      final String from,
      final int toFloor,
      final String to,
      final Feature baseFeature) = _$PortalImpl;
  const Portal._() : super._();

  int get fromFloor;
  String get from;
  int get toFloor;
  String get to;
  Feature get baseFeature;
  @JsonKey(ignore: true)
  _$$PortalImplCopyWith<_$PortalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BasicFeatureImplCopyWith<$Res> {
  factory _$$BasicFeatureImplCopyWith(
          _$BasicFeatureImpl value, $Res Function(_$BasicFeatureImpl) then) =
      __$$BasicFeatureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int floor, String building, Feature feature});

  $FeatureCopyWith<$Res> get feature;
}

/// @nodoc
class __$$BasicFeatureImplCopyWithImpl<$Res>
    extends _$GraphFeatureCopyWithImpl<$Res, _$BasicFeatureImpl>
    implements _$$BasicFeatureImplCopyWith<$Res> {
  __$$BasicFeatureImplCopyWithImpl(
      _$BasicFeatureImpl _value, $Res Function(_$BasicFeatureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? floor = null,
    Object? building = null,
    Object? feature = null,
  }) {
    return _then(_$BasicFeatureImpl(
      null == floor
          ? _value.floor
          : floor // ignore: cast_nullable_to_non_nullable
              as int,
      null == building
          ? _value.building
          : building // ignore: cast_nullable_to_non_nullable
              as String,
      null == feature
          ? _value.feature
          : feature // ignore: cast_nullable_to_non_nullable
              as Feature,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FeatureCopyWith<$Res> get feature {
    return $FeatureCopyWith<$Res>(_value.feature, (value) {
      return _then(_value.copyWith(feature: value));
    });
  }
}

/// @nodoc

class _$BasicFeatureImpl extends BasicFeature {
  const _$BasicFeatureImpl(this.floor, this.building, this.feature) : super._();

  @override
  final int floor;
  @override
  final String building;
  @override
  final Feature feature;

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BasicFeatureImplCopyWith<_$BasicFeatureImpl> get copyWith =>
      __$$BasicFeatureImplCopyWithImpl<_$BasicFeatureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int floor, Feature building) buildingFloor,
    required TResult Function(int fromFloor, String from, int toFloor,
            String to, Feature baseFeature)
        portal,
    required TResult Function(int floor, String building, Feature feature)
        basicFeature,
  }) {
    return basicFeature(floor, building, feature);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int floor, Feature building)? buildingFloor,
    TResult? Function(int fromFloor, String from, int toFloor, String to,
            Feature baseFeature)?
        portal,
    TResult? Function(int floor, String building, Feature feature)?
        basicFeature,
  }) {
    return basicFeature?.call(floor, building, feature);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int floor, Feature building)? buildingFloor,
    TResult Function(int fromFloor, String from, int toFloor, String to,
            Feature baseFeature)?
        portal,
    TResult Function(int floor, String building, Feature feature)? basicFeature,
    required TResult orElse(),
  }) {
    if (basicFeature != null) {
      return basicFeature(floor, building, feature);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BuildingFloor value) buildingFloor,
    required TResult Function(Portal value) portal,
    required TResult Function(BasicFeature value) basicFeature,
  }) {
    return basicFeature(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BuildingFloor value)? buildingFloor,
    TResult? Function(Portal value)? portal,
    TResult? Function(BasicFeature value)? basicFeature,
  }) {
    return basicFeature?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BuildingFloor value)? buildingFloor,
    TResult Function(Portal value)? portal,
    TResult Function(BasicFeature value)? basicFeature,
    required TResult orElse(),
  }) {
    if (basicFeature != null) {
      return basicFeature(this);
    }
    return orElse();
  }
}

abstract class BasicFeature extends GraphFeature {
  const factory BasicFeature(
          final int floor, final String building, final Feature feature) =
      _$BasicFeatureImpl;
  const BasicFeature._() : super._();

  int get floor;
  String get building;
  Feature get feature;
  @JsonKey(ignore: true)
  _$$BasicFeatureImplCopyWith<_$BasicFeatureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
