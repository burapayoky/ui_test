part of 'order_bloc.dart';

abstract class OrderEvent {
  const OrderEvent();
}

class OrderUpdateEvent extends OrderEvent {
  final String? foodSetId;

  const OrderUpdateEvent({
    required this.foodSetId,
  });
}
