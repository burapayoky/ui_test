import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:ui_test/src/fristpage.dart';

import 'package:ui_test/src/models/Thaifood.dart';
import 'package:ui_test/src/models/foodmodel.dart';
import 'dart:convert';

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

  mapdata() {}

  Future<void> loadJsonAsset() async {
    final String jsonString =
        await rootBundle.loadString('assets/json/data_test.json');
    //final List<dynamic> data = jsonDecode(jsonString);

    // print(data);
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                ButtonCatFood(
                  name_: 'Thaifood',
                  height_: 120,
                  width_: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                ButtonCatFood(
                  name_: 'Japanese Menu',
                  height_: 120,
                  width_: 40,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // const Row(
          //   // scrollDirection: Axis.vertical,
          //   // shrinkWrap: true,
          //   children: [
          //     ButtonCatFood(
          //       name_: 'Appetizers',
          //       height_: 30,
          //       width_: 30,
          //     ),
          //     ButtonCatFood(
          //       name_: 'Soup',
          //       height_: 10,
          //       width_: 20,
          //     ),
          //     ButtonCatFood(
          //       name_: 'Salads',
          //       height_: 10,
          //       width_: 20,
          //     ),
          //     ButtonCatFood(
          //       name_: 'Noodles',
          //       height_: 10,
          //       width_: 20,
          //     ),
          //     ButtonCatFood(
          //       name_: 'Entrees',
          //       height_: 10,
          //       width_: 20,
          //     ),
          //     ButtonCatFood(
          //       name_: 'Rice Dishes',
          //       height_: 10,
          //       width_: 20,
          //     ),
          //     ButtonCatFood(
          //       name_: 'Side Orders',
          //       height_: 10,
          //       width_: 20,
          //     ),
          //     ButtonCatFood(
          //       name_: 'Drinks',
          //       height_: 10,
          //       width_: 20,
          //     ),
          //   ],
          // ),

          ListView(
            shrinkWrap: true,
            children: [
              //show menu
              Column(
                  children: List.generate(
                5,
                (index) {
                  return Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                    margin: const EdgeInsets.all(10),
                    child: Text(ListFoodata.food[0]["foodName"].toString()),
                  );
                },
              )),
            ],
          ),
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
          style: TextStyle(color: Colors.white),
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
      appBar: AppBar(automaticallyImplyLeading: false, actions: [
        Padding(
          padding: const EdgeInsets.only(top: 2, right: 8),
          child: Container(
            height: context.heightsize / 10,
            width: context.widthsize / 10,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/images/bg/unitedflag.png'),
                    fit: BoxFit.fitWidth)),
            child: PopupMenuButton(
                iconSize: 0,
                offset: Offset(0, 45),
                itemBuilder: (BuildContext context) {
                  return const [
                    PopupMenuItem(value: 1, child: Text('English')),
                    PopupMenuItem(value: 2, child: Text('Setting')),
                    PopupMenuItem(value: 3, child: Text('Store Manager')),
                    PopupMenuItem(
                        value: 4,
                        child: Row(
                          children: [Icon(Icons.exit_to_app), Text('Exit')],
                        )),
                  ];
                }),
          ),
        ),
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

// product: ShirtPoPData.shirtPoPProducts
//               .map((e) => ProductDataModel(
//                   id: e['id'],
//                   name: e['name'], //e['']
//                   description: e['description'],
//                   price: e['price'],
//                   imageUrl: e['imageUrl']))
//               .toList()));
// Scaffold(
//         appBar: AppBar(
//           actions: [
//             IconButton(onPressed: () {}, icon: const Icon(Icons.search))
//           ],
//         ),
//         body: Row(
//           children: [
//             Expanded(
//               child: Container(),
//             ),
//             VerticalDivider(),
//             Flexible(
//               flex: 1,
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       const Text(
//                         'My Order',
//                         style: TextStyle(fontWeight: FontWeight.w500),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 5),
//                         child: FaIcon(
//                           FontAwesomeIcons.edit,
//                           size: context.widthsize / 40,
//                         ),
//                       )
//                     ],
//                   ),
//                   Divider(),
//                   Text(''),
//                 ],
//               ),
//             )
//           ],
//         ));
