import 'package:flutter/material.dart';

const Color backgroundColor = Color(0xff00071F);
const Color iconColor = Color.fromRGBO(254, 208, 183, 1);

const mainTextStyle = TextStyle(
    fontSize: 27,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.078,
    fontFamily: 'Stiepa');

//  white header
const headerTextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.078,
    fontFamily: 'Sansation');

// The colored text
const subMainTextStyle =
    TextStyle(color: Color(0xffFED0B7), fontSize: 24, fontFamily: 'Stiepa');

// for the small text
const subTextStyle = TextStyle(
    color: Color(0xffFFFFFF),
    letterSpacing: -0.078,
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Sansation');

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

final inputBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: Color(0xffFFFFFF)),
  borderRadius: BorderRadius.circular(10),
);
