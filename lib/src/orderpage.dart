import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:ui_test/src/fristpage.dart';

import 'package:ui_test/src/models/Thaifood.dart';
import 'package:ui_test/src/models/foodmodel.dart';

import 'package:ui_test/src/order/orderwidget/sliverlist_foodorder.dart';
import 'widget/appbar/action_flag_icon.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class Thaifooddata {}

class _OrderPageState extends State<OrderPage> {
  final myfood = ListFoodata.food.map((e) => Foodmodel.fromMap(e)).toList();
  final SetFoodModel = [[], [], [], [], [], []];
  // final foodthai = ListFoodata.where

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loopfood();
    loadThaifoodset();
  }

  loadJapanesefoodset() {
    //loop foodSetId
    var filterfood = myfood.where((e) => e.foodSetId == 'Srd8o2evE8g=');
    final filterAppetizers =
        filterfood.where((e) => e.foodCatId == 'jePeFNAwuEY=');
    final filterSoupSalads =
        filterfood.where((e) => e.foodCatId == 'vMCylG10cHU=');
    final filterEntrees =
        filterfood.where((e) => e.foodCatId == 'nH/9Nj9g9gI=');
    final filterKidmu = filterfood.where((e) => e.foodCatId == 'CzhVi+Firzc=');
    final filterSideOrder =
        filterfood.where((e) => e.foodCatId == 'ghtx2D66zFg=');
    final filterLunchSpecial =
        filterfood.where((e) => e.foodCatId == 'iS94mlBDp70=');
    //appetizer

    SetFoodModel[0].add(filterAppetizers);
    SetFoodModel[1].add(filterSoupSalads);
    SetFoodModel[2].add(filterEntrees);
    SetFoodModel[3].add(filterKidmu);
    SetFoodModel[4].add(filterSideOrder);
    SetFoodModel[5].add(filterLunchSpecial);
  }

  loadThaifoodset() {
    final myfood = ListFoodata.food.map((e) => Foodmodel.fromMap(e)).toList();

    var filterfood = myfood.where((e) => e.foodSetId == 'Srd8o2evE8g=');
    final filterAppetizers =
        filterfood.where((e) => e.foodCatId == 'jePeFNAwuEY=');
    final filterSoupSalads =
        filterfood.where((e) => e.foodCatId == 'vMCylG10cHU=');
    final filterEntrees =
        filterfood.where((e) => e.foodCatId == 'nH/9Nj9g9gI=');
    final filterKidmu = filterfood.where((e) => e.foodCatId == 'CzhVi+Firzc=');
    final filterSideOrder =
        filterfood.where((e) => e.foodCatId == 'ghtx2D66zFg=');
    final filterLunchSpecial =
        filterfood.where((e) => e.foodCatId == 'iS94mlBDp70=');
    //appetizer
    SetFoodModel[0].add(filterAppetizers);
    SetFoodModel[1].add(filterSoupSalads);
    SetFoodModel[2].add(filterEntrees);
    SetFoodModel[3].add(filterKidmu);
    SetFoodModel[4].add(filterSideOrder);
    SetFoodModel[5].add(filterLunchSpecial);
  }

  loopfood() {
    for (var v in myfood) {
      if (v.foodCatId == '9YIvS9YpFPQ=') {
        Foodgetdata.Starter.add(v);
      } else if (v.foodCatId == 'SwvX07JTXHU=') {
        Foodgetdata.Soup.add(v);
        //v.foodSetId == 'Srd8o2evE8g='
      } else if (v.foodCatId == 'TUYmgy/w29M=') {
        Foodgetdata.Appetizer.add(v);
      } else if (v.foodCatId == 'kHAhIe2AFPI=') {
        Foodgetdata.Salads.add(v);
      } else if (v.foodSetId == 'EWbC6SALR+c=') {
        Foodgetdata.Noodles.add(v);
      } else if (v.foodCatId == 'Jh/MlHU3zlY=') {
        Foodgetdata.Entrees.add(v);
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
              Drinks: Foodgetdata.Drinks,
              Soup: Foodgetdata.Soup,
              Appetizer: Foodgetdata.Appetizer,
              Noodles: Foodgetdata.Noodles,
              Salads: Foodgetdata.Salads,
              Entrees: Foodgetdata.Entrees,
              Starter: Foodgetdata.Starter,
              Side: Foodgetdata.Side,
              SetFoodModel: SetFoodModel,
            )),
        const VerticalDivider(
          width: 1,
          thickness: 20,
          color: Colors.white54,
        ),
        const Flexible(flex: 1, child: CheckBin())
      ],
    );
  }
}

class SelectedMenu extends StatefulWidget {
  final List<List<dynamic>> SetFoodModel;
  final List<Foodmodel> Starter;
  final List<Foodmodel> Appetizer;
  final List<Foodmodel> Soup;
  final List<Foodmodel> Salads;
  final List<Foodmodel> Noodles;
  final List<Foodmodel> Entrees;
  final List<Foodmodel> Side;
  final List<Foodmodel> Drinks;

  const SelectedMenu({
    super.key,
    required this.Starter,
    required this.Appetizer,
    required this.Soup,
    required this.Salads,
    required this.Noodles,
    required this.Entrees,
    required this.Side,
    required this.Drinks,
    required this.SetFoodModel,
  });

  @override
  State<SelectedMenu> createState() => _SelectedMenuState();
}

class _SelectedMenuState extends State<SelectedMenu> {
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
                    ? Size.fromHeight(60)
                    : Size.fromHeight(80), //bottom sliver appbar
                child: Column(
                  //menu Set
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: Text('Thaifood'),
                            ),
                          ),
                          // child: ListView.builder(
                          //   scrollDirection: Axis.horizontal,
                          //   padding: EdgeInsets.all(10),
                          //   itemCount: ListFoodata.foodSet.length,
                          //   itemBuilder: (BuildContext context, int index) {
                          //     return
                          //   },
                          //   //ListFoodata.foodSet[index]['foodSetName']
                          // ),
                        ),
                        SizedBox(
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  print('object');
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: Text('Japanesefood'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: Text('FreeItem'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: 8,
                        itemBuilder: (BuildContext context, int index) {
                          return TextButton(
                              onPressed: () {},
                              child: Text(ListFoodata.foodCategory[index]
                                  ['foodCatName']));
                        },
                      ),
                    )
                  ],
                )),
          ),
          // SliverList.builder(itemBuilder: (context, index) {

          // }),
          SliverListFoodOrder(
              foodListitem: widget.Appetizer, foodcatname: 'Appetizer'),
          SliverListFoodOrder(
            foodListitem: widget.Soup,
            foodcatname: 'Soup',
          ),
          SliverListFoodOrder(
            foodListitem: widget.Salads,
            foodcatname: 'Salad',
          ),
          SliverListFoodOrder(
            foodListitem: widget.Noodles,
            foodcatname: 'Noodles',
          ),
          SliverListFoodOrder(
            foodListitem: widget.Entrees,
            foodcatname: 'Entrees',
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

