import 'package:crendly/widgets/carousel.dart';
import 'package:flutter/material.dart';

class OnboardingView1 extends StatelessWidget {
  const OnboardingView1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const CarouselPage(
      image: 'assets/images/Layer_1-2.svg',
      firstText: 'A place for ',
      secondText: 'social lending',
      thirdText: 'A Platform where real people can lend money to real people',
    );
  }
}
