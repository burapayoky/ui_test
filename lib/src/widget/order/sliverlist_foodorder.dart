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
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;
    final isPortrait = screenHeight > screenWidth;
    //screenheiht:1920.0,screenWidth:1080.0
    // print(
    //     'screenheiht:${context.screenHeight},screenWidth:${context.screenWidth}');
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, top: 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              foodCategoryName,
              style: TextStyle(
                fontSize: isLandscape ? screenWidth / 45 : screenWidth / 20,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
        ),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isLandscape ? 4 : 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 14,
              childAspectRatio: isLandscape ? 0.92 : 0.85 //0.7.5 : 0.8
              ),
          physics: const BouncingScrollPhysics(parent: ScrollPhysics()),
          shrinkWrap: true,
          itemCount: foods.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: Colors.black12,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2,
                    offset: Offset(1, 6), // Shadow position
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                    flex: isLandscape ? 2 : 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        //border: Border.all(color: Colors.red),
                        image: DecorationImage(
                          alignment: const Alignment(0, 0),
                          image: NetworkImage(foods[index].imageName!),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Flexible(
                          flex: isLandscape && screenWidth < 555 ||
                                  isPortrait && screenWidth < 342
                              ? 1
                              : 0, //,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 14, top: 14),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                // width: 500,
                                child: Text(
                                  foods[index].foodName!,
                                  style: TextStyle(
                                      fontSize: isLandscape
                                          ? screenWidth / 100
                                          : screenHeight / 80,
                                      overflow: TextOverflow.ellipsis,
                                      fontFamily: 'Roboto_Light'),
                                  maxLines: (isLandscape &&
                                              context.screenWidth < 999) ||
                                          isPortrait && screenWidth < 800
                                      ? 1
                                      : 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 14,
                                right: 8,
                              ),
                              child: SizedBox(
                                // width: isLandscape ? 400 : 300,
                                child: Text(
                                  (foods[index].foodDesc == null)
                                      ? ''
                                      : foods[index].foodDesc!,
                                  style: TextStyle(
                                      fontSize: isLandscape
                                          ? screenWidth / 130
                                          : screenHeight / 100,
                                      fontFamily: 'Roboto_Light',
                                      color: Colors.black54),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: isLandscape && screenWidth < 555 ||
                            isPortrait && screenWidth < 400
                        ? 1
                        : 0,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, bottom: 12),
                        child: Text(
                          '\$ ${foods[index].foodPrice}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Roboto_Light',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
//flutter gem