import 'package:flutter/material.dart';

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
            //borderRadius: BorderRadius.circular(6),
            color: Color.fromARGB(157, 168, 165, 165)),
        child: Center(
            child: Text(
          name_, //'ThaiMenu'
          style: TextStyle(color: Colors.black, fontSize: 18),
        )),
      ),
    );
  }
}

// ignore: must_be_immutable
class ButtonSetFood extends StatelessWidget {
  final String name_;
  final double width_;
  final double height_;

  ButtonSetFood({
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
            color: Color.fromARGB(157, 168, 165, 165)),
        child: Center(
            child: Text(
          name_, //'ThaiMenu'
          style: TextStyle(color: Colors.black, fontSize: 18),
        )),
      ),
    );
  }
}
