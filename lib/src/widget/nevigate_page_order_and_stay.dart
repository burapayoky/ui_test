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
    final isPortrait = screenHeight > screenWidth;

    return SizedBox(
      width: isPortrait ? screenHeight / 5 : screenWidth / 5,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Column(
          children: [
            Container(
              height: isPortrait ? screenHeight / 5 : screenWidth / 5,
              width: isPortrait ? screenHeight / 5 : screenWidth / 5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image), //
                    fit: BoxFit.fill,
                  ),
                  border: Border.all(width: 0.25),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
            ),
            SizedBox(
              height: isPortrait ? screenHeight / 20 : screenWidth / 20,
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
                        fontSize: screenHeight / 35,
                        fontFamily: 'Roboto_Light'),
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
