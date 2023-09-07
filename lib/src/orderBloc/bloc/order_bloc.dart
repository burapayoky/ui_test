import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:ui_test/src/models/foodmodel.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<OrderInitialEvent>((event, emit) {
      //final myjson = jsonDecode();
    });
  }
}
