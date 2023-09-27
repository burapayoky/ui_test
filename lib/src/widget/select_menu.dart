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
//Controller
  final ItemScrollController itemScrollController = ItemScrollController();
  final ScrollOffsetController scrollOffsetController =
      ScrollOffsetController();
  final ScrollController scrollController = ScrollController();
  final fieldText = TextEditingController();
  //
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  //
  int selectCategory = 0;
  int foodMenuscroll = 0;
  int listenerindex = 0;
  bool issearch = false;
//Fuction Scroll to index
  void scrollTo(int index) => itemScrollController.scrollTo(
        index: index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
//Fuction Jumpto Index
  void jumpTo(int index) => itemScrollController.jumpTo(index: index);
//UserScrolling Category
  listnerScrolling(Iterable<ItemPosition> positions) {
    int indexx = 0;

    List<int> cateIndex = [];

    for (ItemPosition position in positions) {
      int index = position.index;
      cateIndex.add(index);
      indexx = index;
    }
    cateIndex.sort();

    indexx = cateIndex.first;

    return indexx;

    //ตำเเหน่ง top last
  }

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

    Widget headding() {
      return Padding(
        padding: EdgeInsets.only(
            top: isLandscape ? 20 : screenHeight / 30, bottom: 18),
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
                              isLandscape ? screenWidth / 13 : screenWidth / 12,
                          height: isLandscape
                              ? screenHeight / 18
                              : screenWidth / 20,
                          decoration: BoxDecoration(
                              color: const Color(0xFFF6F6F6),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.keyboard_arrow_left,
                                size: screenWidth / 40,
                              ),
                              Expanded(
                                child: Text(
                                  'Back',
                                  style: TextStyle(
                                      fontSize: screenWidth / 60,
                                      fontFamily: 'Roboto_Light',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54),
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
                    ? Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Container(
                          height: isLandscape
                              ? screenWidth / 28
                              : screenHeight / 35,
                          width: screenWidth / 4.5,
                          decoration: BoxDecoration(
                            color: const Color(0xffF6F6F6),
                            borderRadius: BorderRadius.circular(8),

                            //border: Border.all(color: Colors.black)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Icon(
                                  Icons.search,
                                  size: isLandscape
                                      ? screenWidth / 60
                                      : screenWidth / 40,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: screenWidth / 350), //6.5
                                child: SizedBox(
                                  width: screenWidth / 6,
                                  child: TextField(
                                    controller: fieldText,
                                    onChanged: (value) {
                                      context.read<OrderBloc>().add(
                                            OrderSearchEvent(
                                              text: value,
                                            ),
                                          );
                                    },
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Search',
                                        hintStyle: TextStyle(
                                            fontFamily: "Roboto_Light")),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  onPressed: () {
                                    issearch = false;
                                    context
                                        .read<OrderBloc>()
                                        .add(OrderSearchEvent(text: ''));
                                    fieldText.clear();
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.close,
                                    size: screenWidth / 80,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: isLandscape
                              ? screenWidth / 35
                              : screenHeight / 22,
                          height: isLandscape
                              ? screenWidth / 35
                              : screenHeight / 30,
                          decoration: BoxDecoration(
                              color: const Color(0xFFF6F6F6),
                              borderRadius: BorderRadius.circular(6)),
                          child: IconButton(
                            icon: Icon(
                              Icons.search,
                              size: isLandscape
                                  ? screenWidth / 60
                                  : screenWidth / 40,
                            ),
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
                      child: IntrinsicWidth(
                        child: SizedBox(
                          // width: isLandscape
                          //     ? context.screenWidth / 8.2
                          //     : context.screenWidth / 5,
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<OrderBloc>().add(
                                  OrderFoodSetUpdateEvent(selectedItem: i));

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
                                  borderRadius: BorderRadius.circular(
                                      isLandscape
                                          ? screenWidth / 140
                                          : screenWidth / 70),
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
                                  fontFamily: 'Roboto_Light',
                                  color: state.selectedId == i
                                      ? Colors.white
                                      : Color(0xff4F4F4F)),
                            ),
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
              return IntrinsicWidth(
                child: Container(
                  // width: isLandscape
                  //     ? screenWidth / 9.5
                  //     : screenHeight / 7.5, //180
                  decoration: BoxDecoration(
                    color: selectCategory == index
                        ? const Color(0xFF02CCFE)
                        : const Color(0xFFF6F6F6),
                    borderRadius: selectCategory == index
                        ? BorderRadius.circular(8)
                        : BorderRadius.circular(4),
                  ),
                  child: TextButton(
                    onPressed: () {
                      selectCategory = index;
                      //print(selectCategory);
                      setState(() {});
                      scrollTo(index);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        foodCategories[index].foodCatName ?? '',
                        style: TextStyle(
                          fontSize:
                              isLandscape ? screenWidth / 80 : screenWidth / 50,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto_Light',
                          color: selectCategory == index
                              ? Colors.white
                              : Color(0xff4F4F4F),
                        ),
                      ),
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
        listener: (BuildContext context, OrderState state) {},
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
          return NotificationListener<ScrollNotification>(
            onNotification: (scrollinfo) {
              if (scrollinfo is ScrollUpdateNotification) {
                itemPositionsListener.itemPositions.addListener(() {
                  Iterable<ItemPosition> positions =
                      itemPositionsListener.itemPositions.value;
                  final ScrollMetrics metrics = scrollinfo.metrics;
                  int newIndex = listnerScrolling(positions);

                  if (metrics.atEdge) {
                    if (metrics.pixels == 0) {
                      newIndex = 0;
                    } else if (metrics.pixels == metrics.maxScrollExtent) {
                      // Scroll อยู่ที่ด้านล่างสุด
                      newIndex = foodData.length - 1;
                    }
                  }
                  if (newIndex != selectCategory) {
                    setState(() {
                      selectCategory = newIndex;
                    });
                  }
                });
              }

              return false;
            },
            child: ScrollablePositionedList.builder(
                itemScrollController: itemScrollController,
                itemCount: foodData.length,
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
                  initialindex = index;
                  return SliverListFoodOrder(
                    foodCategoryName: foodCategory.foodCatName ?? '',
                    foods: foodData[index].value,
                  );
                }),
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
                        ? context.screenWidth / 30
                        : screenWidth / 18, //context.screenHeight / 28,
                    child: selectedFoodSet(),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0, top: 10),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: IntrinsicWidth(
                      child: Container(
                        //width: double.infinity,
                        height: isLandscape
                            ? context.screenWidth / 30
                            : context.screenWidth / 18,
                        child: selectedFoodCategory(),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 28.0, right: screenWidth / 75),
              child: Container(child: foodMenu()),
            ),
          )
        ],
      ),
    );
  }
}
