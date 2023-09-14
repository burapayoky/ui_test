import 'dart:convert';

import 'package:collection/collection.dart';

class FoodSet {
  final String? foodSetId;
  final String? foodSetName;
  final String? foodSetChar;
  final int? foodSetSorting;
  final bool? isThirdParty;
  final bool? active;

  const FoodSet({
    this.foodSetId,
    this.foodSetName,
    this.foodSetChar,
    this.foodSetSorting,
    this.isThirdParty,
    this.active,
  });

  @override
  String toString() {
    return 'FoodSet{foodSetId: $foodSetId, foodSetName: $foodSetName, foodSetChar: $foodSetChar, foodSetSorting: $foodSetSorting, isThirdParty: $isThirdParty, active: $active}';
  }

  factory FoodSet.fromMap(Map<String, dynamic> data) => FoodSet(
        foodSetId: data['foodSetId'] as String?,
        foodSetName: data['foodSetName'] as String?,
        foodSetChar: data['foodSetChar'] as String?,
        foodSetSorting: data['foodSetSorting'] as int?,
        isThirdParty: data['isThirdParty'] as bool?,
        active: data['active'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'foodSetId': foodSetId,
        'foodSetName': foodSetName,
        'foodSetChar': foodSetChar,
        'foodSetSorting': foodSetSorting,
        'isThirdParty': isThirdParty,
        'active': active,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [FoodCategory].
  factory FoodSet.fromJson(String data) {
    return FoodSet.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [FoodCategory] to a JSON string.
  String toJson() => json.encode(toMap());

  FoodSet copyWith({
    String? foodSetId,
    String? foodSetName,
    String? foodSetChar,
    int? foodSetSorting,
    bool? isThirdParty,
    bool? active,
  }) {
    return FoodSet(
      foodSetId: foodSetId ?? this.foodSetId,
      foodSetName: foodSetName ?? this.foodSetName,
      foodSetChar: foodSetChar ?? this.foodSetChar,
      foodSetSorting: foodSetSorting ?? this.foodSetSorting,
      isThirdParty: isThirdParty ?? this.isThirdParty,
      active: active ?? this.active,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! FoodSet) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      foodSetId.hashCode ^
      foodSetName.hashCode ^
      foodSetChar.hashCode ^
      foodSetSorting.hashCode ^
      isThirdParty.hashCode ^
      active.hashCode;
}
