import 'package:crendly/style/style.dart';
import 'package:crendly/views/individual/phone_number.dart';
import 'package:crendly/widgets/custom_elevated_button.dart';
import 'package:crendly/widgets/onboarding_navigation.dart';
import 'package:flutter/material.dart';

class MaritalStatusView extends StatefulWidget {
  const MaritalStatusView({Key? key}) : super(key: key);

  @override
  _MaritalStatusViewState createState() => _MaritalStatusViewState();
}

class _MaritalStatusViewState extends State<MaritalStatusView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const OnboardingNavigation(
              text: 'Marital Status',
              value: 0.2,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 27, left: 24, right: 24),
              child: Column(
                children: [
                  const Text(
                    'What is your marital status',
                    style: regularFont,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all()),
                        child: const Text(
                          'Single',
                          style: regularFont,
                        ),
                      )
                    ],
                  ),
                  CustomELevatedButton(
                      text: 'Next',
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const PhoneNumberView()));
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
