import 'package:crendly/controller/update_user_profile.dart';
import 'package:crendly/widgets/custom_elevated_button.dart';
import 'package:crendly/widgets/onboarding_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../style/style.dart';

class MaritalStatusView extends StatefulWidget {
  const MaritalStatusView({Key? key}) : super(key: key);

  @override
  _MaritalStatusViewState createState() => _MaritalStatusViewState();
}

class _MaritalStatusViewState extends State<MaritalStatusView> {
  final _controller = Get.find<UpdateUserProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          const OnboardingNavigation(
            text: 'Marital Status',
            value: 0.2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 27, left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'What is your marital status?',
                  style: regularFont,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        String single = 'Single';
                        _controller.maritalStatus = single;
                      },
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: const Color(0xff4701E0))),
                        child: const Center(
                          child: Text(
                            'Single',
                            style: regularFont,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    InkWell(
                      onTap: () {
                        String married = 'Married';
                        _controller.maritalStatus = married;
                      },
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: const Color(0xff4701E0))),
                        child: const Center(
                          child: Text(
                            'Married',
                            style: regularFont,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    InkWell(
                      onTap: () {
                        String divorced = 'Divorced';
                        _controller.maritalStatus = divorced;
                      },
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: const Color(0xff4701E0))),
                        child: const Center(
                          child: Text(
                            'Divorced',
                            style: regularFont,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        String seperated = 'Seperated';
                        _controller.maritalStatus = seperated;
                      },
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: const Color(0xff4701E0))),
                        child: const Center(
                          child: Text(
                            'Seperated',
                            style: regularFont,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    InkWell(
                      onTap: () {
                        String widowed = 'Widowed';
                        _controller.maritalStatus = widowed;
                      },
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: const Color(0xff4701E0))),
                        child: const Center(
                          child: Text(
                            'Widowed',
                            style: regularFont,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomELevatedButton(
                    text: 'Next',
                    onPressed: () {
                      Get.toNamed('/educational_background');
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
