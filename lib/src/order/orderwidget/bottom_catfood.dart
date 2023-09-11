import 'package:flutter/material.dart';
import 'package:ui_test/src/fristpage.dart';

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
