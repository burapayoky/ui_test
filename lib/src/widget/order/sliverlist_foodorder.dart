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
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Align(
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
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isLandscape ? 4 : 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 12,
              childAspectRatio: isLandscape ? 1 : 1.25,
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
                            ? context.screenWidth / 12
                            : context.screenWidth / 11,
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
                            padding: const EdgeInsets.only(left: 14, top: 8),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                foods[index].foodName!,
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          Text(
                            (foods[index].foodDesc == null)
                                ? ''
                                : foods[index].foodDesc!,
                            style: const TextStyle(
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '\$ ${foods[index].foodPrice}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: AutofillHints.streetAddressLine1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
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
