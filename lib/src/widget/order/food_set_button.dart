import 'package:flutter/material.dart';

class FoodSetButton extends StatelessWidget {
  final String name;
  final double width;
  final double height;

  const FoodSetButton({
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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: const Color.fromARGB(157, 168, 165, 165),
        ),
        child: Center(
          child: Text(
            name,
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
