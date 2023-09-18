part of 'order_bloc.dart';

abstract class OrderState {
  final Map<String, List<FoodModel>> foodData;
  final String? foodSetId;
  late int selectedId;

  OrderState({
    this.foodData = const {},
    this.foodSetId,
    this.selectedId = 0,
  });
}

class OrderInitial extends OrderState {}

class OrderUpdateState extends OrderState {
  OrderUpdateState({
    required Map<String, List<FoodModel>> foodData,
    required String? foodSetId,
    required int selectedId,
  }) : super(foodData: foodData, foodSetId: foodSetId, selectedId: selectedId);
}

class OrderUpdateColorsState extends OrderState {
  OrderUpdateColorsState({required selectedId}) : super(selectedId: selectedId);
}
