import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_test/extensions/build_context.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.maxFinite,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
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
                        fontSize: context.screenWidth / 40,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Rattanathibech 28  Rattanathibech 28 Alley,\nTambon Bang Kraso, Mueang Nontraburi District',
                        style: TextStyle(
                          fontSize: context.screenWidth / 40,
                          color: Colors.white,
                        ),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconWithCircle(
                      icon: Icons.phone,
                      text: '090-0890-xxxx',
                      divide: 30,
                      textDivide: 40,
                    ),
                    IconWithCircle(
                      icon: FontAwesomeIcons.instagram,
                      text: 'SoiSiam',
                      divide: 30,
                      textDivide: 40,
                    ),
                    IconWithCircle(
                      icon: FontAwesomeIcons.youtube,
                      text: 'SoiSiam Chanel',
                      divide: 35,
                      textDivide: 40,
                    ),
                    IconWithCircle(
                      icon: Icons.mail,
                      text: 'SoiSiam@gmail.co.th',
                      divide: 30,
                      textDivide: 40,
                    ),
                  ],
                ),
              ],
            ),
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
                        fontSize: context.screenHeight / 60,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8),
                      child: SizedBox(
                        height: 70,
                        width: 70,
                        child: Image.asset("assets/images/bg/smile.png"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconWithCircle extends StatelessWidget {
  final String text;
  final IconData icon;
  final double divide;
  final double textDivide;

  const IconWithCircle({
    super.key,
    required this.text,
    required this.icon,
    required this.divide,
    required this.textDivide,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: context.screenWidth / 30),
          child: SizedBox(
            width: 30,
            child: FaIcon(
              icon,
              color: Colors.white,
              size: context.screenHeight / divide,
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: context.screenWidth / textDivide,
          ),
        )
      ],
    );
  }
}
