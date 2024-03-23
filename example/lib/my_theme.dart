import 'package:color_theme_provider/color_theme_provider.dart';
import 'package:flutter/material.dart';

abstract class MyTheme implements ColorTheme {
  Color get mainColor;
  Color get containerColor;
  Color get backgroundColor;
  Color get textColor;
}

final class LightMyTheme implements MyTheme {
  @override
  final Color mainColor = const Color(0xFF7BD3EA);

  @override
  final Color containerColor = const Color(0xFFA1EEBD);

  @override
  final Color backgroundColor = const Color(0xFFFCFCFC);

  @override
  final Color textColor = Colors.black;
}

final class DarkMyTheme implements MyTheme {
  @override
  final Color mainColor = const Color(0xFF7BD3EA);

  @override
  final Color containerColor = const Color(0xFF007F73);

  @override
  final Color backgroundColor = const Color(0xFF2C2C2C);

  @override
  final Color textColor = Colors.white;
}
