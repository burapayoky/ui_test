import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_test/extensions/build_context.dart';
import 'package:ui_test/src/widget/appbar/action_flag_icon.dart';

class CheckIn extends StatelessWidget {
  const CheckIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;
    //final isPortrait = screenHeight > screenWidth;
    final isLandscape = screenWidth > screenHeight;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: const [
          ActionsFlagIcon(),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Container(
                    child: Text(
                      'My Order',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: screenWidth / 50,
                          fontStyle: FontStyle.normal,
                          overflow: TextOverflow.fade),
                    ),
                  ),
                ),
                // SizedBox(
                //   width: screenWidth / 30,
                // ),
                Expanded(
                  child: FaIcon(
                    FontAwesomeIcons.penToSquare,
                    size: screenWidth / 50,
                  ),
                )
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            indent: 30,
            endIndent: 30,
          ),
          Flexible(
            flex: 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'No order selected',
                  style: TextStyle(
                      fontSize: screenWidth / 70,
                      color: Color(0xff4f4f4f),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto_Light'),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                const Divider(
                  indent: 30,
                  endIndent: 30,
                ),
                Padding(
                  padding: EdgeInsets.all(28),
                  child: Flex(
                    direction: Axis
                        .horizontal, // Make sure it's horizontal for a row-like layout
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Total',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: isLandscape
                                ? context.screenHeight / 25
                                : screenWidth / 20,
                            fontFamily: 'Roboto',
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '\$ 0.00',
                            style: TextStyle(
                              color: Color(0xFF7B61FF),
                              fontFamily: 'Roboto',
                              fontSize: isLandscape
                                  ? context.screenHeight / 25
                                  : screenWidth / 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: isLandscape
                      ? screenHeight / 13
                      : context.screenWidth / 11,
                  width: isLandscape
                      ? screenWidth / 5.8
                      : context.screenWidth / 3.5,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          Colors.black26,
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 2),
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              size: isLandscape
                                  ? screenWidth / 50
                                  : screenWidth / 38,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'confirm Order (0)',
                              style: TextStyle(
                                fontSize: isLandscape
                                    ? screenWidth / 66
                                    : context.screenWidth / 40,
                                color: Colors.white,
                                fontFamily: 'Roboto',
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
