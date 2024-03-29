import 'package:crendly/style/style.dart';
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
          height: 300,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 99, left: 30, right: 162),
        width: 198,
        height: 65,
        child: RichText(
          text: TextSpan(
              text: firstText,
              style: const TextStyle(
                  fontFamily: "Kumbh Sans",
                  fontSize: 27,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                  text: secondText,
                  style: const TextStyle(
                      fontFamily: "Kumbh Sans",
                      fontSize: 27,
                      color: lightOrange,
                      fontWeight: FontWeight.bold),
                )
              ]),
        ),
      ),
      Container(
          width: 257,
          height: 53,
          margin: const EdgeInsets.only(top: 8, left: 30, right: 103),
          child: Text(thirdText, style: regularBoldFont)),
    ]);
  }
}
