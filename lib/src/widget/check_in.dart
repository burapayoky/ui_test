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
        automaticallyImplyLeading: false,
        actions: const [
          ActionsFlagIcon(),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            child: Row(
              children: [
                const Text(
                  'My Order',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 34,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: FaIcon(
                    FontAwesomeIcons.edit,
                    size: context.screenWidth / 80,
                  ),
                )
              ],
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
          const Spacer(flex: 2),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                        ),
                      ),
                      const Text(
                        'xxx',
                        style: TextStyle(color: Colors.purple),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: context.screenWidth / 24,
                  width: context.screenWidth / 5,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      backgroundColor: const MaterialStatePropertyAll(
                        Color.fromARGB(136, 187, 186, 186),
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
                        Text(
                          'confirm Order (0)',
                          style: TextStyle(
                            fontSize: context.screenWidth / 90,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.fade,
                        )
                      ],
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