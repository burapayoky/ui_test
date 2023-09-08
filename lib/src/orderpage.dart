import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_test/src/fristpage.dart';

import 'package:ui_test/src/models/Thaifood.dart';
import 'package:ui_test/src/models/foodmodel.dart';
import 'widget/appbar/action_flag_icon.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadJsonAsset();
  }

  loadJsonAsset() {
    final myfood = ListFoodata.food.map((e) => Foodmodel.fromMap(e)).toList();
    final foodcat =
        ListFoodata.foodCategory.map((e) => Foodmodel.fromMap(e)).toList();
    final foodset =
        ListFoodata.foodSet.map((e) => Foodmodel.fromMap(e)).toList();

    //print(myfood[100].foodName);
  }

  Textnullcheck(String value_) {
    if (value_ == null) {
      return value_ = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Flexible(flex: 3, child: SelectedMenu()),
        VerticalDivider(
          width: 1,
          thickness: 20,
          color: Colors.white54,
        ),
        Flexible(flex: 1, child: CheckBin())
      ],
    );
  }
}

class SelectedMenu extends StatelessWidget {
  const SelectedMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.keyboard_arrow_left,
              size: 32,
            )),
        actions: [
          Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Color.fromARGB(117, 233, 230, 230),
                borderRadius: BorderRadius.circular(8),

                //border: Border.all(color: Colors.black)),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 30,
                ),
              ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                ButtonCatFood(
                  name_: 'Thaifood',
                  height_: context.widthsize / 10,
                  width_: context.widthsize / 28,
                ),
                const SizedBox(
                  width: 10,
                ),
                ButtonCatFood(
                  name_: 'Japanese Menu',
                  height_: context.widthsize / 10,
                  width_: context.widthsize / 28,
                ),
              ],
            ),
          ),
          Expanded(
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 8,
              runSpacing: 4,
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'APPETIZERS',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 400,
                //   child: Padding(
                //     padding: const EdgeInsets.all(2),
                //     child: GridView.builder(
                //         gridDelegate:
                //             const SliverGridDelegateWithFixedCrossAxisCount(
                //                 crossAxisCount: 6),
                //         shrinkWrap: true,
                //         itemCount: 8,
                //         itemBuilder: (context, indextto) {
                //           if (ListFoodata.food[indextto]['foodCatId'] ==
                //               'TUYmgy/w29M=') {
                //             return Padding(
                //               padding: const EdgeInsets.all(2.0),
                //               child: Container(
                //                 width: context.widthsize / 2,
                //                 decoration: BoxDecoration(
                //                     color: Colors.white,
                //                     borderRadius: BorderRadius.circular(6),
                //                     border: Border.all(
                //                       color: Colors.black,
                //                     )),
                //                 child: Column(children: [
                //                   Container(
                //                     height: context.widthsize / 16,
                //                     decoration: BoxDecoration(
                //                         color: Colors.red,
                //                         image: DecorationImage(
                //                             image: NetworkImage(ListFoodata
                //                                 .food[indextto]['imageName']),
                //                             fit: BoxFit.fill)),
                //                   ),
                //                   Column(
                //                     children: [
                //                       Align(
                //                         alignment: Alignment.topLeft,
                //                         child: Text(
                //                           ListFoodata.food[indextto]
                //                               ['foodName'],
                //                           style: TextStyle(fontSize: 12),
                //                         ),
                //                       ),
                //                       Text(
                //                         (ListFoodata.food[indextto]
                //                                     ['fooddesc'] ==
                //                                 null)
                //                             ? ''
                //                             : ListFoodata.food[indextto]
                //                                 ['fooddesc'],
                //                         style: TextStyle(fontSize: 2),
                //                       ),
                //                       Align(
                //                         alignment: Alignment.bottomLeft,
                //                         child: Padding(
                //                           padding: const EdgeInsets.all(8.0),
                //                           child: Text(
                //                             '\$${ListFoodata.food[indextto]['foodPrice']}',
                //                             style: const TextStyle(
                //                                 fontSize: 16,
                //                                 fontFamily: AutofillHints
                //                                     .streetAddressLine1),
                //                           ),
                //                         ),
                //                       ),
                //                     ],
                //                   )
                //                 ]),
                //               ),
                //             );
                //           }
                //         }),
                //   ),
                // ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Soups',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45),
                    ),
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 7),
                      shrinkWrap: true,
                      itemCount: 100,
                      itemBuilder: ((context, index) {
                        if (ListFoodata.food[index]['foodCatId'] ==
                            "la+hd3+WLj4=") {
                          return Text('${ListFoodata.food[index]['foodName']}');
                          // return Padding(
                          //   padding: const EdgeInsets.all(2.0),
                          //   child: Column(children: [
                          //     Container(
                          //       width: double.infinity,
                          //       height: 50,
                          //       decoration: BoxDecoration(
                          //         color: Colors.red,
                          //       ),
                          //     ),
                          //     Expanded(
                          //       child: Text(
                          //         ListFoodata.food[index]['foodName'],
                          //         style: TextStyle(fontSize: 10),
                          //       ),
                          //     )
                          //   ]),
                          // );
                        }
                      })),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ButtonCatFood extends StatelessWidget {
  final String name_;
  final double width_;
  final double height_;
  const ButtonCatFood({
    super.key,
    required this.name_,
    required this.width_,
    required this.height_,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: height_, //120
        height: width_, //40
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.black, width: 0.5),
            color: Colors.blue),
        child: Center(
            child: Text(
          name_, //'ThaiMenu'
          style:
              TextStyle(color: Colors.white, fontSize: context.widthsize / 90),
        )),
      ),
    );
  }
}

// ขวามือ
class CheckBin extends StatelessWidget {
  const CheckBin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, actions: const [
        ActionsFlagIcon(),
      ]),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Row(
              children: [
                Text(
                  'My Order',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: context.widthsize / 38),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: FaIcon(
                    FontAwesomeIcons.edit,
                    size: context.widthsize / 40,
                  ),
                )
              ],
            ),
          ),
          const Divider(),
          Center(
            child: Text(
              'No order selected',
              style: TextStyle(
                  fontSize: context.widthsize / 50,
                  color: Color.fromARGB(221, 110, 109, 109),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Divider(),
                Padding(
                  padding: EdgeInsets.all(context.widthsize / 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: context.heightsize / 60),
                      ),
                      const Text(
                        'xxx',
                        style: TextStyle(color: Colors.purple),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: context.widthsize / 24,
                  width: context.widthsize / 5,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          )),
                          backgroundColor: const MaterialStatePropertyAll(
                              Color.fromARGB(136, 187, 186, 186))),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 2),
                            child: Icon(Icons.shopping_cart,
                                size: context.widthsize / 80,
                                color: Colors.white),
                          ),
                          Text(
                            'confirm Order (0)',
                            style: TextStyle(
                                fontSize: context.widthsize / 90,
                                color: Colors.white),
                            overflow: TextOverflow.fade,
                          )
                        ],
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
