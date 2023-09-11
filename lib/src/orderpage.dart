import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:ui_test/src/fristpage.dart';

import 'package:ui_test/src/models/Thaifood.dart';
import 'package:ui_test/src/models/foodmodel.dart';
import 'package:ui_test/src/widget/orderwidget/bottom_catfood.dart';
import 'package:ui_test/src/widget/orderwidget/sliverlist_foodorder.dart';
import 'widget/appbar/action_flag_icon.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final myfood = ListFoodata.food.map((e) => Foodmodel.fromMap(e)).toList();
  final List<Foodmodel> Starter = [];
  final List<Foodmodel> Appetizer = [];
  final List<Foodmodel> SoupandSalad = [];
  final List<Foodmodel> Salads = [];
  final List<Foodmodel> Nodles = [];
  final List<Foodmodel> Entrees = [];
  final List<Foodmodel> Side = [];
  final List<Foodmodel> Drinks = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loopfood();
  }

  loopfood() {
    for (var v in myfood) {
      if (v.foodCatId == '9YIvS9YpFPQ=') {
        Starter.add(v);
      } else if ( //v.foodCatId == 'bSIlZtUVb+U=' &&
          v.foodSetId == 'Srd8o2evE8g=') {
        SoupandSalad.add(v);
      } else if (v.foodCatId == 'TUYmgy/w29M=') {
        Appetizer.add(v);
      } else if (v.foodCatId == 'kHAhIe2AFPI=') {
        Salads.add(v);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            flex: 3,
            child: SelectedMenu(
              Drinks: Drinks,
              SoupandSalad: SoupandSalad,
              Appetizer: Appetizer,
              Nodles: Nodles,
              Salads: Salads,
              Entrees: Entrees,
              Starter: Starter,
              Side: Side,
            )),
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
  final List<Foodmodel> Starter;
  final List<Foodmodel> Appetizer;
  final List<Foodmodel> SoupandSalad;
  final List<Foodmodel> Salads;
  final List<Foodmodel> Nodles;
  final List<Foodmodel> Entrees;
  final List<Foodmodel> Side;
  final List<Foodmodel> Drinks;

  const SelectedMenu(
      {super.key,
      required this.Starter,
      required this.Appetizer,
      required this.SoupandSalad,
      required this.Salads,
      required this.Nodles,
      required this.Entrees,
      required this.Side,
      required this.Drinks});

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
              ))
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            automaticallyImplyLeading: false,
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(60), //bottom sliver appbar
                child: Column(
                  //menu
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Row(
                        children: [
                          ButtonCatFood(
                            name_: 'Thaifood',
                            height_: context.widthsize / 10,
                            width_: context.widthsize / 40,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ButtonCatFood(
                            name_: 'Japanese Menu',
                            height_: context.widthsize / 10,
                            width_: context.widthsize / 40,
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      child: Row(
                        children: [
                          ButtonCatFood(
                            name_: 'Appetizers',
                            height_: 100,
                            width_: 30,
                          ),
                          ButtonCatFood(
                            name_: 'Soup',
                            height_: 100,
                            width_: 30,
                          ),
                          ButtonCatFood(
                            name_: 'Salads',
                            height_: 100,
                            width_: 30,
                          ),
                          ButtonCatFood(
                            name_: 'Noodles',
                            height_: 100,
                            width_: 30,
                          ),
                          ButtonCatFood(
                            name_: 'Entrees',
                            height_: 100,
                            width_: 30,
                          ),
                          ButtonCatFood(
                            name_: 'Rice Dishes',
                            height_: 100,
                            width_: 30,
                          ),
                          ButtonCatFood(
                            name_: 'Side Orders',
                            height_: 100,
                            width_: 30,
                          ),
                          ButtonCatFood(
                            name_: 'Drinks',
                            height_: 100,
                            width_: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          SliverListFoodOrder(
              foodListitem: Appetizer, foodcatname: 'Appetizer'),
          SliverListFoodOrder(
            foodListitem: SoupandSalad,
            foodcatname: 'Soup',
          ),
        ],
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
                  color: const Color.fromARGB(221, 110, 109, 109),
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Divider(),
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
            // flexibleSpace: FlexibleSpaceBar(
            //   background:
            // )