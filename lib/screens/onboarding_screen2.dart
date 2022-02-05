import 'package:crendly/widgets/carousel.dart';
import 'package:flutter/material.dart';

import 'onboarding_screen3.dart';


class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({Key? key }) : super(key: key);
  final image = 'assets/images/Layer_1-2.svg';
  @override
  Widget build(BuildContext context) {
    return const CarouselPage(firstText: 'We turn up ', secondText: 'safety', thirdText: 'You worked hard for your money.Crendly makes it come back with you for more', fourthText:'Back', nextScreen: OnboardingScreen3());
  }
}
