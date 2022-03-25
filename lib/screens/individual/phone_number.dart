import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/custom_textfield_input.dart';
import 'package:crendly/widgets/top_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/custom_elevated_button.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({Key? key}) : super(key: key);

  @override
  _PhoneNumberState createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  final TextEditingController _phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopNavigation(
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
                  CustomTextFieldInput(
                      textEditingController: _phoneNumberController,
                      label: 'Phone number',
                      hintText: 'Phone number',
                      textInputType: TextInputType.number,
                      prefixIcon: SvgPicture.asset(
                          'assets/images/flag-for-flag-nigeria-svgrepo-com 1.svg')),
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
                  CustomELevatedButton(text: 'Next', onPressed: () {})
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
