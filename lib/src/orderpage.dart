import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:ui_test/src/fristpage.dart';

import 'package:ui_test/src/models/Thaifood.dart';
import 'package:ui_test/src/models/foodmodel.dart';
import 'package:ui_test/src/order/bloc/order_bloc.dart';

import 'package:ui_test/src/order/orderwidget/sliverlist_foodorder.dart';
import 'widget/appbar/action_flag_icon.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final myfood = ListFoodata.food.map((e) => Foodmodel.fromMap(e)).toList();

  // final foodthai = ListFoodata.where

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<OrderBloc>().add(OrderInitialEvent());
    //loopthaifood();
    //print((ListfilterFoodata.menufood[0].runtimeType));
  }

  loopFreeItem() {
    //Lkx2cia+nxU=
    ListfilterFoodata.myfood = [];

    ListfilterFoodata.foodCatName.clear();
    ListfilterFoodata.myfood =
        ListFoodata.food.map((e) => Foodmodel.fromMap(e)).toList();
    ListfilterFoodata.filterfood = ListfilterFoodata.myfood
        .where((e) => e.foodSetId == 'iS94mlBDp70=')
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
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(),
        // Flexible(
        //     flex: 3,
        //     child: SelectedMenu(
        //         // listCatfoodmenu_: ListfilterFoodata.foodCatName,
        //         // menufood_: ListfilterFoodata.menufood,
        //         )),
        // VerticalDivider(
        //   width: 1,
        //   thickness: 20,
        //   color: Colors.white54,
        // ),
        // Flexible(flex: 1, child: CheckBin())
      ],
    );
  }
}
