import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final ScrollController _controller = ScrollController();
  GlobalKey key = GlobalKey();
  void scrollToIndex(int index, int heightRow) {
    if (_controller.hasClients) {
      _controller.animateTo(
        index * 5 * 125, // Replace with your item height
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<OrderBloc>().add(
          const OrderUpdateEvent(foodSetId: 'Srd8o2evE8g='),
        );
  }

  @override
  void dispose() {
    // ignore: avoid_print
    print('Dispose used');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;
    //final isPortrait = screenHeight > screenWidth;
    final isLandscape = screenWidth > screenHeight;

    PreferredSizeWidget appBar() {
      return AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 32,
          ),
        ),
        actions: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: const Color.fromARGB(117, 233, 230, 230),
              borderRadius: BorderRadius.circular(8),
              //border: Border.all(color: Colors.black)),
            ),
            child: IconButton(
              onPressed: () {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (_) => Searchpage()));
              },
              icon: const Icon(
                Icons.search,
                size: 30,
              ),
            ),
          ),
        ],
      );
    }

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
                return SizedBox(
                  height: isLandscape
                      ? context.screenHeight / 16
                      : context.screenWidth / 12,
                  width: isLandscape
                      ? context.screenWidth / 7
                      : context.screenHeight / 6,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<OrderBloc>().add(
                              OrderUpdateEvent(foodSetId: e.foodSetId),
                            );
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.black26),
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
            ),
          ],
        ),
      );
    }

    Widget selectedFoodCategory() {
      return BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          final foodCategories = state.foodData.keys
              .map((e) {
                return FoodData.getFoodCategories().firstWhereOrNull((f) {
                  return f.foodCatId == e;
                });
              })
              .whereType<FoodCategory>()
              .toList();

          return Padding(
            padding: const EdgeInsets.all(14),
            child: Container(
              height: 50,
              child: ListView.builder(
                key: key,
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: foodCategories.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(4)),
                    child: TextButton(
                      onPressed: () {
                        scrollToIndex(index, foodCategories.length);
                        print('index $index:${foodCategories.length}');
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

    Widget foodMenu() {
      return BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          final foodData = state.foodData.entries.toList();

          return SliverList.builder(
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
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              return SliverAppBar(
                //shrikWrap
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
                floating: false,
                pinned: true,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(isLandscape ? 140 : 140),
                  child: Column(
                    children: [
                      selectedFoodSet(),
                      selectedFoodCategory(),
                    ],
                  ),
                ),
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
            },
          ),
          foodMenu(),
        ],
      ),
    );
  }
}
   // if (i == 0) {
              //   context.read<OrderBloc>().add(
              //         OrderUpdateEvent(foodSetId: e.foodSetId),
              //       );
              // }