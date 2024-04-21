// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_controller.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSettingsCollection on Isar {
  IsarCollection<Settings> get settings => this.collection();
}

const SettingsSchema = CollectionSchema(
  name: r'Settings',
  id: -8656046621518759136,
  properties: {
    r'femaleToilets': PropertySchema(
      id: 0,
      name: r'femaleToilets',
      type: IsarType.bool,
    ),
    r'handicapToilets': PropertySchema(
      id: 1,
      name: r'handicapToilets',
      type: IsarType.bool,
    ),
    r'maleToilets': PropertySchema(
      id: 2,
      name: r'maleToilets',
      type: IsarType.bool,
    ),
    r'showComputerPools': PropertySchema(
      id: 3,
      name: r'showComputerPools',
      type: IsarType.bool,
    ),
    r'showDoors': PropertySchema(
      id: 4,
      name: r'showDoors',
      type: IsarType.bool,
    ),
    r'showElevators': PropertySchema(
      id: 5,
      name: r'showElevators',
      type: IsarType.bool,
    ),
    r'showFoodAndDrink': PropertySchema(
      id: 6,
      name: r'showFoodAndDrink',
      type: IsarType.bool,
    ),
    r'showIcons': PropertySchema(
      id: 7,
      name: r'showIcons',
      type: IsarType.bool,
    ),
    r'showLectureHalls': PropertySchema(
      id: 8,
      name: r'showLectureHalls',
      type: IsarType.bool,
    ),
    r'showSeminarRooms': PropertySchema(
      id: 9,
      name: r'showSeminarRooms',
      type: IsarType.bool,
    ),
    r'showStairs': PropertySchema(
      id: 10,
      name: r'showStairs',
      type: IsarType.bool,
    ),
    r'showToilets': PropertySchema(
      id: 11,
      name: r'showToilets',
      type: IsarType.bool,
    )
  },
  estimateSize: _settingsEstimateSize,
  serialize: _settingsSerialize,
  deserialize: _settingsDeserialize,
  deserializeProp: _settingsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _settingsGetId,
  getLinks: _settingsGetLinks,
  attach: _settingsAttach,
  version: '3.1.0+1',
);

int _settingsEstimateSize(
  Settings object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _settingsSerialize(
  Settings object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.femaleToilets);
  writer.writeBool(offsets[1], object.handicapToilets);
  writer.writeBool(offsets[2], object.maleToilets);
  writer.writeBool(offsets[3], object.showComputerPools);
  writer.writeBool(offsets[4], object.showDoors);
  writer.writeBool(offsets[5], object.showElevators);
  writer.writeBool(offsets[6], object.showFoodAndDrink);
  writer.writeBool(offsets[7], object.showIcons);
  writer.writeBool(offsets[8], object.showLectureHalls);
  writer.writeBool(offsets[9], object.showSeminarRooms);
  writer.writeBool(offsets[10], object.showStairs);
  writer.writeBool(offsets[11], object.showToilets);
}

Settings _settingsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Settings();
  object.femaleToilets = reader.readBool(offsets[0]);
  object.handicapToilets = reader.readBool(offsets[1]);
  object.id = id;
  object.maleToilets = reader.readBool(offsets[2]);
  object.showComputerPools = reader.readBool(offsets[3]);
  object.showDoors = reader.readBool(offsets[4]);
  object.showElevators = reader.readBool(offsets[5]);
  object.showFoodAndDrink = reader.readBool(offsets[6]);
  object.showIcons = reader.readBool(offsets[7]);
  object.showLectureHalls = reader.readBool(offsets[8]);
  object.showSeminarRooms = reader.readBool(offsets[9]);
  object.showStairs = reader.readBool(offsets[10]);
  object.showToilets = reader.readBool(offsets[11]);
  return object;
}

P _settingsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _settingsGetId(Settings object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _settingsGetLinks(Settings object) {
  return [];
}

void _settingsAttach(IsarCollection<dynamic> col, Id id, Settings object) {
  object.id = id;
}

extension SettingsQueryWhereSort on QueryBuilder<Settings, Settings, QWhere> {
  QueryBuilder<Settings, Settings, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SettingsQueryWhere on QueryBuilder<Settings, Settings, QWhereClause> {
  QueryBuilder<Settings, Settings, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Settings, Settings, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SettingsQueryFilter
    on QueryBuilder<Settings, Settings, QFilterCondition> {
  QueryBuilder<Settings, Settings, QAfterFilterCondition> femaleToiletsEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'femaleToilets',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      handicapToiletsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'handicapToilets',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> maleToiletsEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maleToilets',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      showComputerPoolsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showComputerPools',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> showDoorsEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showDoors',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> showElevatorsEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showElevators',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      showFoodAndDrinkEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showFoodAndDrink',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> showIconsEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showIcons',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      showLectureHallsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showLectureHalls',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      showSeminarRoomsEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showSeminarRooms',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> showStairsEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showStairs',
        value: value,
      ));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> showToiletsEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'showToilets',
        value: value,
      ));
    });
  }
}

