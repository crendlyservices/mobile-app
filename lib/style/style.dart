import 'package:flutter/material.dart';

// color for the entire app body
const Color backgroundColor = Color(0xff00071F);
const Color iconColor = Color.fromRGBO(254, 208, 183, 1);

// background color for the header in the onboarding/signup screens
const headerColor = Color(0xff4701E0);
// back  button color for the header in the onboarding/signuo screens
const headerBackColor = Color(0xffB4DDC5);

const colorLinearProgress = Color(0xff6DE7B4);
// bold subtitle
const boldSubtitle = TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: 'KumbhSans',
    fontSize: 20,
    color: Colors.white);

const regularFont = TextStyle(fontFamily: 'KumbhSans', color: Colors.white);

const regularBoldFont = TextStyle(
    fontFamily: 'KumbhSans', fontWeight: FontWeight.bold, color: Colors.white);
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
  borderSide: const BorderSide(color: Colors.white),
  borderRadius: BorderRadius.circular(10),
);
