import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../style/style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/onboarding_navigation.dart';

class EmploymentStatusView extends StatefulWidget {
  const EmploymentStatusView({Key? key}) : super(key: key);

  @override
  _EmploymentStatusViewState createState() => _EmploymentStatusViewState();
}

class _EmploymentStatusViewState extends State<EmploymentStatusView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          const OnboardingNavigation(
            text: 'Employment Status',
            value: 0.2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 27, left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'What is your employment status?',
                  style: regularFont,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff4701E0)),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text(
                      'Employed',
                      style: smallText,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff4701E0)),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text(
                      'Self-Employed',
                      style: smallText,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff4701E0)),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text(
                      'Unemployed',
                      style: smallText,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomELevatedButton(
                    text: 'Next',
                    onPressed: () {
                      Get.toNamed('/means_of_identification');
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
