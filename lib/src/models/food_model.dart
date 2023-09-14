import 'dart:convert';

import 'package:collection/collection.dart';

class FoodModel {
  final String? foodId;
  final String? foodName;
  final String? foodNameAlt;
  final double? foodPrice;
  final String? foodDesc;
  final int? foodSorting;
  final bool? active;
  final String? foodSetId;
  final String? foodCatId;
  final String? revenueClassId;
  final String? taxRateId;
  final String? taxRate2Id;
  final bool? priority;
  final bool? printSingle;
  final bool? isCommand;
  final bool? foodShowOption;
  final String? foodPdaNumber;
  final String? modifyOn;
  final String? createOn;
  final String? pureImageName;
  final String? imageName;
  final int? qtyLimit;
  final bool? isLimit;
  final String? productId;
  final bool? isOutStock;
  final bool? isFree;
  final bool? isShow;
  final bool? isShowInstruction;
  final String? imageNameString;
  final int? thirdPartyGroupId;
  final String? foodBaseId;
  final bool? isThirdParty;
  final dynamic plu;
  final String? imageThirdParty;

  const FoodModel({
    this.foodId,
    this.foodName,
    this.foodNameAlt,
    this.foodPrice,
    this.foodDesc,
    this.foodSorting,
    this.active,
    this.foodSetId,
    this.foodCatId,
    this.revenueClassId,
    this.taxRateId,
    this.taxRate2Id,
    this.priority,
    this.printSingle,
    this.isCommand,
    this.foodShowOption,
    this.foodPdaNumber,
    this.modifyOn,
    this.createOn,
    this.pureImageName,
    this.imageName,
    this.qtyLimit,
    this.isLimit,
    this.productId,
    this.isOutStock,
    this.isFree,
    this.isShow,
    this.isShowInstruction,
    this.imageNameString,
    this.thirdPartyGroupId,
    this.foodBaseId,
    this.isThirdParty,
    this.plu,
    this.imageThirdParty,
  });

  @override
  String toString() {
    return 'FoodModel(foodId: $foodId, foodName: $foodName, foodNameAlt: $foodNameAlt, foodPrice: $foodPrice, foodDesc: $foodDesc, foodSorting: $foodSorting, active: $active, foodSetId: $foodSetId, foodCatId: $foodCatId, revenueClassId: $revenueClassId, taxRateId: $taxRateId, taxRate2Id: $taxRate2Id, priority: $priority, printSingle: $printSingle, isCommand: $isCommand, foodShowOption: $foodShowOption, foodPdaNumber: $foodPdaNumber, modifyOn: $modifyOn, createOn: $createOn, pureImageName: $pureImageName, imageName: $imageName, qtyLimit: $qtyLimit, isLimit: $isLimit, productId: $productId, isOutStock: $isOutStock, isFree: $isFree, isShow: $isShow, isShowInstruction: $isShowInstruction, imageNameString: $imageNameString, thirdPartyGroupId: $thirdPartyGroupId, foodBaseId: $foodBaseId, isThirdParty: $isThirdParty, plu: $plu, imageThirdParty: $imageThirdParty)';
  }

