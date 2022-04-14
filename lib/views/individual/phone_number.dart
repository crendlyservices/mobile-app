import 'package:crendly/style/style.dart';
import 'package:crendly/views/individual/personal_information.dart';
import 'package:crendly/widgets/onboarding_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/custom_elevated_button.dart';
import '../../widgets/textfield_input.dart';

class PhoneNumberView extends StatefulWidget {
  const PhoneNumberView({Key? key}) : super(key: key);

  @override
  _PhoneNumberViewState createState() => _PhoneNumberViewState();
}

class _PhoneNumberViewState extends State<PhoneNumberView> {
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const OnboardingNavigation(
              text: 'Phone Number',
              value: 0.3,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32, left: 24, right: 24),
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  TextFieldInput(
                      textEditingController: _phoneNumberController,
                      label: 'Phone number',
                      hintText: 'Phone number',
                      textInputType: TextInputType.number,
                      prefixIcon: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: SvgPicture.asset(
                          'assets/images/flag-for-flag-nigeria-svgrepo-com 1.svg',
                          height: 5,
                          width: 5,
                        ),
                      )),
                  Row(
                    children: const [
                      CircleAvatar(
                        radius: 5,
                        backgroundColor: Color(0xffFED0B7),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(top: 9.0, left: 6),
                          child: Text(
                            'It\'s adviced that you input your phone number as it is on your BVN',
                            style: smallText,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 74,
                  ),
                  CustomELevatedButton(
                      text: 'Next',
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const PersonalInformationView()));
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
