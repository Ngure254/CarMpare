import 'package:flutter/material.dart';

Map<int, Color> color = {
  50: const Color.fromRGBO(136, 14, 79, .1),
  100: const Color.fromRGBO(136, 14, 79, .2),
  200: const Color.fromRGBO(136, 14, 79, .3),
  300: const Color.fromRGBO(136, 14, 79, .4),
  400: const Color.fromRGBO(136, 14, 79, .5),
  500: const Color.fromRGBO(136, 14, 79, .6),
  600: const Color.fromRGBO(136, 14, 79, .7),
  700: const Color.fromRGBO(136, 14, 79, .8),
  800: const Color.fromRGBO(136, 14, 79, .9),
  900: const Color.fromRGBO(136, 14, 79, 1),
};

class MaterialColorsData {
  static final MaterialColor Primary = MaterialColor(0xFF1903A6, color);
  static final MaterialColor Secondary = MaterialColor(0xFF7F71D9, color);
}

class ColorsData {
  static const Color Primary = Color(0xFF1903A6);
  static const Color Secondary = Color(0xFF7F71D9);
  static const Color FaceBook = Color(0xFF3b5998);
  static const Color Google = Color(0xFFEA4335);
  static const Color DarkBg = Color(0xFF170973);
  static const Color text = Color(0xFF595959);
  static const Color alt = Color(0xFFA00B10);
}
