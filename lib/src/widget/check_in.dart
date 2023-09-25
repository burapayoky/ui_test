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
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: const Text(
                      'My Order',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 34,
                          fontStyle: FontStyle.normal,
                          overflow: TextOverflow.fade),
                    ),
                  ),
                ),
                // SizedBox(
                //   width: screenWidth / 30,
                // ),
                const Expanded(
                  child: FaIcon(
                    FontAwesomeIcons.penToSquare,
                    size: 34,
                  ),
                )
              ],
            ),
          ),
          const Divider(),
          const Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(
                'No order selected',
                style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff4f4f4f),
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto_Light'),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.all(14),
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
                            fontSize: 32,
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
                              fontSize: 32,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: isLandscape
                      ? screenHeight / 14
                      : context.screenWidth / 12,
                  width:
                      isLandscape ? screenHeight / 3 : context.screenWidth / 3,
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
                      onPressed: () {
                        print(context.screenWidth / 60);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 2),
                            child: Icon(
                              Icons.shopping_cart,
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
