import 'package:crendly/screens/individual/personal_information.dart';
import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/custom_elevated_button.dart';
import 'package:crendly/widgets/textfield_input.dart';
import 'package:crendly/widgets/top_navigation.dart';
import 'package:flutter/material.dart';

class DOBScreen extends StatefulWidget {
  const DOBScreen({Key? key}) : super(key: key);

  @override
  _DOBScreenState createState() => _DOBScreenState();
}

class _DOBScreenState extends State<DOBScreen> {
  final _dobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopNavigation(
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
                      icon: const Icon(
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
                            builder: (context) => const PersonalInformation()));
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
