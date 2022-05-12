import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/onboarding_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/employee_details.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/textfield_input.dart';

class SelfEmployedView extends StatefulWidget {
  const SelfEmployedView({Key? key}) : super(key: key);

  @override
  _SelfEmployedViewState createState() => _SelfEmployedViewState();
}

class _SelfEmployedViewState extends State<SelfEmployedView> {
  final _employeeDetailsController = Get.find<EmployeeDetailsController>();
  String monthlyIncomeDropdownValue = "Income Range";

  var monthlyIncomeRangeItems = [
    "Income Range",
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 32),
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
                SizedBox(
                  width: 300,
                  child: DropdownButton(
                    dropdownColor: backgroundColor,
                    hint: const Text(
                      'Monthly Income range',
                      style: smallText,
                    ),
                    style: regularFont,
                    borderRadius: BorderRadius.circular(6),
                    value: monthlyIncomeDropdownValue,
                    icon: const Icon(Icons.arrow_drop_down),
                    items: monthlyIncomeRangeItems.map((String items) {
                      return DropdownMenuItem(value: items, child: Text(items));
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        monthlyIncomeDropdownValue = newValue!;
                        _employeeDetailsController.salaryOrIncomeRange =
                            monthlyIncomeDropdownValue;
                      });
                    },
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
                          politicallyExposed = false;
                        });
                        setPoliticallyExposed();
                      },
                      child: Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                            color:
                                politicallyExposed ? highlightedButton : null,
                            border: Border.all(color: const Color(0xff4701E0)),
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
                            color:
                                !politicallyExposed ? highlightedButton : null,
                            border: Border.all(color: const Color(0xff4701E0)),
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
                  height: 60,
                ),
                CustomELevatedButton(
                    text: "Next",
                    onPressed: () {
                      Get.toNamed('/means_of_identification');
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
