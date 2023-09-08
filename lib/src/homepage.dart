import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_test/src/fristpage.dart';
import 'package:ui_test/src/widget/bottom_wiget.dart';
import 'package:ui_test/src/widget/textLage.dart';

import 'widget/appbar/action_flag_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // bool _isButtonDisabled = false;
  // void ButtonDisabled() {
  //   if (context.widthsize < context.heightsize) {}
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.all(20),
            child: InkWell(
              onTap: context.widthsize < context.heightsize
                  ? null
                  : () {
                      //SnackBar(contianner())
                      showModalBottomSheet(
                          context: context,
                          constraints:
                              BoxConstraints(maxWidth: double.infinity),
                          builder: (context) => (const SafeArea(
                                  child: Padding(
                                padding: EdgeInsets.symmetric(),
                                child: BottomWidget(),
                              ))));
                    },
              child: Row(
                children: [
                  Icon(
                    Icons.restaurant,
                    size: context.heightsize / 40,
                    color: Colors.black54,
                  ),
                  Text(
                    'Soi Siam',
                    style: TextStyle(
                        fontSize: context.heightsize / 40,
                        color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
          actions: const [
            ActionsFlagIcon(),
          ],
        ),
        /////body
        body: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: context.heightsize / 8),
                  child: Column(
                    children: [
                      TextLage(
                          hinttext: 'Self-Service',
                          textsize: context.heightsize / 14),
                      TextLage(
                          hinttext: 'Experience.',
                          textsize: context.heightsize / 14),
                    ],
                  ),
                ),
                SizedBox(
                  height: context.heightsize / 30,
                ),
                Text(
                  'Form self-order to self-checkout',
                  style: TextStyle(fontSize: context.heightsize / 48),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.credit_card,
                      size: context.heightsize / 48,
                      color: Colors.red,
                    ),
                    Text(
                      ' Aceept only Credit Card',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: context.heightsize / 48,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.red),
                    )
                  ],
                ),

                //end of button
              ],
            ),
            //end of body text
            //gif
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NavigatePageOrderandStay(
                    image_: 'assets/images/gif/gif2.gif',
                    color_: Colors.blue,
                    text_: 'To Stay',
                    route_: '/fristpage',
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  NavigatePageOrderandStay(
                    image_: 'assets/images/gif/gif1.gif',
                    color_: Color(0xFFFFB300),
                    text_: 'Togo Wlak-in',
                    route_: '/order',
                  ),
                ],
              ),
            ),
            //bottom side
            context.heightsize < context.widthsize
                ? Column()
                : Expanded(
                    child: Container(
                        width: double.infinity,
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Contact Us',
                                        style: TextStyle(
                                            fontSize: context.widthsize / 60,
                                            color: Colors.white),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          'Rattanathibech 28  Rattanathibech 28 Alley,\nTambon Bang Kraso, Mueang Nontraburi District',
                                          //
                                          style: TextStyle(
                                            fontSize: context.widthsize / 60,
                                            color: Colors.white,
                                          ),
                                          softWrap: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                  //contact
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //phone
                                      IconwithCircle(
                                        icon_: Icons.phone,
                                        text_: '090-0890-xxxx',
                                        divie: 50,
                                        textdivie: 60,
                                      ),
                                      //instagram
                                      IconwithCircle(
                                        icon_: FontAwesomeIcons.instagram,
                                        text_: 'SoiSiam',
                                        divie: 50,
                                        textdivie: 60,
                                      ),
                                      //youtube
                                      IconwithCircle(
                                        icon_: FontAwesomeIcons.youtube,
                                        text_: 'SoiSiam Chanal',
                                        divie: 60,
                                        textdivie: 60,
                                      ),
                                      //gmail
                                      IconwithCircle(
                                        icon_: Icons.mail,
                                        text_: 'SoiSiam@gmail.co.th',
                                        divie: 50,
                                        textdivie: 60,
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
                                            fontSize: context.heightsize / 60),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2, left: 2),
                                        child: SizedBox(
                                          height: context.widthsize / 15,
                                          width: context.widthsize / 20,
                                          child: Image.asset(
                                              "assets/images/bg/smile.png"),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                  )
          ],
        ));
  }
}

class NavigatePageOrderandStay extends StatelessWidget {
  final String image_;
  final Color color_;
  final String text_;
  final String route_;
  const NavigatePageOrderandStay({
    super.key,
    required this.image_,
    required this.color_,
    required this.text_,
    required this.route_,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.heightsize / 4,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route_);
        },
        child: Column(
          children: [
            Container(
              height: context.heightsize / 4,
              width: context.heightsize / 4,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image_), //
                    fit: BoxFit.fill),
              ),
            ),
            SizedBox(
              height: context.heightsize / 20,
              child: Container(
                  decoration: BoxDecoration(
                      color: color_,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8))),
                  child: Center(
                      child: Text(
                    text_, //
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: context.heightsize / 40),
                  ))),
            )
          ],
        ),
      ),
    );
  }
}