extension SettingsQueryObject
    on QueryBuilder<Settings, Settings, QFilterCondition> {}

extension SettingsQueryLinks
    on QueryBuilder<Settings, Settings, QFilterCondition> {}

extension SettingsQuerySortBy on QueryBuilder<Settings, Settings, QSortBy> {
  QueryBuilder<Settings, Settings, QAfterSortBy> sortByFemaleToilets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'femaleToilets', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByFemaleToiletsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'femaleToilets', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByHandicapToilets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handicapToilets', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByHandicapToiletsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handicapToilets', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByMaleToilets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maleToilets', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByMaleToiletsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maleToilets', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByShowComputerPools() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showComputerPools', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByShowComputerPoolsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showComputerPools', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByShowDoors() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showDoors', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByShowDoorsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showDoors', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByShowElevators() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showElevators', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByShowElevatorsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showElevators', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByShowFoodAndDrink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showFoodAndDrink', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByShowFoodAndDrinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showFoodAndDrink', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByShowIcons() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showIcons', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByShowIconsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showIcons', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByShowLectureHalls() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showLectureHalls', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByShowLectureHallsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showLectureHalls', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByShowSeminarRooms() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showSeminarRooms', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByShowSeminarRoomsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showSeminarRooms', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByShowStairs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showStairs', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByShowStairsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showStairs', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByShowToilets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showToilets', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByShowToiletsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showToilets', Sort.desc);
    });
  }
}

extension SettingsQuerySortThenBy
    on QueryBuilder<Settings, Settings, QSortThenBy> {
  QueryBuilder<Settings, Settings, QAfterSortBy> thenByFemaleToilets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'femaleToilets', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByFemaleToiletsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'femaleToilets', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByHandicapToilets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handicapToilets', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByHandicapToiletsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'handicapToilets', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByMaleToilets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maleToilets', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByMaleToiletsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maleToilets', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByShowComputerPools() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showComputerPools', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByShowComputerPoolsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showComputerPools', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByShowDoors() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showDoors', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByShowDoorsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showDoors', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByShowElevators() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showElevators', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByShowElevatorsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showElevators', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByShowFoodAndDrink() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showFoodAndDrink', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByShowFoodAndDrinkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showFoodAndDrink', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByShowIcons() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showIcons', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByShowIconsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showIcons', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByShowLectureHalls() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showLectureHalls', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByShowLectureHallsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showLectureHalls', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByShowSeminarRooms() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showSeminarRooms', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByShowSeminarRoomsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showSeminarRooms', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByShowStairs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showStairs', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByShowStairsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showStairs', Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByShowToilets() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showToilets', Sort.asc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByShowToiletsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'showToilets', Sort.desc);
    });
  }
}

extension SettingsQueryWhereDistinct
    on QueryBuilder<Settings, Settings, QDistinct> {
  QueryBuilder<Settings, Settings, QDistinct> distinctByFemaleToilets() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'femaleToilets');
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByHandicapToilets() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'handicapToilets');
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByMaleToilets() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maleToilets');
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByShowComputerPools() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showComputerPools');
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByShowDoors() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showDoors');
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByShowElevators() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showElevators');
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByShowFoodAndDrink() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showFoodAndDrink');
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByShowIcons() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showIcons');
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByShowLectureHalls() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showLectureHalls');
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByShowSeminarRooms() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showSeminarRooms');
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByShowStairs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showStairs');
    });
  }

  QueryBuilder<Settings, Settings, QDistinct> distinctByShowToilets() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'showToilets');
    });
  }
}

extension SettingsQueryProperty
    on QueryBuilder<Settings, Settings, QQueryProperty> {
  QueryBuilder<Settings, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Settings, bool, QQueryOperations> femaleToiletsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'femaleToilets');
    });
  }

  QueryBuilder<Settings, bool, QQueryOperations> handicapToiletsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'handicapToilets');
    });
  }

  QueryBuilder<Settings, bool, QQueryOperations> maleToiletsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maleToilets');
    });
  }

  QueryBuilder<Settings, bool, QQueryOperations> showComputerPoolsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showComputerPools');
    });
  }

  QueryBuilder<Settings, bool, QQueryOperations> showDoorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showDoors');
    });
  }

  QueryBuilder<Settings, bool, QQueryOperations> showElevatorsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showElevators');
    });
  }

  QueryBuilder<Settings, bool, QQueryOperations> showFoodAndDrinkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showFoodAndDrink');
    });
  }

  QueryBuilder<Settings, bool, QQueryOperations> showIconsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showIcons');
    });
  }

  QueryBuilder<Settings, bool, QQueryOperations> showLectureHallsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showLectureHalls');
    });
  }

  QueryBuilder<Settings, bool, QQueryOperations> showSeminarRoomsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showSeminarRooms');
    });
  }

  QueryBuilder<Settings, bool, QQueryOperations> showStairsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showStairs');
    });
  }

  QueryBuilder<Settings, bool, QQueryOperations> showToiletsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'showToilets');
    });
  }
}
