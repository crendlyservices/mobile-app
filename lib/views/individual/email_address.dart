import 'package:crendly/controller/update_user_profile.dart';
import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/custom_elevated_button.dart';
import 'package:crendly/widgets/onboarding_navigation.dart';
import 'package:crendly/widgets/textfield_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../resources/color_manager.dart';

class EmailAddressView extends StatefulWidget {
  const EmailAddressView({Key? key}) : super(key: key);

  @override
  _EmailAddressViewState createState() => _EmailAddressViewState();
}

class _EmailAddressViewState extends State<EmailAddressView> {
  final _updateUserProfileController = Get.find<UpdateUserProfileController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const OnboardingNavigation(
              text: 'Your Email Address',
              value: 0.2,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32, left: 24, right: 24),
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  TextFieldInput(
                    textEditingController:
                        _updateUserProfileController.emailController,
                    label: 'Email address',
                    hintText: 'newmail@email.com',
                    textInputType: TextInputType.emailAddress,
                    onChanged: (value) {
                      _updateUserProfileController.email = value;
                    },
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  Row(
                    children: const [
                      CircleAvatar(
                        backgroundColor: ColorManager.lightOrangeWithOpacity,
                        radius: 8,
                        child: CircleAvatar(
                          radius: 5,
                          backgroundColor: Color(0xffFED0B7),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Text(
                            'Please provide a valid email address',
                            style: smallText,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 81,
                  ),
                  CustomELevatedButton(
                      text: 'Next',
                      onPressed: () {
                        Get.toNamed('/marital_status');
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
