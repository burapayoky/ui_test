import 'package:flutter/material.dart';

class FoodCatButton extends StatelessWidget {
  final String name;
  final double width;
  final double height;

  const FoodCatButton({
    super.key,
    required this.name,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: height, //120
        height: width, //40
        decoration: const BoxDecoration(
          color: Color.fromARGB(157, 168, 165, 165),
        ),
        child: Center(
          child: Text(
            name, //'ThaiMenu'
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
