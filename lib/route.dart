import 'package:flutter/cupertino.dart';
import 'package:ui_test/src/first_page.dart';
import 'package:ui_test/src/home_page.dart';
import 'package:ui_test/src/order_page.dart';

class AppRoute {
  static const home = 'home';
  static const order = 'order';
  static const firstPage = 'first-page';
  static const menu = 'menu';

  final _route = <String, WidgetBuilder>{
    home: (context) => const HomePage(),
    order: (context) => const OrderPage(),
    firstPage: (context) => const FirstPage(),
  };

  get getAll => _route;
}
