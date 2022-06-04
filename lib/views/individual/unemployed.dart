import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/onboarding_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/employee_details.dart';
import '../../widgets/custom_elevated_button.dart';

class UnemployedView extends StatefulWidget {
  const UnemployedView({Key? key}) : super(key: key);

  @override
  _UnemployedViewState createState() => _UnemployedViewState();
}

class _UnemployedViewState extends State<UnemployedView> {
  final _employeeDetailsController = Get.find<EmployeeDetailsController>();
  bool politicallyExposed = false;
  bool isLoading = false;
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
          isLoading
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'This would take a second',
                        style: smallText,
                      ),
                      CircularProgressIndicator(
                        color: lightOrange,
                        strokeWidth: 10,
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 21, vertical: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                            setState(() {
                              isLoading = true;
                              _employeeDetailsController.employmentStatus =
                                  "Unemployed";
                              _employeeDetailsController.employeeDetails();
                            });
                            Future.delayed(const Duration(seconds: 5), () {
                              setState(() {
                                isLoading = false;
                              });
                            });
                          })
                    ],
                  ),
                )
        ],
      ),
    );
  }
}
