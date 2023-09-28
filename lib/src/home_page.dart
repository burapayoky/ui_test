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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;
    final isPortrait = screenHeight > screenWidth;
    bool isLandscape = screenWidth > screenHeight;

    PreferredSizeWidget appBar() {
      return AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(20),
          child: InkWell(
            onTap: () {
              if (screenHeight > 900) {
                null;
              } else if (isPortrait) {
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
            child: Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Row(
                children: [
                  Icon(
                    Icons.restaurant,
                    size: screenWidth / 40,
                    color: Colors.black38,
                  ),
                  const Padding(
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
            padding: EdgeInsets.only(top: screenHeight / 6),
            child: Column(
              children: [
                TextLage(
                  hintText: 'Self-Service',
                  textSize: isLandscape ? screenHeight / 50 : screenHeight / 16,
                ),
                TextLage(
                  hintText: 'Experience.',
                  textSize: screenHeight / 30,
                ),
              ],
            ),
          ),
          Text(
            'Form self-order to self-checkout',
            style: TextStyle(
                fontSize: isPortrait ? screenHeight / 50 : screenHeight / 40,
                color: Colors.black38,
                fontFamily: 'Roboto_Light'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.credit_card,
                size: isPortrait ? screenHeight / 48 : screenHeight / 48,
                color: Colors.red,
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth / 200),
                child: Text(
                  ' Accept Credit Card only',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize:
                        isPortrait ? screenHeight / 50 : screenHeight / 48,
                    fontFamily: 'Roboto_Light',
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.red,
                  ),
                ),
              )
            ],
          ),
        ],
      );
    }

    Widget bottomSheet() {
      if (isLandscape && screenHeight < 450 ||
          isPortrait && screenHeight < 731) {
        return Container();
      }
      return Expanded(
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              Flexible(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight / 40), //top: screenHeight / 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        flex: 4,
                        child: Padding(
                          padding: EdgeInsets.only(left: screenWidth / 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  'Contact Us',
                                  style: TextStyle(
                                      fontFamily: "Roboto_Light",
                                      fontSize: screenWidth / 100,
                                      color: Colors.white),
                                ),
                              ),
                              Flexible(
                                flex: 2,
                                child: Container(
                                  width: isPortrait ? 400 : 450,
                                  child: Text(
                                    'Rattanathibech 28 Alley, Tambon Bang Kraso, Mueang Nonthaburi District, Nonthaburi 11000',
                                    //
                                    style: TextStyle(
                                        fontSize: screenWidth / 100,
                                        color: Colors.white,
                                        fontFamily: "Roboto_Light"),
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Container(
                          child: Column(
                            children: [
                              Expanded(
                                child: ContractIconCircle(
                                  icon: Icons.call,
                                  text: '090-0890-xxxx',
                                  divide: isPortrait ? 60 : 54,
                                  textDivide: 60,
                                ),
                              ),
                              Expanded(
                                child: ContractIcon(
                                  icon: FontAwesomeIcons.instagram,
                                  text: 'SoiSiam',
                                  divide: isPortrait ? 50 : 30,
                                  textDivide: 100,
                                ),
                              ),
                              Expanded(
                                child: ContractIconCircle(
                                  icon: FontAwesomeIcons.youtube,
                                  text: 'SoiSiam Chanal',
                                  divide: isPortrait ? 80 : 58,
                                  textDivide: 100,
                                ),
                              ),
                              Expanded(
                                child: ContractIcon(
                                  icon: Icons.mail,
                                  text: 'SoiSiam@gmail.co.th',
                                  divide: isPortrait ? 50 : 30,
                                  textDivide: 100,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
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
              ),
            ],
          ),
        ),
      );
    }

    Widget landscapeWidget() {
      return Stack(
        children: [
          Positioned(
            child: Transform.rotate(
              angle: 28.28,
              child: Transform.translate(
                offset: Offset(
                    screenWidth / 15, 3 - screenHeight / 10), //Offset(70, -120)
                child: Container(
                  width: screenWidth / 2,
                  height: screenHeight / 0.1,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage('assets/images/bg/home_background1 1.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Flexible(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      child: Column(
                        children: [
                          bodyText(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight / 6, left: screenWidth / 28),
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
                    ),
                  ],
                ),
              ),
              bottomSheet()
            ],
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: InkWell(
                    onTap: () {
                      if (screenWidth > 1200) {
                        return null;
                      }
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

    Widget portraitWidget() {
      return Stack(
        children: [
          Positioned(
            child: Transform.rotate(
              angle: -18.86,
              child: Transform.translate(
                offset: Offset(screenWidth / 2000, 0),
                child: Container(
                  height: 2000, //2000
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg/Bg1.png'),
                      fit: BoxFit.fitWidth,
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
                    bottom: context.screenHeight / 9.4,
                    top: context.screenHeight / 40),
                child: const Row(
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
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(
                              Icons.restaurant,
                              size: screenHeight / 50,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            'Soi Siam',
                            style: TextStyle(
                                fontSize: screenHeight / 50,
                                color: Colors.black54,
                                fontFamily: 'Roboto_Light'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 4.0),
                  child: ActionsFlagIcon(),
                ),
              ],
            ),
          ),
        ],
      );
    }

    // print("W$screenWidth");
    print("size${context.screenSize}");
    return Scaffold(body: isLandscape ? landscapeWidget() : portraitWidget());
  }
}
