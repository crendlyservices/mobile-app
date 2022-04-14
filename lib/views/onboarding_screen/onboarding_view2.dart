import 'package:crendly/widgets/carousel.dart';
import 'package:flutter/material.dart';

class OnboardingView2 extends StatelessWidget {
  const OnboardingView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CarouselPage(
      image: 'assets/images/onboard(2).svg',
      firstText: 'We turn up ',
      secondText: 'safety',
      thirdText:
          'You worked hard for your money.Crendly makes it come back with you for more',
      fontSize1: 27,
      fontFamily1: 'StiepaSerif',
      textColor1: Color(0xffFFFFFF),
      fontFamily2: 'StiepaSerif',
      fontSize2: 27,
      textColor2: Color(0xffFED0B7),
      fontFamily3: 'Sansation',
      fontSize3: 15,
      textColor3: Color(0xffFFFFFF),
    );
  }
}
