import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
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
  List<Map<String, dynamic>> starter = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loopfood();
  }

  loopfood() {
    for (var v in ListFoodata.food) {
      if (v['foodCatId'] == '9YIvS9YpFPQ=') {
        starter.add(v);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
  final List<Map<String, dynamic>> Starter = [];
  final List<Map<String, dynamic>> Appetizer = [];
  final List<Map<String, dynamic>> SoupandSalad = [];
  final List<Map<String, dynamic>> Salads = [];
  final List<Map<String, dynamic>> Nodles = [];
  final List<Map<String, dynamic>> Entrees = [];
  final List<Map<String, dynamic>> Side = [];
  final List<Map<String, dynamic>> Drinks = [];
  loadting() {
    for (var v in ListFoodata.food) {
      if (v['foodCatId'] == '9YIvS9YpFPQ=') {
        Starter.add(v);
      } else if (v['foodCatId'] == 'vMCylG10cHU=') {
        SoupandSalad.add(v);
      } else if (v['foodCatId'] == 'TUYmgy/w29M=' ||
          v['foodCatId'] == 'TUYmgy/w29M=') {
        Appetizer.add(v);
      } else if (v['foodCatId'] == 'kHAhIe2AFPI=') {
        Salads.add(v);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    loadting();
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
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => Searchpage()));
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
                preferredSize: Size.fromHeight(80), //bottom sliver appbar
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
            // flexibleSpace: FlexibleSpaceBar(
            //   background:
            // )
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final foodItem = ListFoodata.food[index];
                //print(Starter);
                return Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'APPETIZERS',
                          style: TextStyle(
                            fontSize: 36,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 12,
                                childAspectRatio: 1.5),
                        shrinkWrap: true,
                        itemCount: Starter.length,
                        itemBuilder: (context, index) {
                          final foodItem = ListFoodata.food[index];
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
                              child: Column(children: [
                                // Container(
                                //   height: context.widthsize / 8,
                                //   decoration: BoxDecoration(
                                //       color: Colors.red,
                                //       image: DecorationImage(
                                //           alignment: Alignment(0, 0),
                                //           image: NetworkImage(
                                //               starter[index]['imageName']),
                                //           fit: BoxFit.fitWidth)),
                                // ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 14, top: 8),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          Starter[index]['foodName'],
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      (Starter[index]['fooddesc'] == null)
                                          ? ''
                                          : Starter[index]['fooddesc'],
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '\$${Starter[index]['foodPrice']}',
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
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final foodItem = ListFoodata.food[index];
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Soup',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                          ),
                        ),
                      ),
                      GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 12,
                                childAspectRatio: 1.5),
                        shrinkWrap: true,
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          final foodItem = ListFoodata.food[index];
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
                              child: Column(children: [
                                // Container(
                                //   height: context.widthsize / 8,
                                //   decoration: BoxDecoration(
                                //       color: Colors.red,
                                //       image: DecorationImage(
                                //           alignment: Alignment(0, 0),
                                //           image: NetworkImage(ListFoodata
                                //               .food[index]['imageName']),
                                //           fit: BoxFit.fitWidth)),
                                // ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 14, top: 8),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          ListFoodata.food[index]['foodName'],
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      (ListFoodata.food[index]['fooddesc'] ==
                                              null)
                                          ? ''
                                          : ListFoodata.food[index]['fooddesc'],
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          '\$${ListFoodata.food[index]['foodPrice']}',
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
          ),
        ],
      ),
    );
  }
}

class Searchpage extends StatelessWidget {
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // The search area here
          title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    /* Clear the search field */
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none),
          ),
        ),
      )),
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
