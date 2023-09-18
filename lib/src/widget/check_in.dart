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
            child: Container(
              child: Row(
                children: [
                  const Text(
                    'My Order',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                        overflow: TextOverflow.fade),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: FaIcon(
                      FontAwesomeIcons.penToSquare,
                      size: context.screenWidth / 80,
                    ),
                  )
                ],
              ),
            ),
          ),
          const Divider(),
          const Center(
            child: Text(
              'No order selected',
              style: TextStyle(
                fontSize: 24,
                color: Color.fromARGB(79, 79, 79, 74),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                const Divider(),
                Padding(
                  padding: EdgeInsets.all(context.screenWidth / 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: context.screenHeight / 60,
                            fontFamily: 'Roboto'),
                      ),
                      const Text(
                        '\$ 0.00',
                        style: TextStyle(
                            color: Colors.purple, fontFamily: 'Roboto'),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: context.screenWidth / 18,
                  width: context.screenWidth / 6,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(136, 187, 186, 186),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 2),
                            child: Icon(
                              Icons.shopping_cart,
                              size: context.screenWidth / 80,
                              color: Colors.white,
                            ),
                          ),
                          Flexible(
                            // ใช้ Flexible ในการครอบ Text
                            child: Text(
                              'confirm Order (0)',
                              style: TextStyle(
                                fontSize: context.screenWidth / 90,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // เพิ่ม overflow ด้วย TextOverflow.ellipsis
                            ),
                          )
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
