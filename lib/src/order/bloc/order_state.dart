part of 'order_bloc.dart';

sealed class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

final class OrderInitial extends OrderState {}

class OrderStatefoodsSet extends OrderState {
  final List<Map<String, dynamic>> ThaiMenu;
  final List<Map<String, dynamic>> JapanMenu;
  final List<Map<String, dynamic>> FreeItem;
  OrderStatefoodsSet({
    required this.ThaiMenu,
    required this.JapanMenu,
    required this.FreeItem,
  });
}
