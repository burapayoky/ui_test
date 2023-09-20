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
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(20),
          child: InkWell(
            onTap: () {
              if (screenHeight > 900) {
                null;
              } else if (isLandscape) {
                null;
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
            child: const Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Row(
                children: [
                  Icon(
                    Icons.restaurant,
                    size: 32.667,
                    color: Colors.black38,
                  ),
                  Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Soi Siam',
                      style: TextStyle(
                          fontSize: 36,
                          color: Colors.black38,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto_Lights'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(top: 13.0, right: 8),
            child: ActionsFlagIcon(),
          ),
        ],
      );
    }

    Widget bodyText() {
      return Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: screenHeight / 10),
            child: Column(
              children: [
                TextLage(
                  hintText: 'Self-Service',
                  textSize: isLandscape ? screenWidth / 50 : screenHeight / 16,
                ),
                TextLage(
                  hintText: 'Experience.',
                  textSize: screenHeight / 14,
                ),
              ],
            ),
          ),
          Text(
            'Form self-order to self-checkout',
            style: TextStyle(
                fontSize: isPortrait ? screenHeight / 48 : screenWidth / 60,
                color: Colors.black38,
                fontFamily: 'Roboto'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.credit_card,
                size: isPortrait ? screenHeight / 48 : screenWidth / 48,
                color: Colors.red,
              ),
              Text(
                ' Accept only Credit Card',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: isPortrait ? screenHeight / 48 : screenWidth / 58,
                  fontFamily: 'Roboto',
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
      if (screenHeight < 800) {
        return Container();
      } else if (isLandscape && screenHeight > 1200) {
        return Container();
      } else if (isLandscape && screenWidth > 2000) {
        return Container();
      }
      return Expanded(
        child: Container(
          width: double.infinity,
          color: Colors.black,
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.white)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: screenHeight / 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth / 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Contact Us',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                width: 400,
                                child: const Text(
                                  'Rattanathibech 28 Alley, Tambon Bang Kraso, Mueang Nonthaburi District, Nonthaburi 11000',
                                  //
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontFamily: "Roboto"),
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //contact
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconCircle(
                            icon: Icons.call,
                            text: '090-0890-xxxx',
                            divide: isPortrait ? 45 : 28,
                            textDivide: 60,
                          ),
                          IconWithCircle(
                            icon: FontAwesomeIcons.instagram,
                            text: 'SoiSiam',
                            divide: isPortrait ? 40 : 24,
                            textDivide: 60,
                          ),
                          IconCircle(
                            icon: FontAwesomeIcons.youtube,
                            text: 'SoiSiam Chanal',
                            divide: isPortrait ? 60 : 35,
                            textDivide: 60,
                          ),
                          IconWithCircle(
                            icon: Icons.mail,
                            text: 'SoiSiam@gmail.co.th',
                            divide: isPortrait ? 42 : 25,
                            textDivide: 60,
                          ),
                        ],
                      ),
                      //contact
                    ],
                  ),
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
                          padding: const EdgeInsets.only(top: 2, left: 1),
                          child: SizedBox(
                            height: screenWidth / 15,
                            width: screenWidth / 22,
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
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: screenWidth / 15, bottom: 90),
                child: Row(
                  children: [
                    Align(
                      child: Column(
                        children: [
                          bodyText(),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 100.0, left: screenHeight / 10),
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                NavigatePageOrderAndStay(
                                  image: 'assets/images/gif/gif2.gif',
                                  color: Color(0xFF496EE2),
                                  text: 'To Stay',
                                  route: 'first-page',
                                ),
                                SizedBox(width: 20),
                                NavigatePageOrderAndStay(
                                  image: 'assets/images/gif/gif1.gif',
                                  color: Color(0xFFFAA21c),
                                  text: 'Togo',
                                  route: 'order',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              bottomSheet()
            ],
          ),
        ],
      );
    }

    Widget portraitWidget() {
      return Stack(
        children: [
          Positioned(
            child: Transform.rotate(
              angle: -18.86,
              child: Transform.translate(
                offset: Offset(screenWidth / 2000, -60),
                child: Container(
                  height: 2000, //2000
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg/Bg1.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              bodyText(),
              Padding(
                padding: EdgeInsets.only(
                    bottom: context.screenHeight / 10,
                    top: context.screenHeight / 35),
                child: const Row(
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
                      text: 'Togo',
                      route: 'order',
                    ),
                  ],
                ),
              ),
              bottomSheet(),
            ],
          ),
        ],
      );
    }

    return Scaffold(
        appBar: appBar(),
        body: isLandscape ? landscapeWidget() : portraitWidget());
    //isPortrait ? portraitWidget() : landscapeWidget());
  }
}
  // Transform.rotate(
  //           angle: 12.57,
  //           child: Transform.translate(
  //             offset: Offset(-4, 0),
  //             child: Expanded(
  //               child: Container(
  //                 height: context.screenWidth * 100,
  //                 decoration: const BoxDecoration(
  //                   image: DecorationImage(
  //                     image: AssetImage('assets/images/bg/Bg1.png'),
  //                     fit: BoxFit.contain,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
