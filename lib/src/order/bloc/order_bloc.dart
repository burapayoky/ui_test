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

      // print(state.selectedCat);
      final Map<String, List<FoodModel>> foodData =
          filteredFoodSet.fold({}, (prev, cur) {
        if (prev.containsKey(cur.foodCatId)) {
          prev[cur.foodCatId]!.add(cur);
        } else {
          prev[cur.foodCatId!] = [cur];
        }

        return prev;
      });
      // emit(OrderUpdateColorsState(selectedId: state.selectedId));
      emit(
        OrderUpdateState(
          foodData: foodData,
          foodSetId: event.foodSetId,
        ),
      );
    });

    on<OrderSearchEvent>(
      ((event, emit) {
        //ไม่มีfood
        if (state.foodSetId == null) {
          return;
        }
        //////////

        //////////
        final List<FoodModel> filteredFoodSet;
        //ไม่มีsearchtext
        if (event.text == null || event.text!.isEmpty) {
          filteredFoodSet = FoodData.getFoods().where((e) {
            return e.foodSetId == state.foodSetId;
          }).toList();
        } else {
          filteredFoodSet = FoodData.getFoods().where((e) {
            return e.foodSetId == state.foodSetId;
          }).where((e) {
            if (e.foodName == null) {
              return false;
            }

            return e.foodName!
                    .toLowerCase()
                    .contains(event.text!.toLowerCase()) ||
                e.foodDesc!.toLowerCase().contains(event.text!.toLowerCase());
          }).toList();
        }

        final Map<String, List<FoodModel>> foodData =
            filteredFoodSet.fold({}, (prev, cur) {
          if (prev.containsKey(cur.foodCatId)) {
            prev[cur.foodCatId]!.add(cur);
          } else {
            prev[cur.foodCatId!] = [cur];
          }

          return prev;
        });

        emit(
          OrderUpdateState(
            foodData: foodData,
            foodSetId: state.foodSetId,
          ),
        );
      }),
    );
  }
}
