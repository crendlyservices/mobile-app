import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../style/style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/onboarding_navigation.dart';

class SelectIdCardView extends StatefulWidget {
  const SelectIdCardView({Key? key}) : super(key: key);

  @override
  _SelectIdCardViewState createState() => _SelectIdCardViewState();
}

class _SelectIdCardViewState extends State<SelectIdCardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const OnboardingNavigation(
                value: 0.3,
                text: 'Select ID card',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 35.0,
                  vertical: 32.0,
                ),
                child: Column(
                  children: [
                    SvgPicture.asset('assets/images/id.svg'),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Choose your preferred ID',
                      style: boldSubtitle,
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    const Text(
                      'Make sure the document includes a picture of your face',
                      style: regularFont,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      child: Container(
                        width: 400,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xff4701E0)),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            'International Passport',
                            style: smallText,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      child: Container(
                        width: 400,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xff4701E0)),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            'Driver\'s license',
                            style: smallText,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      child: Container(
                        width: 400,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xff4701E0)),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            'National ID card ',
                            style: smallText,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      child: Container(
                        width: 400,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xff4701E0)),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            'Voter\'s card',
                            style: smallText,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomELevatedButton(
                        text: 'Next',
                        onPressed: () {
                          Get.toNamed('/upload_id_card');
                        })
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
