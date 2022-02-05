import 'package:crendly/widgets/carousel.dart';
import 'package:flutter/material.dart';

class OnboardingScreen3 extends StatelessWidget {
  const OnboardingScreen3({Key? key}) : super(key: key);
  final image = 'assets/images/Layer_1-2.svg';
  @override
  Widget build(BuildContext context) {
    return const CarouselPage(
        image: 'assets/images/onboard3.svg',
        firstText: 'You\'re in ',
        secondText: 'control',
        thirdText: 'Control your profit on what you lend out');
  }
}
