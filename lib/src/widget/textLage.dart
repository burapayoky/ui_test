import 'package:flutter/material.dart';
import 'package:ui_test/extensions/build_context.dart';

class TextLage extends StatelessWidget {
  final String hintText;

  const TextLage({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;
    final isPortrait = screenHeight > screenWidth;
    return Container(
      child: Text(
        hintText,
        style: TextStyle(
            fontSize: isPortrait ? screenHeight / 14 : screenHeight / 10, //124
            fontWeight: FontWeight.w600,
            fontFamily: 'Rasa',
            overflow: TextOverflow.clip),
      ),
    );
  }
}
