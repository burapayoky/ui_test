import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_test/extensions/build_context.dart';
import 'package:ui_test/src/data/food_data.dart';
import 'package:ui_test/src/models/food_category_model.dart';
import 'package:ui_test/src/order/bloc/order_bloc.dart';
import 'package:ui_test/src/widget/order/sliverlist_foodorder.dart';

class SelectedMenu extends StatelessWidget {
  const SelectedMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;
    //final isPortrait = screenHeight > screenWidth;
    final isLandscape = screenWidth > screenHeight;

    context.read<OrderBloc>().add(
          const OrderUpdateEvent(foodSetId: 'j8CZNxgCebY='),
        );

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
      return Row(
        children: [
          ...FoodData.getFoodSet().mapIndexed(
            (i, e) {
              // if (i == 0) {
              //   context.read<OrderBloc>().add(
              //         OrderUpdateEvent(foodSetId: e.foodSetId),
              //       );
              // }

              return SizedBox(
                height: isLandscape
                    ? context.screenHeight / 14
                    : context.screenWidth / 12,
                width: isLandscape
                    ? context.screenHeight / 4
                    : context.screenHeight / 8,
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
                    ),
                    child: Text(
                      e.foodSetName ?? '',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
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
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: foodCategories.length,
                itemBuilder: (BuildContext context, int index) {
                  return TextButton(
                    onPressed: () {},
                    child: Text(
                      foodCategories[index].foodCatName ?? '',
                      style: const TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
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
        slivers: [
          BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              return SliverAppBar(
                leading: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Row(
                    children: [
                      Icon(Icons.keyboard_arrow_left),
                      Text(
                        'Black',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ),
                floating: false,
                pinned: true,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(isLandscape ? 140 : 120),
                  child: Column(
                    children: [
                      selectedFoodSet(),
                      selectedFoodCategory(),
                    ],
                  ),
                ),
              );
            },
          ),
          foodMenu(),
        ],
      ),
    );
  }
}