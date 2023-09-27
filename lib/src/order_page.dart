import 'package:flutter/material.dart';
import 'package:ui_test/extensions/build_context.dart';
import 'package:ui_test/src/widget/check_in.dart';
import 'package:ui_test/src/widget/select_menu.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;
    //final isPortrait = screenHeight > screenWidth;
    final isLandscape = screenWidth > screenHeight;
    return Row(
      children: [
        const Flexible(flex: 4, child: SelectedMenu()),
        const VerticalDivider(
          width: 1,
          thickness: 20,
          color: Colors.black,
        ),
        Flexible(flex: isLandscape ? 1 : 2, child: const CheckIn())
      ],
    );
  }
}
