import 'package:flutter/material.dart';

class AppTextStyle {
  static Function sofiaProRegular = ({required Color color, required double size}) =>
      _sofiaPro(color, size, FontWeight.w400);

  static Function sofiaProMedium = ({required Color color, required double size}) =>
      _sofiaPro(color, size, FontWeight.w500);

  static Function sofiaProBold = ({required Color color, required double size}) =>
      _sofiaPro(color, size, FontWeight.w700);

  // static Function latoRegular = ({required Color color, required double size}) =>
  //     _lato(color, size, FontWeight.w400);

  static TextStyle _sofiaPro(Color color, double size, FontWeight fontWeight) {
    return _textStyle("SofiaPro", color, size, fontWeight);
  }}

 TextStyle _textStyle(
      String fontFamily, Color color, double size, FontWeight fontWeight) {
    return TextStyle(
        fontFamily: fontFamily,
        color: color,
        fontSize: size,
        fontWeight: fontWeight);
  }