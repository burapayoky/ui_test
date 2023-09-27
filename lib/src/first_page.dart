import 'package:flutter/material.dart';
import 'package:ui_test/extensions/build_context.dart';
import 'package:ui_test/src/widget/TextLage.dart';

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
            onTap: () {},
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
          Positioned(
            child: Transform.rotate(
              angle: 6.28,
              child: FractionalTranslation(
                translation: Offset(screenHeight / 15000, 0),
                child: Container(
                  width: screenHeight / 0.1,
                  height: screenHeight / 1.4,
                  //width: screenWidth * 2,
                  decoration: const BoxDecoration(
                    // color: Colors.amber,
                    image: DecorationImage(
                      image:
                          AssetImage('assets/images/bg/home_background1 1.png'),
                      fit: BoxFit.cover,
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.restaurant,
                          size: screenHeight / 60,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        'Soi Siam',
                        style: TextStyle(
                            fontSize: screenHeight / 60,
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
                    padding: const EdgeInsets.only(top: 40, bottom: 100),
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
              angle: 28.27,
              child: FractionalTranslation(
                translation: Offset(screenWidth / 10000, -0.16),
                child: Container(
                  height: context.screenWidth / 0.5,
                  width: screenWidth / 1.8,
                  // width: screenWidth * 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage('assets/images/bg/home_background1 1.png'),
                      fit: BoxFit.fitHeight,
                    ),
                    //color: Colors.amber,
                  ),
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight / 6),
                      child: Column(
                        children: [
                          TextLage(
                            hintText: 'Self-Service',
                            textSize: screenHeight / 16,
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
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.restaurant,
                              size: screenHeight / 40,
                              color: Colors.black54,
                            ),
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
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ActionsFlagIcon(),
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      // appBar: isPortrait ? null : appBar(),
      body: isPortrait ? portraitWidget() : landscapeWidget(),
    );
  }
}
