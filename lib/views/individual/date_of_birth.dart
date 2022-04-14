import 'package:crendly/style/style.dart';
import 'package:crendly/views/individual/phone_number.dart';
import 'package:crendly/widgets/custom_elevated_button.dart';
import 'package:crendly/widgets/onboarding_navigation.dart';
import 'package:crendly/widgets/textfield_input.dart';
import 'package:flutter/material.dart';

class DOBView extends StatefulWidget {
  const DOBView({Key? key}) : super(key: key);

  @override
  _DOBViewState createState() => _DOBViewState();
}

class _DOBViewState extends State<DOBView> {
  final _dobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const OnboardingNavigation(
              text: 'Date of Birth',
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
                      textEditingController: _dobController,
                      label: 'Date of birth',
                      hintText: 'DD/MM/YY',
                      suffixIcon: const Icon(
                        Icons.calendar_today_outlined,
                        color: Color(0xffFFFFFF),
                      ),
                      textInputType: TextInputType.number),
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
                            'It\'s adviced that you input your date of birth as it is on your BVN',
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