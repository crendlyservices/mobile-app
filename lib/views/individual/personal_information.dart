import 'package:crendly/style/style.dart';
import 'package:crendly/views/individual/email_address.dart';
import 'package:crendly/widgets/onboarding_navigation.dart';
import 'package:crendly/widgets/textfield_input.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_elevated_button.dart';

class PersonalInformationView extends StatefulWidget {
  const PersonalInformationView({Key? key}) : super(key: key);

  @override
  _PersonalInformationViewState createState() =>
      _PersonalInformationViewState();
}

class _PersonalInformationViewState extends State<PersonalInformationView> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const OnboardingNavigation(
              text: 'Your Personal Information',
              value: 0.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 32),
              child: Column(
                children: [
                  const Text(
                    'Please confirm the information filled below is correct',
                    style: smallText,
                  ),
                  const SizedBox(
                    height: 46,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 164,
                        child: TextFieldInput(
                            textEditingController: _firstNameController,
                            label: 'First Name',
                            hintText: 'David',
                            textInputType: TextInputType.name),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        width: 164,
                        child: TextFieldInput(
                            textEditingController: _lastNameController,
                            label: 'Last Name',
                            hintText: 'Emmanuel',
                            textInputType: TextInputType.name),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  TextFieldInput(
                      textEditingController: _genderController,
                      label: 'Gender',
                      hintText: 'Male',
                      textInputType: TextInputType.name),
                  const SizedBox(
                    height: 23,
                  ),
                  TextFieldInput(
                      textEditingController: _dobController,
                      label: 'Date of birth',
                      hintText: '05/08/1994',
                      suffixIcon: const Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.white,
                      ),
                      textInputType: TextInputType.datetime),
                  const SizedBox(
                    height: 23,
                  ),
                  TextFieldInput(
                      textEditingController: _emailController,
                      label: 'Email',
                      hintText: 'myemail@email.com',
                      textInputType: TextInputType.emailAddress),
                  const SizedBox(
                    height: 74,
                  ),
                  CustomELevatedButton(
                      text: 'My info is correct',
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const EmailAddressView()));
                      }),
                  const SizedBox(
                    height: 29,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'My info is not correct',
                      style: skipText,
                    ),
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
