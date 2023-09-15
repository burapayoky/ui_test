import 'package:flutter/material.dart';

class TextLage extends StatelessWidget {
  final String hintText;
  final double textSize;

  const TextLage({
    super.key,
    required this.hintText,
    required this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      hintText,
      style: const TextStyle(
        fontSize: 124,
        fontWeight: FontWeight.w600,
        fontFamily: AutofillHints.creditCardFamilyName,
      ),
    );
  }
}
