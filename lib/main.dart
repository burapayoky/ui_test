import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:ui_test/src/fristpage.dart';
import 'package:ui_test/src/homepage.dart';
import 'package:ui_test/src/order/bloc/order_bloc.dart';
import 'package:ui_test/src/orderpage.dart';
import 'package:ui_test/test/bloc/get_data_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    final orderBloc = BlocProvider<OrderBloc>(create: (context) => OrderBloc());
    final testBloc =
        BlocProvider<GetDataBloc>(create: (context) => GetDataBloc());
    return MultiProvider(
      providers: [orderBloc, testBloc],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        scrollBehavior: AppScrollBehavior(),
        routes: AppRoute().getAll,
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
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
//final homemainBloc =BlocProvider<OrderBloc>(create: (context) => OrderBloc());
