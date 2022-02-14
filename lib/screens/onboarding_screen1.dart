import 'package:crendly/widgets/carousel.dart';
import 'package:flutter/material.dart';
import 'onboarding_screen2.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({Key? key }) : super(key: key);
  final image = 'assets/images/Layer_1-2.svg';
  @override
  Widget build(BuildContext context) {
    return const CarouselPage( image: 'assets/images/Layer_1-2.svg', firstSizeHeight: , firstSizeWidth: ,firstText: 'A place for ', secondText: 'social lending', thirdText: 'A Platform where real people can lend money to real people', fourthText:'later', nextScreen: OnboardingScreen2());
  }
}
