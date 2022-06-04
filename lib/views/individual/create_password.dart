import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/onboarding_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../resources/color_manager.dart';

class CreatePassWordView extends StatefulWidget {
  const CreatePassWordView({Key? key}) : super(key: key);

  @override
  _CreatePassWordViewState createState() => _CreatePassWordViewState();
}

class _CreatePassWordViewState extends State<CreatePassWordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.backgroundColor,
        body: Column(children: [
          const OnboardingNavigation(
            text: "Finally, create a password",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create a 6 - digit password to login to crendly',
                  style: regularFont,
                ),
                const SizedBox(
                  height: 49,
                ),
                OtpTextField(
                  numberOfFields: 6,
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
                    // setState(() {
                    //   isLoading = true;
                    //   _otpController.verifyOtp(verificationCode);
                    // });
                    Future.delayed(const Duration(seconds: 3), () {
                      setState(() {
                        //isLoading = false;
                      });
                    });
                  }, // end onSubmit
                ),
              ],
            ),
          )
        ]));
  }
}
