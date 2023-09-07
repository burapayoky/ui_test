import 'package:flutter/material.dart';

import 'package:ui_test/src/fristpage.dart';
import 'package:ui_test/src/homepage.dart';
import 'package:ui_test/src/models/Thaifood.dart';
import 'package:ui_test/src/orderpage.dart';

void main() {
  //print(Thaifooddata.food[0]['foodId']);
  print((ListFoodata.food).runtimeType);
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
      initialRoute: '/',
      routes: {
        '/fristpage': (context) => FristPage(),
        '/order': (context) => OrderPage(),
        '/': (context) => HomePage()
      },
      //home: FristPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
