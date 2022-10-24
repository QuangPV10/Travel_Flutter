import 'package:flutter/material.dart';

class ColorPalette {
  static const primaryColor = Color(0xff6155CC);
  static const secondColor = Color(0xff8f65e8);
  static const yellowColor = Color(0xfffe9c5e);

  static const dividerColor = Color(0xffe5e7eb);
  static const text1Color = Color(0xff323b4b);
  static const subTitleColor = Color(0xff838383);
  static const backgroundScaffoldColor = Color(0xfff2f2f2);
}

class Gradients {
  static const Gradient defaultGradientBackground = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomLeft,
      colors: [ColorPalette.secondColor, ColorPalette.primaryColor]);
}
