import 'package:flutter/material.dart';

class TextLage extends StatelessWidget {
  final String hinttext;
  final double textsize;

  TextLage({
    super.key,
    required this.hinttext,
    required this.textsize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      hinttext,
      style: TextStyle(
        fontSize: textsize,
        fontWeight: FontWeight.w800,
        fontFamily: AutofillHints.creditCardFamilyName,
      ),
    );
  }
}
