import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:ui_test/src/fristpage.dart';
import 'package:ui_test/src/homepage.dart';
// import 'package:ui_test/src/models/Thaifood.dart';
// import 'package:ui_test/src/models/food_category.dart';
// import 'package:ui_test/src/models/foodmodel.dart';
import 'package:ui_test/src/orderpage.dart';

void main() {
  // var filterfood =
  //     ListFoodata.food.where((e) => e['foodSetId'] == 'Srd8o2evE8g=');

  // var myfoodcat =
  //     ListFoodata.foodCategory.map((e) => FoodCategory.fromMap(e)).toList();
  //filterfood = filterfood.where((e) => e['foodCatId'] == 'qPqbVd/wv7I=');
  //List<Map<String, dynamic>> thaiAzz = [];
  // print(ListfilterFoodata.myfoodcat[10].foodCatId);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      scrollBehavior: AppScrollBehavior(),
      routes: AppRoute().getAll,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppRoute {
  static const home = 'home';
  static const order = 'order';
  static const fristpage = 'fristpage';
  static const men = 'men';
  final _route = <String, WidgetBuilder>{
    home: (context) => const HomePage(),
    order: (context) => const OrderPage(),
    fristpage: (context) => const FristPage(),
  };
  get getAll => _route;
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
