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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Flexible(
                          child: Text(
                            'Contact Us',
                            style: TextStyle(
                                fontFamily: "Roboto_Light",
                                fontSize: 18,
                                color: Colors.white),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            width: 400,
                            child: const Text(
                              'Rattanathibech 28 Alley, Tambon Bang Kraso, Mueang Nonthaburi District, Nonthaburi 11000',
                              //
                              style: TextStyle(
                                  fontSize: 18,
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

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: screenWidth / 20, //100
          child: CircleAvatar(
            maxRadius: isPortrait ? screenWidth / 70 : screenWidth / 80,
            backgroundColor: Colors.white,
            child: FaIcon(
              icon,
              color: Colors.black,
              size: context.screenHeight / divide,
            ),
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth / 60,
            ),
          ),
        ),
      ],
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

    final isPortrait = screenHeight > screenWidth;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: screenWidth / 20,
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
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth / 60,
            ),
          ),
        )
      ],
    );
  }
}
 // return Padding(
    //   padding: const EdgeInsets.only(top: 8.0),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     children: [
    //       Container(
    //         width: 100,
    //         child: CircleAvatar(
    //           // maxRadius: isPortrait ? screenWidth / 50 : screenWidth / 70,
    //           backgroundColor: Colors.white,
    //           child: FaIcon(
    //             icon,
    //             color: Colors.black,
    //             size: context.screenHeight / divide,
    //           ),
    //         ),
    //       ),
    //       Text(
    //         text,
    //         style: TextStyle(
    //           color: Colors.white,
    //           fontSize: 12,
    //         ),
    //       )
    //     ],
    //   ),
    // );