import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CarouselPage extends StatelessWidget {
  final String image;
  final String firstText;
  final String secondText;
  final String thirdText;
  final String fontFamily1;
  final Color textColor1;
  final double fontSize1;
  final FontWeight? fontWeight1;
  final String fontFamily2;
  final Color textColor2;
  final double fontSize2;
  final FontWeight? fontWeight2;
  final String fontFamily3;
  final Color textColor3;
  final double fontSize3;
  final FontWeight? fontWeight3;
  const CarouselPage(
      {Key? key,
      required this.image,
      required this.firstText,
      required this.secondText,
      required this.thirdText,
      required this.fontFamily1,
      required this.textColor1,
      required this.fontSize1,
      this.fontWeight1,
      required this.fontFamily2,
      required this.textColor2,
      required this.fontSize2,
      this.fontWeight2,
      required this.fontFamily3,
      required this.textColor3,
      required this.fontSize3,
      this.fontWeight3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: const EdgeInsets.only(top: 90),
        child: SvgPicture.asset(
          image,
          width: 281.85,
          height: 350,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 80, left: 30, right: 162),
        width: 250,
        height: 60,
        child: RichText(
          text: TextSpan(
              text: firstText,
              style: TextStyle(
                  fontFamily: fontFamily1,
                  color: textColor1,
                  fontSize: fontSize1,
                  fontWeight: fontWeight1),
              children: [
                TextSpan(
                  text: secondText,
                  style: TextStyle(
                      fontFamily: fontFamily2,
                      color: textColor2,
                      fontSize: fontSize2,
                      fontWeight: fontWeight2),
                )
              ]),
        ),
      ),
      Container(
          width: 257,
          height: 53,
          margin: const EdgeInsets.only(top: 8, left: 30, right: 103),
          child: Text(
            thirdText,
            style: TextStyle(
                fontFamily: fontFamily3,
                color: textColor3,
                fontSize: fontSize3,
                fontWeight: fontWeight3),
          )),
    ]);
  }
}
