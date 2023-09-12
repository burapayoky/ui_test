import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:ui_test/src/fristpage.dart';

import 'package:ui_test/src/models/Thaifood.dart';
import 'package:ui_test/src/models/foodmodel.dart';
import 'package:ui_test/src/order/orderwidget/bottom_catfood.dart';
import 'package:ui_test/src/order/orderwidget/sliverlist_foodorder.dart';
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
      } else if (v.foodCatId == 'SwvX07JTXHU=' //v.foodSetId == 'Srd8o2evE8g='
          ) {
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
    isScreenwidht() {
      if (context.widthsize > context.heightsize) {
        return true;
      } else {
        return false;
      }
    }

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
                preferredSize: isScreenwidht()
                    ? Size.fromHeight(100)
                    : Size.fromHeight(80), //bottom sliver appbar
                child: Column(
                  //menu
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          ButtonSetFood(
                            name_: 'Thaifood',
                            height_: isScreenwidht()
                                ? context.widthsize / 10
                                : context.widthsize / 6,
                            width_: isScreenwidht()
                                ? context.widthsize / 28
                                : context.widthsize / 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ButtonSetFood(
                            name_: 'Japanese Menu',
                            height_: isScreenwidht()
                                ? context.widthsize / 10
                                : context.widthsize / 6,
                            width_: isScreenwidht()
                                ? context.widthsize / 28
                                : context.widthsize / 20,
                          ),
                        ],
                      ),
                    ),
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        height: 80,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          child: Row(
                            children: [
                              ButtonCatFood(
                                name_: 'Appetizers',
                                height_: 120,
                                width_: 100,
                              ),
                              ButtonCatFood(
                                name_: 'Soup',
                                height_: 120,
                                width_: 100,
                              ),
                              ButtonCatFood(
                                name_: 'Salad',
                                height_: 120,
                                width_: 100,
                              ),
                              ButtonCatFood(
                                name_: 'Noodles',
                                height_: 120,
                                width_: 100,
                              ),
                              ButtonCatFood(
                                name_: 'Entrees',
                                height_: 120,
                                width_: 100,
                              ),
                              ButtonCatFood(
                                name_: 'Rice Dishes',
                                height_: 120,
                                width_: 100,
                              ),
                              ButtonCatFood(
                                name_: 'Side Orders',
                                height_: 120,
                                width_: 100,
                              ),
                              ButtonCatFood(
                                name_: 'Drinks',
                                height_: 120,
                                width_: 100,
                              ),
                            ],
                          ),
                        ),
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
  // isScreenWidth() {
  //   MediaQuery.of()
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, actions: const [
        ActionsFlagIcon(),
      ]),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            child: Row(
              children: [
                const Text(
                  'My Order',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 34,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: FaIcon(
                    FontAwesomeIcons.edit,
                    size: context.widthsize / 80,
                  ),
                )
              ],
            ),
          ),
          const Divider(),
          const Center(
            child: Text(
              'No order selected',
              style: TextStyle(
                  fontSize: 24,
                  color: Color.fromARGB(79, 79, 79, 74),
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400),
            ),
          ),
          const Spacer(
            flex: 5,
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