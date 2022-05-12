import 'package:crendly/controller/update_user_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../style/style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/onboarding_navigation.dart';

class EducationalBackgroundView extends StatefulWidget {
  const EducationalBackgroundView({Key? key}) : super(key: key);

  @override
  _EducationalBackgroundViewState createState() =>
      _EducationalBackgroundViewState();
}

class _EducationalBackgroundViewState extends State<EducationalBackgroundView> {
  // Initial Selected Value
  String dropdownValue = 'None';
  final _controller = Get.find<UpdateUserProfileController>();
  // List of items in our dropdown menu
  var items = [
    'None',
    'Primary Education',
    'Secondary Education',
    'Bachelor\'s degree',
    'Bachelors + Professional Qualification',
    'Maters Degree/PHD',
    'Vocational Training'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          const OnboardingNavigation(
            text: 'Educational Background',
            value: 0.2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 27, left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'What is your educational background?',
                  style: regularFont,
                ),
                DropdownButton(
                  dropdownColor: backgroundColor,
                  hint: const Text(
                    'Qualification',
                    style: smallText,
                  ),
                  style: regularFont,
                  borderRadius: BorderRadius.circular(6),
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(value: items, child: Text(items));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      _controller.educationalQualification = dropdownValue;
                    });
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomELevatedButton(
                    text: 'Next',
                    onPressed: () {
                      _controller.updateUserProfile();
                      Get.toNamed('/employment_status');
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
