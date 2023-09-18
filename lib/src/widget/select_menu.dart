import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:ui_test/extensions/build_context.dart';
import 'package:ui_test/src/data/food_data.dart';
import 'package:ui_test/src/models/food_category_model.dart';
import 'package:ui_test/src/order/bloc/order_bloc.dart';
import 'package:ui_test/src/widget/order/sliverlist_foodorder.dart';

class SelectedMenu extends StatefulWidget {
  const SelectedMenu({
    super.key,
  });

  @override
  State<SelectedMenu> createState() => _SelectedMenuState();
}

class _SelectedMenuState extends State<SelectedMenu> {
//Scroll Controller
  final ItemScrollController itemScrollController = ItemScrollController();
  final ScrollOffsetController scrollOffsetController =
      ScrollOffsetController();
//Fuction Scroll to index
  void scrollTo(int index) => itemScrollController.scrollTo(
        index: index,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
//
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<OrderBloc>().add(
          const OrderUpdateEvent(foodSetId: 'Srd8o2evE8g='),
        );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;
    //final isPortrait = screenHeight > screenWidth;
    final isLandscape = screenWidth > screenHeight;

    PreferredSizeWidget appBar() {
      return AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 20,
            height: 14,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black12,
            ),
            child: const Row(
              children: [
                Icon(Icons.keyboard_arrow_left),
                Text(
                  'Back',
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
        ),

        //aciton
        actions: [
          Container(
            height: double.infinity,
            width: 150,
            decoration: BoxDecoration(
              color: const Color.fromARGB(104, 182, 180, 180),
              borderRadius: BorderRadius.circular(8),

              //border: Border.all(color: Colors.black)),
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
                SizedBox(
                  width: 100,
                  child: TextField(
                    onChanged: (value) {
                      context.read<OrderBloc>().add(
                            OrderSearchEvent(
                              text: value,
                            ),
                          );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

// thai Menu,Japan Menu,FreeItem {foodSet}
    Widget selectedFoodSet() {
      return SizedBox(
        height:
            isLandscape ? context.screenHeight / 16 : context.screenWidth / 12,
        width: double.infinity,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ...FoodData.getFoodSet().mapIndexed(
              (i, e) {
                int _coLor = 0;
                return BlocBuilder<OrderBloc, OrderState>(
                  builder: (context, state) {
                    return SizedBox(
                      height: isLandscape
                          ? context.screenHeight / 14
                          : context.screenWidth / 9,
                      width: isLandscape
                          ? context.screenWidth / 8
                          : context.screenHeight / 4,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<OrderBloc>().add(
                                  OrderUpdateEvent(foodSetId: e.foodSetId),
                                );
                          },
                          //onpress

                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(
                                      color: _coLor == i
                                          ? Colors.black26
                                          : const Color.fromARGB(
                                              66, 235, 229, 229))),
                              backgroundColor: _coLor == i
                                  ? Colors.cyan
                                  : const Color.fromARGB(66, 235, 229, 229)),
                          child: Text(
                            e.foodSetName ?? '',
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontFamily: 'Roboto',
                                color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      );
    }

//KidMenu,SideOrder,Luch,Appitizer {foodcat}
    Widget selectedFoodCategory() {
      return BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          //filtter foodCat
          List<FoodCategory> foodCategories = state.foodData.keys
              .map((e) {
                return FoodData.getFoodCategories().firstWhereOrNull((f) {
                  return f.foodCatId == e;
                });
              })
              .whereType<FoodCategory>()
              .toList();

          foodCategories.sort(((a, b) {
            return a.foodCatId!.toLowerCase().compareTo(
                  b.foodCatId!.toLowerCase(),
                );
          }));

          return Padding(
            padding: const EdgeInsets.all(14),
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: foodCategories.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextButton(
                      onPressed: () {
                        scrollTo(index);
                      },
                      child: Text(
                        foodCategories[index].foodCatName ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      );
    }

//Images,FoodName,FoodDest,price {Food}
    Widget foodMenu() {
      return BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          final foodData = state.foodData.entries.where((e) {
            final foodCategory =
                FoodData.getFoodCategories().firstWhereOrNull((foodCat) {
              return foodCat.foodCatId == e.key;
            });

            if (foodCategory == null) {
              return false;
            }

            return true;
          }).toList();

          foodData.sort(((a, b) {
            return a.key.toLowerCase().compareTo(b.key.toLowerCase());
          }));

          return ScrollablePositionedList.builder(
            itemScrollController: itemScrollController,
            itemCount: foodData.length,
            itemBuilder: (context, index) {
              final foodCategory =
                  FoodData.getFoodCategories().firstWhereOrNull((e) {
                return e.foodCatId == foodData[index].key;
              });

              if (foodCategory == null) {
                return Container();
              }

              return SliverListFoodOrder(
                foodCategoryName: foodCategory.foodCatName ?? '',
                foods: foodData[index].value,
              );
            },
          );
        },
      );
    }

    return Scaffold(
        appBar: appBar(),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: context.screenHeight / 15,
                    child: selectedFoodSet(),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: isLandscape
                        ? context.screenHeight / 11
                        : context.screenWidth / 8,
                    child: selectedFoodCategory(),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(child: foodMenu()),
            )
          ],
        ));
  }
}
