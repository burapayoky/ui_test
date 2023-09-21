import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_test/extensions/build_context.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;
    final isPortrait = screenHeight > screenWidth;
    return Container(
      width: double.infinity,
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
                Padding(
                  padding: EdgeInsets.only(top: isPortrait ? 30 : 2),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconCircle(
                        icon: Icons.phone,
                        text: '090-0890-xxxx',
                        divide: 30,
                        textDivide: 40,
                      ),
                      IconWithCircle(
                        icon: FontAwesomeIcons.instagram,
                        text: 'SoiSiam',
                        divide: 22,
                        textDivide: 40,
                      ),
                      IconCircle(
                        icon: FontAwesomeIcons.youtube,
                        text: 'SoiSiam Chanel',
                        divide: 35,
                        textDivide: 40,
                      ),
                      IconWithCircle(
                        icon: Icons.mail,
                        text: 'SoiSiam@gmail.co.th',
                        divide: 22,
                        textDivide: 40,
                      ),
                    ],
                  ),
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
    // final screenWidth = context.screenWidth;
    // final screenHeight = context.screenHeight;
    //final isPortrait = screenHeight > screenWidth;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

class IconCircle extends StatelessWidget {
  final String text;
  final IconData icon;
  final double divide;
  final double textDivide;

  const IconCircle({
    super.key,
    required this.text,
    required this.icon,
    required this.divide,
    required this.textDivide,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;
    final isPortrait = screenHeight > screenWidth;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(
              right: isPortrait ? screenHeight / 80 : context.screenWidth / 40),
          child: CircleAvatar(
            maxRadius: isPortrait ? screenHeight / 90 : 19,
            minRadius: 9,
            backgroundColor: Colors.white,
            child: SizedBox(
              width: isPortrait ? 40 : 32,
              child: FaIcon(
                icon,
                color: Colors.black,
                size: context.screenHeight / divide,
              ),
            ),
          ),
        ),
        Container(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: context.screenWidth / textDivide,
            ),
          ),
        )
      ],
    );
  }
}

class ContractIconCircle extends StatelessWidget {
  final String text;
  final IconData icon;
  final double divide;
  final double textDivide;

  const ContractIconCircle({
    super.key,
    required this.text,
    required this.icon,
    required this.divide,
    required this.textDivide,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;
    final isPortrait = screenHeight > screenWidth;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 100,
            child: CircleAvatar(
              maxRadius: isPortrait ? screenWidth / 50 : screenWidth / 70,
              backgroundColor: Colors.white,
              child: FaIcon(
                icon,
                color: Colors.black,
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
      ),
    );
  }
}

class ContractIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final double divide;
  final double textDivide;

  const ContractIcon({
    super.key,
    required this.text,
    required this.icon,
    required this.divide,
    required this.textDivide,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;
    // ignore: unused_local_variable
    final isPortrait = screenHeight > screenWidth;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 100,
            child: CircleAvatar(
              maxRadius: isPortrait ? screenWidth / 50 : screenWidth / 70,
              backgroundColor: Colors.black,
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
      ),
    );
  }
}
