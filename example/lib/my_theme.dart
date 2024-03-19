import 'package:color_theme_provider/color_theme_provider.dart';
import 'package:flutter/material.dart';

class MyTheme extends ColorTheme {
  MyTheme({
    required this.mainColor,
    required this.containerColor,
    required this.backgroundColor,
    required this.textColor,
  });

  final Color mainColor;
  final Color containerColor;
  final Color backgroundColor;
  final Color textColor;
}

final lightTheme = MyTheme(
  mainColor: const Color(0xFF7BD3EA),
  containerColor: const Color(0xFFA1EEBD),
  backgroundColor: const Color(0xFFFCFCFC),
  textColor: Colors.black,
);

final darkTheme = MyTheme(
  mainColor: const Color(0xFF7BD3EA),
  containerColor: const Color(0xFF007F73),
  backgroundColor: const Color(0xFF2C2C2C),
  textColor: Colors.white,
);
