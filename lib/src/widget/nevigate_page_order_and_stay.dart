import 'package:flutter/material.dart';
import 'package:ui_test/extensions/build_context.dart';

class NavigatePageOrderAndStay extends StatelessWidget {
  final String image;
  final Color color;
  final String text;
  final String route;

  const NavigatePageOrderAndStay({
    super.key,
    required this.image,
    required this.color,
    required this.text,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;

    return SizedBox(
      width: screenHeight / 4,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Column(
          children: [
            Container(
              height: screenHeight / 4,
              width: screenHeight / 4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image), //
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight / 20,
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Center(
                  child: Text(
                    text, //
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: screenHeight / 40,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