  factory FoodModel.fromMap(Map<String, dynamic> data) => FoodModel(
        foodId: data['foodId'] as String?,
        foodName: data['foodName'] as String?,
        foodNameAlt: data['foodNameAlt'] as String?,
        foodPrice: (data['foodPrice'] as num?)?.toDouble(),
        foodDesc: data['foodDesc'] as String?,
        foodSorting: data['foodSorting'] as int?,
        active: data['active'] as bool?,
        foodSetId: data['foodSetId'] as String?,
        foodCatId: data['foodCatId'] as String?,
        revenueClassId: data['revenueClassId'] as String?,
        taxRateId: data['taxRateId'] as String?,
        taxRate2Id: data['taxRate2Id'] as String?,
        priority: data['priority'] as bool?,
        printSingle: data['printSingle'] as bool?,
        isCommand: data['isCommand'] as bool?,
        foodShowOption: data['foodShowOption'] as bool?,
        foodPdaNumber: data['foodPDANumber'] as String?,
        modifyOn: data['modifyOn'] as String?,
        createOn: data['createOn'] as String?,
        pureImageName: data['pureImageName'] as String?,
        imageName: data['imageName'] as String?,
        qtyLimit: data['qtyLimit'] as int?,
        isLimit: data['isLimit'] as bool?,
        productId: data['productId'] as String?,
        isOutStock: data['isOutStock'] as bool?,
        isFree: data['isFree'] as bool?,
        isShow: data['isShow'] as bool?,
        isShowInstruction: data['isShowInstruction'] as bool?,
        imageNameString: data['imageNameString'] as String?,
        thirdPartyGroupId: data['thirdPartyGroupId'] as int?,
        foodBaseId: data['foodBaseId'] as String?,
        isThirdParty: data['isThirdParty'] as bool?,
        plu: data['plu'] as dynamic,
        imageThirdParty: data['imageThirdParty'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'foodId': foodId,
        'foodName': foodName,
        'foodNameAlt': foodNameAlt,
        'foodPrice': foodPrice,
        'foodDesc': foodDesc,
        'foodSorting': foodSorting,
        'active': active,
        'foodSetId': foodSetId,
        'foodCatId': foodCatId,
        'revenueClassId': revenueClassId,
        'taxRateId': taxRateId,
        'taxRate2Id': taxRate2Id,
        'priority': priority,
        'printSingle': printSingle,
        'isCommand': isCommand,
        'foodShowOption': foodShowOption,
        'foodPDANumber': foodPdaNumber,
        'modifyOn': modifyOn,
        'createOn': createOn,
        'pureImageName': pureImageName,
        'imageName': imageName,
        'qtyLimit': qtyLimit,
        'isLimit': isLimit,
        'productId': productId,
        'isOutStock': isOutStock,
        'isFree': isFree,
        'isShow': isShow,
        'isShowInstruction': isShowInstruction,
        'imageNameString': imageNameString,
        'thirdPartyGroupId': thirdPartyGroupId,
        'foodBaseId': foodBaseId,
        'isThirdParty': isThirdParty,
        'plu': plu,
        'imageThirdParty': imageThirdParty,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [FoodModel].
  factory FoodModel.fromJson(String data) {
    return FoodModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [FoodModel] to a JSON string.
  String toJson() => json.encode(toMap());

  FoodModel copyWith({
    String? foodId,
    String? foodName,
    String? foodNameAlt,
    double? foodPrice,
    String? foodDesc,
    int? foodSorting,
    bool? active,
    String? foodSetId,
    String? foodCatId,
    String? revenueClassId,
    String? taxRateId,
    String? taxRate2Id,
    bool? priority,
    bool? printSingle,
    bool? isCommand,
    bool? foodShowOption,
    String? foodPdaNumber,
    String? modifyOn,
    String? createOn,
    String? pureImageName,
    String? imageName,
    int? qtyLimit,
    bool? isLimit,
    String? productId,
    bool? isOutStock,
    bool? isFree,
    bool? isShow,
    bool? isShowInstruction,
    String? imageNameString,
    int? thirdPartyGroupId,
    String? foodBaseId,
    bool? isThirdParty,
    dynamic plu,
    String? imageThirdParty,
  }) {
    return FoodModel(
      foodId: foodId ?? this.foodId,
      foodName: foodName ?? this.foodName,
      foodNameAlt: foodNameAlt ?? this.foodNameAlt,
      foodPrice: foodPrice ?? this.foodPrice,
      foodDesc: foodDesc ?? this.foodDesc,
      foodSorting: foodSorting ?? this.foodSorting,
      active: active ?? this.active,
      foodSetId: foodSetId ?? this.foodSetId,
      foodCatId: foodCatId ?? this.foodCatId,
      revenueClassId: revenueClassId ?? this.revenueClassId,
      taxRateId: taxRateId ?? this.taxRateId,
      taxRate2Id: taxRate2Id ?? this.taxRate2Id,
      priority: priority ?? this.priority,
      printSingle: printSingle ?? this.printSingle,
      isCommand: isCommand ?? this.isCommand,
      foodShowOption: foodShowOption ?? this.foodShowOption,
      foodPdaNumber: foodPdaNumber ?? this.foodPdaNumber,
      modifyOn: modifyOn ?? this.modifyOn,
      createOn: createOn ?? this.createOn,
      pureImageName: pureImageName ?? this.pureImageName,
      imageName: imageName ?? this.imageName,
      qtyLimit: qtyLimit ?? this.qtyLimit,
      isLimit: isLimit ?? this.isLimit,
      productId: productId ?? this.productId,
      isOutStock: isOutStock ?? this.isOutStock,
      isFree: isFree ?? this.isFree,
      isShow: isShow ?? this.isShow,
      isShowInstruction: isShowInstruction ?? this.isShowInstruction,
      imageNameString: imageNameString ?? this.imageNameString,
      thirdPartyGroupId: thirdPartyGroupId ?? this.thirdPartyGroupId,
      foodBaseId: foodBaseId ?? this.foodBaseId,
      isThirdParty: isThirdParty ?? this.isThirdParty,
      plu: plu ?? this.plu,
      imageThirdParty: imageThirdParty ?? this.imageThirdParty,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! FoodModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      foodId.hashCode ^
      foodName.hashCode ^
      foodNameAlt.hashCode ^
      foodPrice.hashCode ^
      foodDesc.hashCode ^
      foodSorting.hashCode ^
      active.hashCode ^
      foodSetId.hashCode ^
      foodCatId.hashCode ^
      revenueClassId.hashCode ^
      taxRateId.hashCode ^
      taxRate2Id.hashCode ^
      priority.hashCode ^
      printSingle.hashCode ^
      isCommand.hashCode ^
      foodShowOption.hashCode ^
      foodPdaNumber.hashCode ^
      modifyOn.hashCode ^
      createOn.hashCode ^
      pureImageName.hashCode ^
      imageName.hashCode ^
      qtyLimit.hashCode ^
      isLimit.hashCode ^
      productId.hashCode ^
      isOutStock.hashCode ^
      isFree.hashCode ^
      isShow.hashCode ^
      isShowInstruction.hashCode ^
      imageNameString.hashCode ^
      thirdPartyGroupId.hashCode ^
      foodBaseId.hashCode ^
      isThirdParty.hashCode ^
      plu.hashCode ^
      imageThirdParty.hashCode;
}
