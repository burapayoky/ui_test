part of 'order_bloc.dart';

sealed class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

final class OrderInitial extends OrderState {}

class OrderStatefoodsSet extends OrderState {
  final List<String> foodCatName;
  final List<Foodmodel> filterfood;
  final List<List> menufood;
  OrderStatefoodsSet({
    required this.foodCatName,
    required this.filterfood,
    required this.menufood,
  });
}
