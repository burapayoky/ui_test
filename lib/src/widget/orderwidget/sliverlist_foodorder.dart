import 'package:flutter/material.dart';
import 'package:ui_test/src/fristpage.dart';
import 'package:ui_test/src/models/foodmodel.dart';

class SliverListFoodOrder extends StatelessWidget {
  final List<Foodmodel> foodListitem;
  final String foodcatname;
  const SliverListFoodOrder({
    super.key,
    required this.foodListitem,
    required this.foodcatname,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          //final foodItem = ListFoodata.food[index];
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    foodcatname,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
                  ),
                ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.25),
                  shrinkWrap: true,
                  itemCount: foodListitem.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        width: context.widthsize / 2,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              color: Colors.black,
                            )),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                height: context.widthsize / 9,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    image: DecorationImage(
                                        alignment: Alignment(0, 0),
                                        image: NetworkImage(
                                            foodListitem[index].imageName!),
                                        fit: BoxFit.fill)),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 14, top: 8),
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        foodListitem[index].foodName!,
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    (foodListitem[index].foodDesc == null)
                                        ? ''
                                        : foodListitem[index].foodDesc!,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '\$${foodListitem[index].foodPrice}',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: AutofillHints
                                                .streetAddressLine1),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ]),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
        childCount: 1, // Set the number of sections you have
      ),
    );
  }
}
