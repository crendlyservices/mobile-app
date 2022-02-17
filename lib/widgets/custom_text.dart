import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final String fontFamily;
  final Color textColor;
  final double fontSize;
  final FontWeight? fontWeight;
  const CustomText(
      {Key? key,
      required this.text,
      required this.fontFamily,
      required this.textColor,
      required this.fontSize,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: fontFamily,
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
  }
}
