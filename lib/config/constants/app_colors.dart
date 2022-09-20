import 'package:flutter/material.dart';

abstract class AppColors {
  const AppColors._();

  // static const Color accentLight = Color(0xFF6A3EA1);

  static PrimaryColor primaryColor = PrimaryColor();
  static SecondaryColor secondaryColor = SecondaryColor();
  static NeutralColor neutralColor = NeutralColor();
  static SuccessColor successColor = SuccessColor();
  static ErrorColor errorColor = ErrorColor();
  static WaringColors waringColors = WaringColors();
}

class PrimaryColor extends ColorSwatch<String> {
  PrimaryColor()
      : super(
          0xFF6A3EA1,
          <String, Color>{
            "base": const Color(0xFF6A3EA1),
            "dark": const Color(0xFF3A2258),
            "light": const Color(0xFFEFE9F7),
            "background": const Color(0xFFFAF8FC),
          },
        );

  Color get base => this["base"]!;

  Color get dark => this["dark"]!;

  Color get light => this["light"]!;

  Color get background => this["background"]!;
}

class SecondaryColor extends ColorSwatch<String> {
  SecondaryColor()
      : super(
          0xFFDEDC52,
          <String, Color>{
            "base": const Color(0xFFDEDC52),
            "dark": const Color(0xFF565510),
            "light": const Color(0xFFF7F6D4),
          },
        );

  Color get base => this["base"]!;

  Color get dark => this["dark"]!;

  Color get light => this["light"]!;
}

class NeutralColor extends ColorSwatch<String> {
  NeutralColor()
      : super(
          0xFF180E25,
          <String, Color>{
            "black": const Color(0xFF180E25),
            "dark_grey": const Color(0xFF827D89),
            "base_grey": const Color(0xFFC8C5CB),
            "light_grey": const Color(0xFFEFEEF0),
            "white": const Color(0xFFFFFFFF),
          },
        );

  Color get black => this["black"]!;

  Color get darkGrey => this["dark_grey"]!;

  Color get baseGrey => this["base_grey"]!;

  Color get lightGrey => this["light_grey"]!;

  Color get white => this["white"]!;
}

class SuccessColor extends ColorSwatch<String> {
  SuccessColor()
      : super(
          0xFF60D889,
          <String, Color>{
            "base": const Color(0xFF60D889),
            "dark": const Color(0xFF1F7F40),
            "light": const Color(0xFFDAF6E4),
          },
        );

  Color get base => this["base"]!;

  Color get dark => this["dark"]!;

  Color get light => this["light"]!;
}

class ErrorColor extends ColorSwatch<String> {
  ErrorColor()
      : super(
          0xFFCE3A54,
          <String, Color>{
            "base": const Color(0xFFCE3A54),
            "dark": const Color(0xFF5A1623),
            "light": const Color(0xFFF7DEE3),
          },
        );

  Color get base => this["base"]!;

  Color get dark => this["dark"]!;

  Color get light => this["light"]!;
}

class WaringColors extends ColorSwatch<String> {
  WaringColors()
      : super(
          0xFFF8C715,
          <String, Color>{
            "base": const Color(0xFFF8C715),
            "dark": const Color(0xFF725A03),
            "light": const Color(0xFFFDEBAB),
          },
        );

  Color get base => this["base"]!;

  Color get dark => this["dark"]!;

  Color get light => this["light"]!;
}

final List<Color> colorPickerList = [
  AppColors.neutralColor.white,
  AppColors.errorColor.light,
  AppColors.primaryColor.light,
  AppColors.successColor.light,
  AppColors.waringColors.light,
  AppColors.secondaryColor.light,
  AppColors.neutralColor.lightGrey,
];