import 'package:crendly/widgets/carousel.dart';
import 'package:flutter/material.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const CarouselPage(
      image: 'assets/images/Layer_1-2.svg',
      firstText: 'A place for ',
      secondText: 'social lending',
      thirdText: 'A Platform where real people can lend money to real people',
      fontSize1: 27,
      fontFamily1: 'KumbhSans',
      textColor1: Color(0xffFFFFFF),
      fontFamily2: 'KumbhSans',
      fontSize2: 27,
      fontWeight1: FontWeight.bold,
      fontWeight2: FontWeight.bold,
      textColor2: Color(0xffFED0B7),
      fontFamily3: 'KumbhSans',
      fontSize3: 16,
      textColor3: Color(0xffFFFFFF),
    );
  }
}
