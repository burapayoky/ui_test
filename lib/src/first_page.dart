import 'package:flutter/material.dart';
import 'package:ui_test/extensions/build_context.dart';
import 'package:ui_test/src/widget/TextLage.dart';
import 'package:ui_test/src/widget/bottom_wiget.dart';

import 'widget/appbar/action_flag_icon.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;
    final isPortrait = screenHeight > screenWidth;
    // final isLandscape = screenWidth > screenHeight;

    PreferredSizeWidget appBar() {
      return AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(20),
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                constraints: const BoxConstraints(maxWidth: double.infinity),
                builder: (context) {
                  return const SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(),
                      child: BottomWidget(),
                    ),
                  );
                },
              );
            },
            child: Row(
              children: [
                Icon(
                  Icons.restaurant,
                  size: screenHeight / 40,
                  color: Colors.black54,
                ),
                Text(
                  'Soi Siam',
                  style: TextStyle(
                    fontSize: screenHeight / 40,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: const [
          ActionsFlagIcon(),
        ],
      );
    }

    Widget portraitWidget() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: screenHeight / 8),
                child: Column(
                  children: [
                    TextLage(
                      hintText: 'Self-Service',
                      textSize: screenHeight / 14,
                    ),
                    TextLage(
                      hintText: 'Experience.',
                      textSize: screenHeight / 14,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight / 30,
              ),
              Text(
                'Form self-order to self-checkout',
                style: TextStyle(
                  fontSize: screenHeight / 48,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.credit_card,
                    size: screenHeight / 48,
                    color: Colors.red,
                  ),
                  Text(
                    ' Accept only Credit Card',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: screenHeight / 48,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.red,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'order');
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    backgroundColor: const MaterialStatePropertyAll(
                      Colors.blue,
                    ),
                  ),
                  child: Text(
                    'Tap to Order',
                    style: TextStyle(
                      fontSize: screenHeight / 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/gif/gif1.gif'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  right: screenWidth / 35,
                  top: screenHeight / 9,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.restaurant,
                        size: screenWidth / 38,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Soi Siam',
                      style: TextStyle(
                        fontSize: screenWidth / 40,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget landscapeWidget() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screenHeight / 8),
                  child: Column(
                    children: [
                      TextLage(
                        hintText: 'Self-Service',
                        textSize: screenHeight / 14,
                      ),
                      TextLage(
                        hintText: 'Experience.',
                        textSize: screenHeight / 14,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight / 30,
                ),
                Text(
                  'Form self-order to self-checkout',
                  style: TextStyle(fontSize: screenHeight / 48),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.credit_card,
                      size: screenHeight / 48,
                      color: Colors.red,
                    ),
                    Text(
                      ' Accept only Credit Card',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: screenHeight / 48,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.red,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'order');
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      )),
                      backgroundColor: const MaterialStatePropertyAll(
                        Colors.blue,
                      ),
                    ),
                    child: Text(
                      'Tap to Order',
                      style: TextStyle(
                        fontSize: screenHeight / 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/gif/gif1.gif'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  right: screenWidth / 35,
                  top: screenHeight / 9,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.restaurant,
                        size: screenWidth / 38,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Soi Siam',
                      style: TextStyle(
                        fontSize: screenWidth / 40,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: appBar(),
      body: isPortrait ? portraitWidget() : landscapeWidget(),
    );
  }
}