import 'package:flutter/material.dart';

extension Responsive on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;
  bool get isPortrait => screenHeight > screenWidth;
  bool get isLandscape => screenWidth > screenHeight;
  Size get screenSize => MediaQuery.of(this).size;
}
