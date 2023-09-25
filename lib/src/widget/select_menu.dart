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

  //
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  //
  final fieldText = TextEditingController();
  int listenerindex = 0;
  bool issearch = false;
//Fuction Scroll to index
  void scrollTo(int index) => itemScrollController.scrollTo(
        index: index,
        duration: const Duration(milliseconds: 500),
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

  int selectCategory = 0;
  int foodMenuscroll = 0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;
    //final isPortrait = screenHeight > screenWidth;
    final isLandscape = screenWidth > screenHeight;

    Widget headding() {
      return Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 18),
        child: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width:
                              isLandscape ? screenHeight / 7 : screenWidth / 9,
                          height: isLandscape
                              ? screenHeight / 18
                              : screenWidth / 15,
                          decoration: BoxDecoration(
                              color: const Color(0xFFF6F6F6),
                              borderRadius: BorderRadius.circular(8)),
                          child: const Row(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Expanded(
                                  child: Icon(
                                    Icons.keyboard_arrow_left,
                                    size: 40,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Expanded(
                                  child: Text(
                                    'Back',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black54),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                issearch == true
                    ? Container(
                        height: 40,
                        width: 250,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(104, 182, 180, 180),
                          borderRadius: BorderRadius.circular(8),

                          //border: Border.all(color: Colors.black)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.search,
                            ),
                            SizedBox(
                              width: 150,
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
                              onPressed: () {
                                issearch = false;
                                setState(() {});
                              },
                              icon: const Icon(Icons.close),
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFFF6F6F6),
                              borderRadius: BorderRadius.circular(6)),
                          child: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              issearch = true;
                              setState(() {});
                            },
                          ),
                        ),
                      ),
              ],
            );
          },
        ),
      );
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
                            : context.screenWidth / 5.5,
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
                            selectCategory = 0;
                            // scrollTo(0);
                          },
                          //onpress

                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(
                                    color: state.selectedId == i
                                        ? Color(0xff636363)
                                        : const Color(0xffF6F6F6))),
                            backgroundColor: state.selectedId == i
                                ? const Color(0xFF02CCFE)
                                : const Color(0xFFF6F6F6),
                          ),
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

          foodCategories.sort(
            ((a, b) {
              return a.foodCatId!.toLowerCase().compareTo(
                    b.foodCatId!.toLowerCase(),
                  );
            }),
          );

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: foodCategories.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: 140,
                decoration: BoxDecoration(
                  color: selectCategory == index
                      ? const Color(0xFF02CCFE)
                      : const Color(0xFFF6F6F6),
                  borderRadius: selectCategory == index
                      ? BorderRadius.circular(12)
                      : BorderRadius.circular(4),
                ),
                child: TextButton(
                  onPressed: () {
                    selectCategory = index;
                    setState(() {});
                    scrollTo(index);
                  },
                  child: Text(
                    foodCategories[index].foodCatName ?? '',
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto_Light',
                      color: selectCategory == index
                          ? Colors.white
                          : Color(0xff4F4F4F),
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
      return BlocConsumer<OrderBloc, OrderState>(
        listener: (BuildContext context, OrderState state) {
          if (foodMenuscroll != listenerindex) {
            print(listenerindex);
          }
        },
        builder: (context, state) {
          final foodData = state.foodData.entries.where((e) {
            final foodCategory = FoodData.getFoodCategories().firstWhereOrNull(
              (foodCat) {
                return foodCat.foodCatId == e.key;
              },
            );

            if (foodCategory == null) {
              return false;
            }

            return true;
          }).toList();

          foodData.sort(
            ((a, b) {
              return a.key.toLowerCase().compareTo(b.key.toLowerCase());
            }),
          );
          int initialindex = 0;
          return ScrollablePositionedList.builder(
            itemScrollController: itemScrollController,
            itemCount: foodData.length,
            // key: GlobalKey,
            initialScrollIndex: initialindex,
            itemPositionsListener: itemPositionsListener,
            itemBuilder: (context, index) {
              final foodCategory =
                  FoodData.getFoodCategories().firstWhereOrNull(
                (e) {
                  return e.foodCatId == foodData[index].key;
                },
              );

              if (foodCategory == null) {
                return Container();
              }
              print(initialindex);
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
      body: Column(
        children: [
          SafeArea(child: headding()),
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Row(
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
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0, top: 14),
            child: Row(
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
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 6),
              child: Container(child: foodMenu()),
            ),
          )
        ],
      ),
    );
  }
}
