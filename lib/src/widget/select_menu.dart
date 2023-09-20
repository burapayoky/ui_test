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
  final fieldText = TextEditingController();
  bool issearch = false;
//Fuction Scroll to index
  void scrollTo(int index) => itemScrollController.scrollTo(
        index: index,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
  void jumpTo(int index) => itemScrollController.jumpTo(index: index);
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
              color: const Color.fromARGB(31, 156, 155, 155),
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

    Widget headding() {
      return Padding(
          padding: const EdgeInsets.only(top: 28, bottom: 18),
          child: BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 90,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color(0xFFF6F6F6),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.keyboard_arrow_left,
                              size: 30,
                            ),
                            Text(
                              'Back',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  issearch != true
                      ? Container(
                          height: 40,
                          width: 200,
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
                                  controller: fieldText,
                                  onChanged: (value) {
                                    context.read<OrderBloc>().add(
                                          OrderSearchEvent(
                                            text: value,
                                          ),
                                        );
                                  },
                                ),
                              ),
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.close))
                            ],
                          ),
                        )
                      : Container(
                          child: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {},
                          ),
                        ),
                ],
              );
            },
          ));
    }

// thai Menu,Japan Menu,FreeItem {foodSet}
    Widget selectedFoodSet() {
      return SizedBox(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ...FoodData.getFoodSet().mapIndexed(
              (i, e) {
                return BlocBuilder<OrderBloc, OrderState>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: SizedBox(
                        width: isLandscape
                            ? context.screenWidth / 6
                            : context.screenWidth / 5,
                        child: ElevatedButton(
                          onPressed: () {
                            context
                                .read<OrderBloc>()
                                .add(OrderFoodSetUpdateEvent(selectedItem: i));

                            context.read<OrderBloc>().add(
                                  OrderUpdateEvent(foodSetId: e.foodSetId),
                                );
                            fieldText.clear();
                            jumpTo(0);
                            // scrollTo(0);
                          },
                          //onpress

                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(
                                      color: state.selectedId == i
                                          ? const Color.fromARGB(
                                              66, 235, 229, 229)
                                          : const Color.fromARGB(
                                              66, 235, 229, 229))),
                              backgroundColor: state.selectedId == i
                                  ? const Color(0xFF02CCFE)
                                  : const Color(0xFFF6F6F6)),
                          child: Text(
                            e.foodSetName ?? '',
                            style: TextStyle(
                                fontSize: isLandscape
                                    ? screenWidth / 90
                                    : screenWidth / 55,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontFamily: 'Roboto',
                                color: state.selectedId == i
                                    ? Colors.white
                                    : Colors.black87),
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

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: foodCategories.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  color: state.selectedCat == index
                      ? const Color(0xFF02CCFE)
                      : const Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: TextButton(
                  onPressed: () {
                    scrollTo(index);
                  },
                  child: Text(
                    foodCategories[index].foodCatName ?? '',
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: state.selectedCat == index
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              );
            },
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
        //appBar: appBar(),

        body: Padding(
      padding: const EdgeInsets.only(left: 28),
      child: Column(
        children: [
          SafeArea(child: headding()),
          Row(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: isLandscape
                      ? screenHeight / 15
                      : screenWidth / 16, //context.screenHeight / 28,
                  child: selectedFoodSet(),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    width: double.infinity,
                    height: isLandscape
                        ? context.screenHeight / 16
                        : context.screenWidth / 14,
                    child: selectedFoodCategory(),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(child: foodMenu()),
          )
        ],
      ),
    ));
  }
}
