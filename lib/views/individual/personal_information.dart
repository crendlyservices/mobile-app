import 'package:crendly/controller/update_user_profile.dart';
import 'package:crendly/widgets/custom_elevated_button.dart';
import 'package:crendly/widgets/onboarding_navigation.dart';
import 'package:crendly/widgets/textfield_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../style/style.dart';

class PersonalInformationView extends StatelessWidget {
  PersonalInformationView({Key? key}) : super(key: key);

  final _updateUserProfileController = Get.find<UpdateUserProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const OnboardingNavigation(
              text: "Your Personal Information",
              value: 0.3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 32),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Please confirm your personal information below is correct',
                    style: regularFont,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 164,
                        child: TextFieldInput(
                          label: "First Name",
                          hintText: _updateUserProfileController.firstName,
                          textInputType: TextInputType.text,
                          enabled: false,
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                      SizedBox(
                        width: 164,
                        child: TextFieldInput(
                          label: "Last Name",
                          hintText: _updateUserProfileController.lastName,
                          textInputType: TextInputType.text,
                          enabled: false,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFieldInput(
                    label: 'Gender',
                    hintText: _updateUserProfileController.gender,
                    textInputType: TextInputType.text,
                    enabled: false,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFieldInput(
                    label: 'Date of birth',
                    hintText: _updateUserProfileController.dob,
                    suffixIcon: const Icon(
                      Icons.calendar_today_outlined,
                      color: Color(0xffFFFFFF),
                    ),
                    textInputType: TextInputType.number,
                    enabled: false,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  CustomELevatedButton(
                      text: 'My info is correct',
                      onPressed: () {
                        Get.toNamed('/email_address');
                      }),
                  const SizedBox(
                    height: 29,
                  ),
                  const Text(
                    'My info is not correct',
                    style: skipText,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
