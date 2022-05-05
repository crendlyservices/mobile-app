import 'package:crendly/controller/otp_verification.dart';
import 'package:crendly/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/onboarding_navigation.dart';

class OtpVerificationView extends StatelessWidget {
  OtpVerificationView({Key? key}) : super(key: key);

  final _controller = Get.find<OtpVerificationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
          child: Column(children: [
        const OnboardingNavigation(
          text: 'OTP Verification',
          value: 0.1,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32, left: 24, right: 24),
          child: Column(
            children: [
              RichText(
                  text: const TextSpan(
                      text:
                          'Enter verification code sent to your phone number ',
                      children: [
                    TextSpan(
                      text: '081374484848',
                    )
                  ])),
              const SizedBox(
                height: 59,
              ),
              OtpTextField(
                numberOfFields: 4,
                textStyle: const TextStyle(color: Colors.white),
                fieldWidth: 50,
                borderColor: const Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  _controller.verifyOtp(verificationCode);
                  Get.toNamed('/personal_info');
                }, // end onSubmit
              ),
              RichText(
                  text: const TextSpan(text: 'Code will resend in ', children: [
                TextSpan(
                  text: '00:20',
                )
              ])),
              const SizedBox(
                height: 71,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Didn\'t get the code '),
                  Text(
                    'Resend Code',
                    style: skipText,
                  )
                ],
              ),
            ],
          ),
        ),
      ])),
    );
  }
}
