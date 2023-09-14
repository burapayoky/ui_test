import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_test/extensions/build_context.dart';
import 'package:ui_test/src/widget/bottom_wiget.dart';
import 'package:ui_test/src/widget/nevigate_page_order_and_stay.dart';
import 'package:ui_test/src/widget/textLage.dart';

import 'widget/appbar/action_flag_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;
    final isPortrait = screenHeight > screenWidth;
    final isLandscape = screenWidth > screenHeight;

    PreferredSizeWidget appBar() {
      return AppBar(
        title: Padding(
          padding: const EdgeInsets.all(20),
          child: InkWell(
            onTap: () {
              if (isPortrait) {
                return;
              }

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

    Widget bodyText() {
      return Column(
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
              )
            ],
          ),
        ],
      );
    }

    Widget bottomSheet() {
      if (isLandscape) {
        return Container();
      }

      return Expanded(
        child: Container(
          width: double.infinity,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Contact Us',
                            style: TextStyle(
                                fontSize: screenWidth / 60,
                                color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              'Rattanathibech 28  Rattanathibech 28 Alley,\nTambon Bang Kraso, Mueang Nontraburi District',
                              //
                              style: TextStyle(
                                fontSize: screenWidth / 60,
                                color: Colors.white,
                              ),
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                      //contact
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconWithCircle(
                            icon: Icons.phone,
                            text: '090-0890-xxxx',
                            divide: 50,
                            textDivide: 60,
                          ),
                          IconWithCircle(
                            icon: FontAwesomeIcons.instagram,
                            text: 'SoiSiam',
                            divide: 50,
                            textDivide: 60,
                          ),
                          IconWithCircle(
                            icon: FontAwesomeIcons.youtube,
                            text: 'SoiSiam Chanal',
                            divide: 60,
                            textDivide: 60,
                          ),
                          IconWithCircle(
                            icon: Icons.mail,
                            text: 'SoiSiam@gmail.co.th',
                            divide: 50,
                            textDivide: 60,
                          ),
                        ],
                      )
                    ],
                  ),
                  //bottom side
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '© Copyright 2022 | Powered by',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight / 60,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2, left: 2),
                            child: SizedBox(
                              height: screenWidth / 15,
                              width: screenWidth / 20,
                              child: Image.asset("assets/images/bg/smile.png"),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          bodyText(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NavigatePageOrderAndStay(
                  image: 'assets/images/gif/gif2.gif',
                  color: Colors.blue,
                  text: 'To Stay',
                  route: 'first-page',
                ),
                SizedBox(width: 20),
                NavigatePageOrderAndStay(
                  image: 'assets/images/gif/gif1.gif',
                  color: Color(0xFFFFB300),
                  text: 'Togo Walk-in',
                  route: 'order',
                ),
              ],
            ),
          ),
          bottomSheet(),
        ],
      ),
    );
  }
}
