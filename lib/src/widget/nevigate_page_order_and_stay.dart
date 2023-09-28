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
    // final isPortrait = screenHeight > screenWidth;
    final isLandscape = screenWidth > screenHeight;
    return SizedBox(
      width: isLandscape ? screenWidth / 5 : screenHeight / 5,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        // splashFactory: NoSplash.splashFactory,
        child: Column(
          children: [
            Container(
              height: isLandscape ? screenWidth / 5 : screenHeight / 5,
              width: isLandscape ? screenWidth / 5 : screenHeight / 5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image), //
                  fit: BoxFit.fill,
                ),
                border: Border.all(
                  width: 0.25,
                  color: const Color.fromARGB(255, 190, 190, 190),
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight < 640 && screenWidth < 1011
                  ? screenWidth / 28
                  : screenHeight / 18,
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
                        fontSize: screenHeight / 50,
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
//  screenHeight < 640 && screenWidth < 900
//           ? 