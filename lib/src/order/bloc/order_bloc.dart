import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ui_test/src/models/Thaifood.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<OrderInitialEvent>((event, emit) {
      //final myjson = jsonDecode();
      final List<Map<String, dynamic>> ThaiMenu = [];
      final List<Map<String, dynamic>> JapaneseMenu = [];
      final List<Map<String, dynamic>> FreeItem = [];
      for (var v in ListFoodata.food) {
        if (v['foodSetId'] == 'Srd8o2evE8g=') {
          ThaiMenu.add(v);
        } else if (v['foodSetId'] == 'Lkx2cia+nxU=') {
          JapaneseMenu.add(v);
        } else if (v['foodSetId'] == 'iS94mlBDp70=') {
          FreeItem.add(v);
        }
      }
      emit(OrderStatefoodsSet(
          ThaiMenu: ThaiMenu, JapanMenu: JapaneseMenu, FreeItem: FreeItem));
    });
  }
}
