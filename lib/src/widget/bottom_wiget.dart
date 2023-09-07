import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_test/src/fristpage.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.maxFinite,
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.all(30.0),
        //body side
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
                          fontSize: context.widthsize / 40,
                          color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Rattanathibech 28  Rattanathibech 28 Alley,\nTambon Bang Kraso, Mueang Nontraburi District',
                        //
                        style: TextStyle(
                          fontSize: context.widthsize / 40,
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
                    //phone
                    IconwithCircle(
                      icon_: Icons.phone,
                      text_: '090-0890-xxxx',
                      divie: 30,
                      textdivie: 40,
                    ),
                    //instagram
                    IconwithCircle(
                      icon_: FontAwesomeIcons.instagram,
                      text_: 'SoiSiam',
                      divie: 30,
                      textdivie: 40,
                    ),
                    //youtube
                    IconwithCircle(
                      icon_: FontAwesomeIcons.youtube,
                      text_: 'SoiSiam Chanal',
                      divie: 35,
                      textdivie: 40,
                    ),
                    //gmail
                    IconwithCircle(
                      icon_: Icons.mail,
                      text_: 'SoiSiam@gmail.co.th',
                      divie: 30,
                      textdivie: 40,
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
                      padding: const EdgeInsets.only(top: 8, left: 8),
                      child: SizedBox(
                        height: 70,
                        width: 70,
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
    );
  }
}

class IconwithCircle extends StatelessWidget {
  final String text_;
  final IconData icon_;
  final double divie;
  final double textdivie;
  const IconwithCircle({
    super.key,
    required this.text_,
    required this.icon_,
    required this.divie,
    required this.textdivie,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: context.widthsize / 30),
          child: SizedBox(
            width: 30,
            child: FaIcon(icon_,
                color: Colors.white, size: context.heightsize / divie),
          ),
        ),
        Text(
          text_,
          style: TextStyle(
              color: Colors.white, fontSize: context.widthsize / textdivie),
        )
      ],
    );
  }
}
