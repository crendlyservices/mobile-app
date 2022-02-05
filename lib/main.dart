import 'package:crendly/views/Onboarding/carousel.dart';
import 'package:crendly/views/Onboarding/carousel_start.dart';
import 'package:crendly/views/Onboarding/carousel_start2.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 8.0),
        child: Container(child: CarouselTwo()),
      ),
      color: Colors.black,
    );
  }
}
