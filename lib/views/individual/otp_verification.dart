import 'package:crendly/controller/otp_verification.dart';
import 'package:crendly/resources/color_manager.dart';
import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/update_user_profile.dart';
import '../../widgets/onboarding_navigation.dart';

class OtpVerificationView extends StatefulWidget {
  const OtpVerificationView({Key? key}) : super(key: key);

  @override
  _OtpVerificationViewState createState() => _OtpVerificationViewState();
}

class _OtpVerificationViewState extends State<OtpVerificationView> {
  final _otpController = Get.find<OtpVerificationController>();
  final _updateUserProfileController = Get.find<UpdateUserProfileController>();

  bool isLoading = false;
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
        Obx(
          () => _otpController.isLoading.value
              ? loadingScreen()
              : Padding(
                  padding: const EdgeInsets.only(top: 32, left: 12, right: 12),
                  child: Column(
                    children: [
                      RichText(
                          text: TextSpan(
                              text:
                                  'Enter verification code sent to your phone number ',
                              children: [
                            TextSpan(
                                text: _updateUserProfileController.phoneNumber,
                                style: const TextStyle(color: lightOrange))
                          ])),
                      const SizedBox(
                        height: 59,
                      ),
                      OtpTextField(
                        numberOfFields: 6,
                        borderRadius: BorderRadius.circular(10.0),
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
                          setState(() {
                            isLoading = true;
                            _otpController.verifyOtp(verificationCode);
                          });
                          Future.delayed(const Duration(seconds: 3), () {
                            setState(() {
                              isLoading = false;
                            });
                          });
                          //  Get.toNamed('/personal_info');
                        }, // end onSubmit
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                          text: const TextSpan(
                              text: 'Code will resend in ',
                              style: smallText,
                              children: [
                            TextSpan(
                              text: '00:20',
                              style: TextStyle(
                                  fontFamily: "KumbhSans",
                                  color: ColorManager.lightOrange,
                                  fontSize: 14),
                            )
                          ])),
                      const SizedBox(
                        height: 71,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Didn\'t get the code? ',
                            style: smallText,
                          ),
                          Text(
                            'Resend Code',
                            style: skipSmallText,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
        )
      ])),
    );
  }
}
