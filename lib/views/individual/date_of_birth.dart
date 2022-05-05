import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/custom_elevated_button.dart';
import 'package:crendly/widgets/onboarding_navigation.dart';
import 'package:crendly/widgets/textfield_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/update_user_profile.dart';
import '../../controller/verify_bvn.dart';

class DOBView extends StatefulWidget {
  const DOBView({Key? key}) : super(key: key);

  @override
  _DOBViewState createState() => _DOBViewState();
}

class _DOBViewState extends State<DOBView> {
  final _verifyBvnController = Get.find<VerifyBvnController>();
  final _updateUserProfileController = Get.find<UpdateUserProfileController>();
  String dropdownValue = 'None';

  // List of items in our dropdown menu
  var items = ['None', 'Male', 'Female'];
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  TextFieldInput(
                    textEditingController: _verifyBvnController.dobController,
                    label: 'Date of birth',
                    hintText: 'DD/MM/YY',
                    suffixIcon: const Icon(
                      Icons.calendar_today_outlined,
                      color: Color(0xffFFFFFF),
                    ),
                    textInputType: TextInputType.number,
                    onChanged: (value) {
                      _verifyBvnController.dob = value;
                    },
                  ),
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
                    height: 11,
                  ),
                  const Text(
                    'Gender',
                    style: regularBoldFont,
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    width: 150,
                    child: DropdownButton(
                      dropdownColor: backgroundColor,
                      hint: const Text(
                        'Gender',
                        style: smallText,
                      ),
                      style: regularFont,
                      borderRadius: BorderRadius.circular(6),
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                            value: items, child: Text(items));
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                          _updateUserProfileController.gender = dropdownValue;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 74,
                  ),
                  CustomELevatedButton(
                      text: 'Next',
                      onPressed: () {
                        Get.toNamed('/phoneNumber');
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
