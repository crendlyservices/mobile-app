import 'package:flutter/material.dart';

// color for the entire app body
const Color backgroundColor = Color(0xff00071F);
const Color iconColor = Color.fromRGBO(254, 208, 183, 1);

// background color for the header in the onboarding/signuo screens
const headerColor = Color(0xff4701E0);
// back  button color for the header in the onboarding/signuo screens
const headerBackColor = Color(0xffB4DDC5);

const backgroundColorLinearProgress = Color(0xff);

const colorLinearProgress = Color(0xff6DE7B4);
// bold subtitle
const boldSubtitle = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'KumbhSans',
    fontSize: 20,
    color: Colors.white);

const regularFont = TextStyle(fontFamily: 'KumbhSans', color: Colors.white);
// for large numbers
const bigNumbers = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'KumbhSans',
    fontSize: 32,
    color: Colors.white);
// normal subtitle
const subtitle =
    TextStyle(fontFamily: 'KumbhSans', fontSize: 20, color: Colors.white);

// bold small text
const boldSmallText = TextStyle(
    fontSize: 16,
    fontFamily: 'KumbhSans',
    fontWeight: FontWeight.bold,
    color: Colors.white);

// small caption
const smallCaption =
    TextStyle(fontFamily: 'KumbhSans', color: Colors.white, fontSize: 10);
// small text
const smallText =
    TextStyle(fontSize: 12, fontFamily: 'KumbhSans', color: Colors.white);

const skipText = TextStyle(
    color: Color(0xff56E77E),
    fontSize: 16,
    fontFamily: 'KumbhSans',
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline);
// TODO: Remove stiepa and sansation fonts
// white color stiepa
const mainTextStyle = TextStyle(
    fontSize: 27,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.078,
    fontFamily: 'Stiepa');

//  white header sansation
const headerTextStyle = TextStyle(
    color: Color(0xffFFFFFF),
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.078,
    fontFamily: 'Sansation');

// The colored text stiepa
const subMainTextStyle =
    TextStyle(color: Color(0xffFED0B7), fontSize: 24, fontFamily: 'Stiepa');

// The colored text sansation
const sansationTextStyle =
    TextStyle(color: Color(0xffFED0B7), fontSize: 16, fontFamily: 'Sansation');

// for the small text with bold font
const subTextStyle = TextStyle(
    color: Color(0xffFFFFFF),
    letterSpacing: -0.078,
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontFamily: 'Sansation');

// for the small text without bold font
const subSmallTextStyle = TextStyle(
    color: Color.fromRGBO(213, 213, 213, 1),
    letterSpacing: -0.078,
    fontSize: 15,
    fontFamily: 'Sansation');

final elevatedButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff6DE7B4)),
  shape: MaterialStateProperty.all<OutlinedBorder>(const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  )),
  minimumSize: MaterialStateProperty.all<Size>(const Size.fromHeight(50)),
);

final inputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.white),
  borderRadius: BorderRadius.circular(10),
);
