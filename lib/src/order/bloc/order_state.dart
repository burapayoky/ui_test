part of 'order_bloc.dart';

abstract class OrderState {
  final Map<String, List<FoodModel>> foodData;
  final String? foodSetId;

  const OrderState({
    this.foodData = const {},
    this.foodSetId,
  });
}

class OrderInitial extends OrderState {}

class OrderUpdateState extends OrderState {
  const OrderUpdateState({
    required Map<String, List<FoodModel>> foodData,
    required String? foodSetId,
  }) : super(
          foodData: foodData,
          foodSetId: foodSetId,
        );
}
