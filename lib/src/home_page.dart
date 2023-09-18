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
              padding: EdgeInsets.only(top: 30.0),
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
                          fontFamily: 'Roboto'),
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
            height: screenHeight / 60,
          ),
          Text(
            'Form self-order to self-checkout',
            style: TextStyle(
                fontSize: isPortrait ? screenHeight / 48 : screenWidth / 50,
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
                  fontSize: isPortrait ? screenHeight / 48 : screenWidth / 48,
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
      }

      return Expanded(
        child: Container(
          width: double.infinity,
          color: Colors.black,
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.white)),
            child: Column(
              children: [
                const Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact Us',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Rattanathibech 28  Rattanathibech 28 Alley,\nTambon Bang Kraso, Mueang Nontraburi District',
                            //
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: "Roboto"),
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                    //contact
                    Padding(
                      padding: EdgeInsets.only(left: 380.0, top: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconWithCircle(
                            icon: Icons.phone,
                            text: '090-0890-xxxx',
                            divide: 30,
                            textDivide: 60,
                          ),
                          IconWithCircle(
                            icon: FontAwesomeIcons.instagram,
                            text: 'SoiSiam',
                            divide: 24,
                            textDivide: 60,
                          ),
                          IconWithCircle(
                            icon: FontAwesomeIcons.youtube,
                            text: 'SoiSiam Chanal',
                            divide: 30,
                            textDivide: 60,
                          ),
                          IconWithCircle(
                            icon: Icons.mail,
                            text: 'SoiSiam@gmail.co.th',
                            divide: 25,
                            textDivide: 60,
                          ),
                        ],
                      ),
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
      );
    }

    Widget landscapeWidget() {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 100, bottom: 12),
            child: Row(
              children: [
                Align(
                  child: Column(
                    children: [
                      bodyText(),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 100.0, left: 80),
                  child: Row(
                    children: [
                      Padding(
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
      );
    }

    Widget portraitWidget() {
      return Column(
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
                  text: 'Togo',
                  route: 'order',
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          bottomSheet(),
        ],
      );
    }

    return Scaffold(
        appBar: appBar(),
        body: isLandscape ? landscapeWidget() : portraitWidget());
    //isPortrait ? portraitWidget() : landscapeWidget());
  }
}
// return Scaffold(
//       appBar: appBar(),
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               bodyText(),
//               const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     NavigatePageOrderAndStay(
//                       image: 'assets/images/gif/gif2.gif',
//                       color: Colors.blue,
//                       text: 'To Stay',
//                       route: 'first-page',
//                     ),
//                     SizedBox(width: 20),
//                     NavigatePageOrderAndStay(
//                       image: 'assets/images/gif/gif1.gif',
//                       color: Color(0xFFFFB300),
//                       text: 'Togo Walk-in',
//                       route: 'order',
//                     ),
//                   ],
//                 ),
//               ),
//               bottomSheet(),
//             ],
//           ),
//         ],
//       ),
//     );