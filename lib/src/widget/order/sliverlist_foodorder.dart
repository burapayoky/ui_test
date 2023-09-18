import 'package:flutter/material.dart';
import 'package:ui_test/extensions/build_context.dart';
import 'package:ui_test/src/models/food_model.dart';

class SliverListFoodOrder extends StatelessWidget {
  final String foodCategoryName;
  final List<FoodModel> foods;

  const SliverListFoodOrder({
    super.key,
    required this.foodCategoryName,
    required this.foods,
  });

  @override
  Widget build(BuildContext context) {
    final isLandscape = context.screenWidth > context.screenHeight;

    return Padding(
      padding: const EdgeInsets.only(right: 22.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                foodCategoryName,
                style: const TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isLandscape ? 4 : 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 12,
              childAspectRatio: isLandscape
                  ? context.screenWidth / 1600
                  : context.screenHeight / 1500,
            ),
            shrinkWrap: true,
            itemCount: foods.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  //width: context.widthsize / 2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: isLandscape
                            ? context.screenWidth / 15
                            : context.screenWidth / 7,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          image: DecorationImage(
                            alignment: const Alignment(0, 0),
                            image: NetworkImage(foods[index].imageName!),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8, top: 8),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                width: 300,
                                child: Text(
                                  foods[index].foodName!,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      overflow: TextOverflow.ellipsis,
                                      fontFamily: 'Roboto'),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: isLandscape ? 290 : 240,
                                child: Text(
                                  (foods[index].foodDesc == null)
                                      ? ''
                                      : foods[index].foodDesc!,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Roboto',
                                      color: Colors.black54),
                                  maxLines: isLandscape ? 2 : 3,
                                  overflow: TextOverflow.ellipsis,
                                  // isLandscape
                                  //     ? TextOverflow.ellipsis
                                  //     : null,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '\$ ${foods[index].foodPrice}',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
