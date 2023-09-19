import 'package:flutter/material.dart';
import 'package:ui_test/src/widget/check_in.dart';
import 'package:ui_test/src/widget/select_menu.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Flexible(flex: 3, child: SelectedMenu()),
        VerticalDivider(
          width: 1,
          thickness: 20,
          color: Colors.black,
        ),
        Flexible(flex: 2, child: CheckIn())
      ],
    );
  }
}
