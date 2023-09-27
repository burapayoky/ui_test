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
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   automaticallyImplyLeading: false,
      //   actions: const [
      //     ActionsFlagIcon(),
      //   ],
      // ),
      body: Column(
        children: [
          const SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ActionsFlagIcon(),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: screenWidth / 40, vertical: 3),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: screenWidth / 180),
                  child: Container(
                    child: Text(
                      'My Order',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize:
                              isLandscape ? screenWidth / 60 : screenWidth / 40,
                          fontFamily: 'Roboto_Light',
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
                    size: isLandscape ? screenWidth / 60 : screenWidth / 40,
                  ),
                )
              ],
            ),
          ),
          Divider(
            thickness: 1,
            indent: screenWidth / 40,
            endIndent: screenWidth / 40,
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'No order selected',
                  style: TextStyle(
                      fontSize:
                          isLandscape ? screenWidth / 80 : screenWidth / 50,
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
                Divider(
                  thickness: 1,
                  indent: screenWidth / 40,
                  endIndent: screenWidth / 40,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 24,
                      left: screenWidth / 40,
                      right: screenWidth / 40,
                      bottom: 16),
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Text(
                          'Total',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: isLandscape
                                ? context.screenWidth / 60
                                : screenWidth / 40,
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
                                  ? context.screenWidth / 60
                                  : screenWidth / 40,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IntrinsicWidth(
                  child: SizedBox(
                    height: isLandscape
                        ? screenHeight / 13
                        : context.screenWidth / 12,
                    // width: isLandscape
                    //     ? screenWidth / 6.5
                    //     : context.screenWidth / 4.5,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: screenHeight / 100),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(screenWidth / 120),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            Colors.black26,
                          ),
                        ),
                        onPressed: () {},
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(right: screenWidth / 140),
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                size: isLandscape
                                    ? screenWidth / 70
                                    : screenWidth / 40,
                                color: Colors.white,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'confirm Order (0)',
                                style: TextStyle(
                                  fontSize: isLandscape
                                      ? screenWidth / 80
                                      : screenWidth / 45,
                                  color: Colors.white,
                                  fontFamily: 'Roboto_Light',
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
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
