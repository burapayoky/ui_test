import 'dart:convert';
//
import 'package:collection/collection.dart';

class FoodCategory {
  final String? foodCatId;
  final String? foodCatName;
  final int? foodCatSorting;
  final dynamic foodCatDesc;
  final String? foodCatColor;
  final String? foodCatIcon;
  final bool? priority;
  final int? foodCatParent;
  final bool? active;

  const FoodCategory({
    this.foodCatId,
    this.foodCatName,
    this.foodCatSorting,
    this.foodCatDesc,
    this.foodCatColor,
    this.foodCatIcon,
    this.priority,
    this.foodCatParent,
    this.active,
  });

  @override
  String toString() {
    return 'FoodCategory(foodCatId: $foodCatId, foodCatName: $foodCatName, foodCatSorting: $foodCatSorting, foodCatDesc: $foodCatDesc, foodCatColor: $foodCatColor, foodCatIcon: $foodCatIcon, priority: $priority, foodCatParent: $foodCatParent, active: $active)';
  }

  factory FoodCategory.fromMap(Map<String, dynamic> data) => FoodCategory(
        foodCatId: data['foodCatId'] as String?,
        foodCatName: data['foodCatName'] as String?,
        foodCatSorting: data['foodCatSorting'] as int?,
        foodCatDesc: data['foodCatDesc'] as dynamic,
        foodCatColor: data['foodCatColor'] as String?,
        foodCatIcon: data['foodCatIcon'] as String?,
        priority: data['priority'] as bool?,
        foodCatParent: data['foodCatParent'] as int?,
        active: data['active'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        'foodCatId': foodCatId,
        'foodCatName': foodCatName,
        'foodCatSorting': foodCatSorting,
        'foodCatDesc': foodCatDesc,
        'foodCatColor': foodCatColor,
        'foodCatIcon': foodCatIcon,
        'priority': priority,
        'foodCatParent': foodCatParent,
        'active': active,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [FoodCategory].
  factory FoodCategory.fromJson(String data) {
    return FoodCategory.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [FoodCategory] to a JSON string.
  String toJson() => json.encode(toMap());

  FoodCategory copyWith({
    String? foodCatId,
    String? foodCatName,
    int? foodCatSorting,
    dynamic foodCatDesc,
    String? foodCatColor,
    String? foodCatIcon,
    bool? priority,
    int? foodCatParent,
    bool? active,
  }) {
    return FoodCategory(
      foodCatId: foodCatId ?? this.foodCatId,
      foodCatName: foodCatName ?? this.foodCatName,
      foodCatSorting: foodCatSorting ?? this.foodCatSorting,
      foodCatDesc: foodCatDesc ?? this.foodCatDesc,
      foodCatColor: foodCatColor ?? this.foodCatColor,
      foodCatIcon: foodCatIcon ?? this.foodCatIcon,
      priority: priority ?? this.priority,
      foodCatParent: foodCatParent ?? this.foodCatParent,
      active: active ?? this.active,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! FoodCategory) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      foodCatId.hashCode ^
      foodCatName.hashCode ^
      foodCatSorting.hashCode ^
      foodCatDesc.hashCode ^
      foodCatColor.hashCode ^
      foodCatIcon.hashCode ^
      priority.hashCode ^
      foodCatParent.hashCode ^
      active.hashCode;
}
