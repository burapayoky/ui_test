import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:ui_test/src/fristpage.dart';

import 'package:ui_test/src/models/Thaifood.dart';
import 'package:ui_test/src/models/foodmodel.dart';
import 'package:ui_test/src/order/bloc/order_bloc.dart';

import 'package:ui_test/src/order/orderwidget/sliverlist_foodorder.dart';
import 'widget/appbar/action_flag_icon.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class Thaifooddata {}

class _OrderPageState extends State<OrderPage> {
  // final foodthai = ListFoodata.where

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ;
    //loadThaifoodset();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(flex: 3, child: SelectedMenu()),
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
  ///
  // final List<String> listCatfoodmenu_;
  // final List<List> menufood_;
  const SelectedMenu({
    super.key,
    // required this.listCatfoodmenu_,
    // required this.menufood_,
  });

  @override
  State<SelectedMenu> createState() => _SelectedMenuState();
}

class _SelectedMenuState extends State<SelectedMenu> {
  bool watin = true;

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
      body: BlocBuilder<OrderBloc, OrderState>(
        buildWhen: (previous, current) => true,
        builder: (context, state) {
          if (state is OrderStatefoodsSet) {
            Future.delayed(Duration(seconds: 1)).then((value) {
              setState(() {
                watin = false;
              });
            });
            return watin
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        floating: false,
                        pinned: true,
                        automaticallyImplyLeading: false,
                        bottom: PreferredSize(
                            preferredSize: isScreenwidht()
                                ? Size.fromHeight(100)
                                : Size.fromHeight(120), //bottom sliver appbar
                            child: Column(
                              //menu Set
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: isScreenwidht()
                                          ? context.heightsize / 14
                                          : context.widthsize / 12,
                                      width: isScreenwidht()
                                          ? context.heightsize / 4
                                          : context.heightsize / 8,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {});
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                          ),
                                          child: const Text(
                                            'Thaifood',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w500,
                                                fontStyle: FontStyle.normal),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: isScreenwidht()
                                          ? context.heightsize / 14
                                          : context.widthsize / 12,
                                      width: isScreenwidht()
                                          ? context.heightsize / 4
                                          : context.heightsize / 8,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            print("set block");
                                            context
                                                .read<OrderBloc>()
                                                .add(OrderInitialEvent());
                                            context.read<OrderBloc>().add(
                                                OrderStateJapanesFoodButtonClickedEvent());
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                          ),
                                          child: const Text('Japanesefood',
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: isScreenwidht()
                                          ? context.heightsize / 14
                                          : context.widthsize / 12,
                                      width: isScreenwidht()
                                          ? context.heightsize / 4
                                          : context.heightsize / 8,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                          ),
                                          child: const Text('FreeItem',
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                //Categeory
                                Padding(
                                  padding: const EdgeInsets.all(14),
                                  child: SizedBox(
                                    height: 50,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      physics:
                                          const AlwaysScrollableScrollPhysics(),
                                      itemCount: state.foodCatName.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              state.foodCatName[index],
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black),
                                            ));
                                      },
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ),
                      //food Menu
                      SliverList.builder(
                          itemCount: state.foodCatName.length,
                          itemBuilder: (context, index) {
                            // ListfilterFoodata.foodCatName

                            // return Text('data');
                            print(state.menufood[index].length);
                            return SliverListFoodOrder(
                                foodListitem: state.menufood[index],
                                foodcatname: state.foodCatName[index]);
                          }),
                    ],
                  );
          }

          print(state.runtimeType);

          return Container();
        },
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

// loadJapanesefoodset() {
  //   //loop foodSetId
  //   var filterfood = myfood.where((e) => e.foodSetId == 'Srd8o2evE8g=');

  //   final filterAppetizers =
  //       filterfood.where((e) => e.foodCatId == 'jePeFNAwuEY=');
  //   final filterSoupSalads =
  //       filterfood.where((e) => e.foodCatId == 'vMCylG10cHU=');
  //   final filterEntrees =
  //       filterfood.where((e) => e.foodCatId == 'nH/9Nj9g9gI=');
  //   final filterKidmu = filterfood.where((e) => e.foodCatId == 'CzhVi+Firzc=');
  //   final filterSideOrder =
  //       filterfood.where((e) => e.foodCatId == 'ghtx2D66zFg=');
  //   final filterLunchSpecial =
  //       filterfood.where((e) => e.foodCatId == 'iS94mlBDp70=');
  //   //appetizer

  //   SetFoodModel[0].add(filterAppetizers);
  //   SetFoodModel[1].add(filterSoupSalads);
  //   SetFoodModel[2].add(filterEntrees);
  //   SetFoodModel[3].add(filterKidmu);
  //   SetFoodModel[4].add(filterSideOrder);
  //   SetFoodModel[5].add(filterLunchSpecial);
  // }
  // loadThaifoodset() {
  //   ListfilterFoodata.myfood =
  //       ListFoodata.food.map((e) => Foodmodel.fromMap(e)).toList();
  //   //appfood
  //   ListfilterFoodata.filterfood = ListfilterFoodata.myfood
  //       .where((e) => e.foodSetId == 'Srd8o2evE8g=')
  //       .toList();
  //   //
  //   ListfilterFoodata.filterfood = ListfilterFoodata.filterfood =
  //       ListfilterFoodata.myfood
  //           .where((e) => e.foodSetId == 'Srd8o2evE8g=')
  //           .toList();

  //   var filterfood = myfood.where((e) => e.foodSetId == 'Srd8o2evE8g=');
  //   final filterAppetizers =
  //       filterfood.where((e) => e.foodCatId == 'jePeFNAwuEY=');
  //   final filterSoupSalads =
  //       filterfood.where((e) => e.foodCatId == 'vMCylG10cHU=');
  //   final filterEntrees =
  //       filterfood.where((e) => e.foodCatId == 'nH/9Nj9g9gI=');
  //   final filterKidmu = filterfood.where((e) => e.foodCatId == 'CzhVi+Firzc=');
  //   final filterSideOrder =
  //       filterfood.where((e) => e.foodCatId == 'ghtx2D66zFg=');
  //   final filterLunchSpecial =
  //       filterfood.where((e) => e.foodCatId == 'iS94mlBDp70=');
  //   //appetizer
  //   SetFoodModel[0].add(filterAppetizers);
  //   SetFoodModel[1].add(filterSoupSalads);
  //   SetFoodModel[2].add(filterEntrees);
  //   SetFoodModel[3].add(filterKidmu);
  //   SetFoodModel[4].add(filterSideOrder);
  //   SetFoodModel[5].add(filterLunchSpecial);
  // }
  // SliverListFoodOrder(
          //     foodListitem: widget.Appetizer, foodcatname: 'Appetizer'),
          // SliverListFoodOrder(
          //   foodListitem: widget.Soup,
          //   foodcatname: 'Soup',
          // ),
          // SliverListFoodOrder(
          //   foodListitem: widget.Salads,
          //   foodcatname: 'Salad',
          // ),
          // SliverListFoodOrder(
          //   foodListitem: widget.Noodles,
          //   foodcatname: 'Noodles',
          // ),
          // SliverListFoodOrder(
          //   foodListitem: widget.Entrees,
          //   foodcatname: 'Entrees',
          // ),