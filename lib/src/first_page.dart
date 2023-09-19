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
        backgroundColor: Colors.white,
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
                      fontFamily: 'Roboto_Light'),
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
      return Stack(
        children: [
          Transform.translate(
            offset: Offset(context.screenHeight / 25, -300),
            child: Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image:
                        AssetImage('assets/images/bg/home_background1 1.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      constraints:
                          const BoxConstraints(maxWidth: double.infinity),
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
                            fontFamily: 'Roboto_Light'),
                      ),
                    ],
                  ),
                ),
              ),
              ActionsFlagIcon(),
            ],
          ),
          Column(
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
                      fontFamily: 'Roboto',
                      color: Colors.black38,
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
                          fontFamily: 'Roboto',
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: SizedBox(
                      width: screenHeight / 4,
                      height: screenHeight / 12,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'order');
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )),
                            backgroundColor: const MaterialStatePropertyAll(
                              Color(0xFF496EE2),
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
          ),
        ],
      );
    }

    Widget landscapeWidget() {
      return Stack(
        children: [
          Positioned(
            child: Transform.rotate(
              angle: 28.3,
              child: Transform.translate(
                offset: Offset(screenWidth / 2.6, -18),
                child: Container(
                  height: context.screenWidth * 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage('assets/images/bg/home_background1 1.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      constraints:
                          const BoxConstraints(maxWidth: double.infinity),
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
                            fontFamily: 'Roboto_Light'),
                      ),
                    ],
                  ),
                ),
              ),
              const ActionsFlagIcon(),
            ],
          ),
          Row(
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
                    SizedBox(
                      child: Text(
                        'Form self-order to self-checkout',
                        style: TextStyle(
                            fontSize: screenHeight / 48,
                            overflow: TextOverflow.visible),
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
                        ),
                      ],
                    ),
                    SizedBox(
                      width: screenHeight / 4,
                      height: screenHeight / 12,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'order');
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
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
                      top: screenHeight / 4,
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
          ),
        ],
      );
    }

    return Scaffold(
      // appBar: appBar(),
      body: isPortrait ? portraitWidget() : landscapeWidget(),
    );
  }
}
