part of 'order_bloc.dart';

abstract class OrderState {
  final Map<String, List<FoodModel>> foodData;

  const OrderState({
    this.foodData = const {},
  });
}

class OrderInitial extends OrderState {}

class OrderUpdateState extends OrderState {
  const OrderUpdateState({
    required Map<String, List<FoodModel>> foodData,
  }) : super(
          foodData: foodData,
        );
}
