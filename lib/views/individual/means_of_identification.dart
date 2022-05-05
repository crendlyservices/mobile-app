import 'package:crendly/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../style/style.dart';
import '../../widgets/onboarding_navigation.dart';

class MeansOfIdentificationView extends StatefulWidget {
  const MeansOfIdentificationView({Key? key}) : super(key: key);

  @override
  _MeansOfIdentificationViewState createState() =>
      _MeansOfIdentificationViewState();
}

class _MeansOfIdentificationViewState extends State<MeansOfIdentificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            const OnboardingNavigation(
              value: 0.3,
              text: 'Means of Identification',
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 35.0, vertical: 32),
              child: Column(
                children: [
                  SvgPicture.asset('assets/images/id.svg'),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Let\'s be sure you\'re human',
                    style: boldSubtitle,
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  const Text(
                    'Please prepare one of the following documents',
                    style: regularFont,
                  ),
                  Row(
                    children: const [
                      Text(
                        'Passport .',
                        style: regularBoldFont,
                      ),
                      Text(
                        'Driver\'s license .',
                        style: regularBoldFont,
                      ),
                      Text(
                        'NIN .',
                        style: regularBoldFont,
                      ),
                      Text(
                        'Voter\'s card',
                        style: regularBoldFont,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 124,
                  ),
                  CustomELevatedButton(
                      text: 'Continue',
                      onPressed: () {
                        Get.toNamed('/select_id_card');
                      }),
                  const SizedBox(
                    height: 71,
                  ),
                  const Text(
                    'Don\'t have it on me right now',
                    style: skipText,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
