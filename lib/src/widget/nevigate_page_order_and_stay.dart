import 'package:flutter/material.dart';
import 'package:ui_test/extensions/build_context.dart';

class NavigatePageOrderAndStay extends StatefulWidget {
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
  State<NavigatePageOrderAndStay> createState() =>
      _NavigatePageOrderAndStayState();
}

class _NavigatePageOrderAndStayState extends State<NavigatePageOrderAndStay> {
  double? prescreenWidth;
  double? prescreenHith;
  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;
    // final isPortrait = screenHeight > screenWidth;
    final isLandscape = screenWidth > screenHeight;

    return SizedBox(
      width: isLandscape ? double.infinity : double.infinity,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, widget.route);
        },
        // splashFactory: NoSplash.splashFactory,
        child: Column(
          children: [
            Container(
              height: isLandscape ? screenHeight / 3 : screenHeight / 5,
              width: isLandscape ? double.infinity : double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.image), //
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
              height: isLandscape ? screenHeight / 17 : screenHeight / 18,
              child: Container(
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.text, //
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