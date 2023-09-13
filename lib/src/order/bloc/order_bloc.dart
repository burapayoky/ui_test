import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ui_test/src/models/Thaifood.dart';
import 'package:ui_test/src/models/foodmodel.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<OrderInitialEvent>((event, emit) {
      //final myjson = jsonDecode();
      ListfilterFoodata.foodCatName = [];
      ListfilterFoodata.filterfood = [];
      ListfilterFoodata.menufood = [];
      ListfilterFoodata.filterfood = ListfilterFoodata.myfood
          .where((e) => e.foodSetId == 'Srd8o2evE8g=')
          .toList();

      //keepfood.removeWhere((element) => element == "()");
      for (var foodcat in ListfilterFoodata.myfoodcat) {
        List<Foodmodel> keepfood = [];
        for (var food in ListfilterFoodata.filterfood) {
          if (foodcat.foodCatId == food.foodCatId) {
            keepfood.add(food);
          }
          if (food.foodCatId == foodcat.foodCatId) {
            ListfilterFoodata.foodCatName.add(foodcat.foodCatName!);
          }
        }

        ListfilterFoodata.menufood.add(keepfood);
      }
      ListfilterFoodata.foodCatName =
          ListfilterFoodata.foodCatName.toSet().toList();
      ListfilterFoodata.menufood.removeWhere((List element) => element.isEmpty);
      print(ListfilterFoodata.filterfood.length);

      emit(OrderStatefoodsSet(
          foodCatName: ListfilterFoodata.foodCatName,
          filterfood: ListfilterFoodata.filterfood,
          menufood: ListfilterFoodata.menufood));
    });
    on<OrderStateJapanesFoodButtonClickedEvent>((event, emit) {
      ListfilterFoodata.foodCatName = [];
      ListfilterFoodata.filterfood = [];
      ListfilterFoodata.menufood = [];
      ListfilterFoodata.filterfood = ListfilterFoodata.myfood
          .where((e) => e.foodSetId == 'Lkx2cia+nxU=')
          .toList();

      //keepfood.removeWhere((element) => element == "()");
      for (var foodcat in ListfilterFoodata.myfoodcat) {
        List<Foodmodel> keepfood = [];
        for (var food in ListfilterFoodata.filterfood) {
          if (foodcat.foodCatId == food.foodCatId) {
            keepfood.add(food);
          }
          if (food.foodCatId == foodcat.foodCatId) {
            ListfilterFoodata.foodCatName.add(foodcat.foodCatName!);
          }
        }

        ListfilterFoodata.menufood.add(keepfood);
      }
      ListfilterFoodata.foodCatName =
          ListfilterFoodata.foodCatName.toSet().toList();
      ListfilterFoodata.menufood.removeWhere((List element) => element.isEmpty);
      // print("state: ${ListfilterFoodata.foodCatName}");
      // print("state: ${ListfilterFoodata.filterfood}");
      // print("state: ${ListfilterFoodata.menufood}");
      emit(OrderStatefoodsSet(
          foodCatName: ListfilterFoodata.foodCatName,
          filterfood: ListfilterFoodata.filterfood,
          menufood: ListfilterFoodata.menufood));
    });
  }
}
