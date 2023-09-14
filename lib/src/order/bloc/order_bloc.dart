import 'package:bloc/bloc.dart';
import 'package:ui_test/src/data/food_data.dart';
import 'package:ui_test/src/models/food_model.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<OrderUpdateEvent>((event, emit) {
      if (event.foodSetId == null) {
        return;
      }

      final List<FoodModel> filteredFoodSet = FoodData.getFoods().where((e) {
        return e.foodSetId == event.foodSetId;
      }).toList();

      final Map<String, List<FoodModel>> foodData =
          filteredFoodSet.fold({}, (prev, cur) {
        if (prev.containsKey(cur.foodCatId)) {
          prev[cur.foodCatId]!.add(cur);
        } else {
          prev[cur.foodCatId!] = [cur];
        }
        return prev;
      });

      print('detect event');

      emit(OrderUpdateState(foodData: foodData));
    });
  }
}
