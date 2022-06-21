import 'package:crendly/controller/employee_details.dart';
import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/custom_elevated_button.dart';
import 'package:crendly/widgets/loading_screen.dart';
import 'package:crendly/widgets/textfield_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../resources/color_manager.dart';
import '../../widgets/onboarding_navigation.dart';

class EmployedView extends StatefulWidget {
  const EmployedView({Key? key}) : super(key: key);

  @override
  _EmployedViewState createState() => _EmployedViewState();
}

class _EmployedViewState extends State<EmployedView> {
  final _employeeDetailsController = Get.find<EmployeeDetailsController>();
  String? employmentType;

  var employmentTypeItems = ["Full-Time", "Contract"];

  String? salary;

  var salaryRangeItems = [
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
            Obx(() => _employeeDetailsController.isLoading.value
                ? loadingScreen()
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 21, vertical: 24),
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
                        Container(
                          margin: const EdgeInsets.only(top: 9.0),
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                      value: employmentType,
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
                                        'Employment type',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'KumbhSans',
                                            color: ColorManager.lightWhite),
                                      ),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          employmentType = newValue!;
                                          _employeeDetailsController
                                              .employmentType = employmentType!;
                                        });
                                      },
                                      items: employmentTypeItems.map((item) {
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
                          height: 15,
                        ),
                        const Text(
                          "What is your Salary range?",
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
                                      value: employmentType,
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
                                        'Salary Range',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'KumbhSans',
                                            color: ColorManager.lightWhite),
                                      ),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          salary = newValue!;
                                          _employeeDetailsController
                                              .salaryOrIncomeRange = salary!;
                                        });
                                      },
                                      items: employmentTypeItems.map((item) {
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
                  ))
          ],
        ),
      ),
    );
  }
}
