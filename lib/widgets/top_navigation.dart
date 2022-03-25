import 'package:crendly/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopNavigation extends StatelessWidget {
  final String? text;
  final double? value;
  const TopNavigation({Key? key, this.text, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 198,
      decoration: BoxDecoration(
        color: headerColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          LinearProgressIndicator(
            value: value,
            color: colorLinearProgress,
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: headerBackColor,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 60),
                  width: 184,
                  child: Text(
                    '$text',
                    style: boldSubtitle,
                  ),
                ),
                SvgPicture.asset(
                  'assets/images/face lemon.svg',
                  height: 49,
                  width: 49,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
