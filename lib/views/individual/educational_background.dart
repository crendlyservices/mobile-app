import 'package:crendly/controller/update_user_profile.dart';
import 'package:crendly/widgets/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../resources/color_manager.dart';
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
  String? educationalQualification;
  final _controller = Get.find<UpdateUserProfileController>();
  bool isLoading = false;
  // List of items in our dropdown menu
  var qualificationList = [
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
          Obx(
            () => _controller.isLoading.value
                ? loadingScreen()
                : Padding(
                    padding:
                        const EdgeInsets.only(top: 27, left: 24, right: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'What is your educational background?',
                          style: regularFont,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 9.0),
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                      value: educationalQualification,
                                      iconSize: 30,
                                      dropdownColor:
                                          ColorManager.backgroundColor,
                                      iconEnabledColor: Colors.white,
                                      icon: (null),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                      hint: const Text(
                                        'Qualification',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'KumbhSans',
                                            color: ColorManager.lightWhite),
                                      ),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          educationalQualification = newValue!;
                                          _controller.educationalQualification =
                                              educationalQualification!;
                                          print(educationalQualification);
                                        });
                                      },
                                      items: qualificationList.map((item) {
                                        return DropdownMenuItem(
                                          child: Text(item),
                                          value: item.toString(),
                                        );
                                      }).toList()),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 125,
                        ),
                        CustomELevatedButton(
                            text: 'Next',
                            onPressed: () {
                              setState(() {
                                isLoading = true;
                                _controller.updateUserProfile();
                              });
                              Future.delayed(const Duration(seconds: 5), () {
                                setState(() {
                                  isLoading = false;
                                });
                              });
                            })
                      ],
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
