import 'package:flutter/material.dart';

const Color backgroundColor = Color(0xff00071F);

const mainTextStyle =
    TextStyle(fontSize: 27, fontWeight: FontWeight.bold, letterSpacing: -0.078);

const subTextStyle = TextStyle(
    color: Color(0xffFFFFFF),
    letterSpacing: -0.078,
    fontSize: 16,
    fontWeight: FontWeight.bold);

final elevatedButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
  shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  shape: MaterialStateProperty.all<OutlinedBorder>(const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  )),
  minimumSize: MaterialStateProperty.all<Size>(const Size.fromHeight(50)),
);
