import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/loading_screen.dart';
import 'package:crendly/widgets/onboarding_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/employee_details.dart';
import '../../resources/color_manager.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/textfield_input.dart';

class SelfEmployedView extends StatefulWidget {
  const SelfEmployedView({Key? key}) : super(key: key);

  @override
  _SelfEmployedViewState createState() => _SelfEmployedViewState();
}

class _SelfEmployedViewState extends State<SelfEmployedView> {
  final _employeeDetailsController = Get.find<EmployeeDetailsController>();
  String? monthlyIncome;

  var monthlyIncomeRangeItems = [
    "N0-N50,000",
    "N50,000-N200,000",
    "N200,001-N500,000",
    "N500,001,-N1,000,000",
    "N1,000,001 and above"
  ];

  bool politicallyExposed = false;

  void setPoliticallyExposed() {
    _employeeDetailsController.politicallyExposed = politicallyExposed;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          const OnboardingNavigation(
            text: "Employed",
            value: 0.2,
          ),
          Obx(() => _employeeDetailsController.isLoading.value
              ? loadingScreen()
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 21, vertical: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFieldInput(
                        textEditingController:
                            _employeeDetailsController.occupationController,
                        label: 'What is your Occupation?',
                        hintText: 'Your occupation',
                        textInputType: TextInputType.text,
                        onChanged: (String newValue) {
                          _employeeDetailsController.occupation = newValue;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "What is your Monthly Income range?",
                        style: regularFont,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 9.0),
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                    value: monthlyIncome,
                                    iconSize: 30,
                                    dropdownColor: ColorManager.backgroundColor,
                                    iconEnabledColor: Colors.white,
                                    icon: (null),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                    hint: const Text(
                                      'Income Range',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'KumbhSans',
                                          color: ColorManager.lightWhite),
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        monthlyIncome = newValue!;
                                        _employeeDetailsController
                                                .salaryOrIncomeRange =
                                            monthlyIncome!;
                                      });
                                    },
                                    items: monthlyIncomeRangeItems.map((item) {
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
                        height: 50,
                      ),
                      const Text(
                        'Are you politically exposed?',
                        style: regularFont,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                politicallyExposed = true;
                              });
                              setPoliticallyExposed();
                            },
                            child: Container(
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: politicallyExposed
                                      ? highlightedButton
                                      : null,
                                  border: Border.all(
                                      color: const Color(0xff4701E0)),
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Center(
                                child: Text(
                                  'Yes, I am',
                                  style: smallText,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                politicallyExposed = false;
                              });
                              setPoliticallyExposed();
                            },
                            child: Container(
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: !politicallyExposed
                                      ? highlightedButton
                                      : null,
                                  border: Border.all(
                                      color: const Color(0xff4701E0)),
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Center(
                                child: Text(
                                  'No, I am not',
                                  style: smallText,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 200,
                      ),
                      CustomELevatedButton(
                          text: "Next",
                          onPressed: () {
                            _employeeDetailsController.employmentStatus =
                                "Self-Employed";
                            _employeeDetailsController.employeeDetails();
                          })
                    ],
                  ),
                ))
        ],
      ),
    );
  }
}
