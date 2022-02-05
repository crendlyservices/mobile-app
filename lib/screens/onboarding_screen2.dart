import 'package:crendly/widgets/carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'onboarding_screen3.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CarouselPage(
        image: 'assets/images/onboard(2).svg',
        firstText: 'We turn up ',
        secondText: 'safety',
        thirdText:
            'You worked hard for your money.Crendly makes it come back with you for more');
  }
}
