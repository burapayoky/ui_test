import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:ui_test/src/fristpage.dart';
import 'package:ui_test/src/homepage.dart';
//import 'package:ui_test/src/models/Thaifood.dart';
//import 'package:ui_test/src/models/foodmodel.dart';
import 'package:ui_test/src/orderpage.dart';

void main() {
  //final myfood = ListFoodata.food.map((e) => Foodmodel.fromMap(e)).toList();
  // print(ListFoodata.food[0]['imageName']);
  //print(ListFoodata.food.length);
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
      // initialRoute: '/',
      // routes: {
      //   '/fristpage': (context) => FristPage(),
      //   '/order': (context) => OrderPage(),
      //   '/': (context) => HomePage()
      // },
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
