import 'package:crendly/screens/individual/phone_number.dart';
import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/textfield_input.dart';
import 'package:crendly/widgets/top_navigation.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_elevated_button.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  _PersonalInformationState createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
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
            const TopNavigation(
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
                      icon: const Icon(Icons.calendar_today_outlined),
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
                      text: 'Next',
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const PhoneNumber()));
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
