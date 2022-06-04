import 'package:crendly/controller/employee_details.dart';
import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/custom_elevated_button.dart';
import 'package:crendly/widgets/textfield_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/onboarding_navigation.dart';

class EmployedView extends StatefulWidget {
  const EmployedView({Key? key}) : super(key: key);

  @override
  _EmployedViewState createState() => _EmployedViewState();
}

class _EmployedViewState extends State<EmployedView> {
  final _employeeDetailsController = Get.find<EmployeeDetailsController>();
  String employmentDropdownValue = "Employment type";

  var employmentTypeItems = ["Employment type", "Full-Time", "Contract"];

  String salaryDropdownValue = "Salary Range";

  var salaryRangeItems = [
    "Salary Range",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const OnboardingNavigation(
              text: "Employed",
              value: 0.2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldInput(
                    textEditingController:
                        _employeeDetailsController.employerNameController,
                    label: 'What is your employer\'s name?',
                    hintText: 'Company name',
                    textInputType: TextInputType.text,
                    onChanged: (String newValue) {
                      _employeeDetailsController.employer = newValue;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
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
                  TextFieldInput(
                    textEditingController:
                        _employeeDetailsController.positionController,
                    label: 'What is your position at the company?',
                    hintText: 'Your position',
                    textInputType: TextInputType.text,
                    onChanged: (String newValue) {
                      _employeeDetailsController.position = newValue;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "What is your type of employment?",
                    style: regularFont,
                  ),
                  SizedBox(
                    width: 300,
                    child: DropdownButton(
                      dropdownColor: backgroundColor,
                      hint: const Text(
                        'Employment type',
                        style: smallText,
                      ),
                      style: regularFont,
                      borderRadius: BorderRadius.circular(6),
                      value: employmentDropdownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      items: employmentTypeItems.map((String items) {
                        return DropdownMenuItem(
                            value: items, child: Text(items));
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          employmentDropdownValue = newValue!;
                          _employeeDetailsController.employmentType = newValue;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "What is your Salary range?",
                    style: regularFont,
                  ),
                  SizedBox(
                    width: 300,
                    child: DropdownButton(
                      dropdownColor: backgroundColor,
                      hint: const Text(
                        'Salary range',
                        style: smallText,
                      ),
                      style: regularFont,
                      borderRadius: BorderRadius.circular(6),
                      value: salaryDropdownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      items: salaryRangeItems.map((String items) {
                        return DropdownMenuItem(
                            value: items, child: Text(items));
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          salaryDropdownValue = newValue!;
                          _employeeDetailsController.salaryOrIncomeRange =
                              newValue;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
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
                              color:
                                  politicallyExposed ? highlightedButton : null,
                              border:
                                  Border.all(color: const Color(0xff4701E0)),
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
                              border:
                                  Border.all(color: const Color(0xff4701E0)),
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
                        _employeeDetailsController.employmentStatus =
                            "Employed";
                        _employeeDetailsController.employeeDetails();
                        //Get.toNamed('/means_of_identification');
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
