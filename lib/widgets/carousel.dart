import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarouselPage extends StatelessWidget {
  final String image;
  final String firstText;
  final String secondText;
  final String thirdText;

  const CarouselPage(
      {Key? key,
      required this.image,
      required this.firstText,
      required this.secondText,
      required this.thirdText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.only(top: 99),
        child: SvgPicture.asset(
          image,
          width: 281.85,
          height: 350,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 99, left: 30, right: 162),
        width: 198,
        height: 60,
        child: RichText(
          text: TextSpan(
              text: firstText,
              style: const TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.078),
              children: [TextSpan(text: secondText)]),
        ),
      ),
      Container(
          width: 257,
          height: 53,
          margin: const EdgeInsets.only(top: 8, left: 30, right: 103),
          child: Text(thirdText,
              style: const TextStyle(
                  color: Color(0xffFFFFFF),
                  letterSpacing: -0.078,
                  fontSize: 16,
                  fontWeight: FontWeight.bold))),
    ]);
  }
}
