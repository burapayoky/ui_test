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

class OrderSearchEvent extends OrderEvent {
  final String? text;

  const OrderSearchEvent({
    required this.text,
  });
}
