import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/onboarding_navigation.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class UploadIdCardView extends StatefulWidget {
  const UploadIdCardView({Key? key}) : super(key: key);

  @override
  _UploadIdCardViewState createState() => _UploadIdCardViewState();
}

class _UploadIdCardViewState extends State<UploadIdCardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          const OnboardingNavigation(
            text: 'Select ID card',
            value: 0.4,
          ),
          const SizedBox(
            height: 47,
          ),
          SizedBox(
            width: 344,
            height: 267,
            child: DottedBorder(
                child: Column(
              children: [
                SvgPicture.asset('assets/images/id.svg'),
                const SizedBox(
                  height: 35,
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed('/verify_id_card');
                  },
                  child: const Text(
                    'Upload Id card',
                    style: skipText,
                  ),
                )
              ],
            )),
          )
        ],
      ),
    );
  }
}
