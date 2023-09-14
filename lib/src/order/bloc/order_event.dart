part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class OrderInitialEvent extends OrderEvent {}

class OrderStateThaifoodClickedEvent extends OrderEvent {}

class OrderStateFreeItemButtonClickedEvent extends OrderEvent {}

class OrderStateJapanesFoodButtonClickedEvent extends OrderEvent {}
