import 'package:crendly/controller/update_user_profile.dart';
import 'package:crendly/widgets/custom_elevated_button.dart';
import 'package:crendly/widgets/onboarding_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../style/style.dart';

class MaritalStatusView extends StatefulWidget {
  const MaritalStatusView({Key? key}) : super(key: key);

  @override
  _MaritalStatusViewState createState() => _MaritalStatusViewState();
}

class _MaritalStatusViewState extends State<MaritalStatusView> {
  final _controller = Get.find<UpdateUserProfileController>();
  String maritalStatus = "";
  String dependent = "None";
  bool dependents = false;
  void setMaritalStatus() {
    _controller.maritalStatus = maritalStatus;
  }

  void setDependents() {
    _controller.dependents = dependent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const OnboardingNavigation(
              text: 'Marital Status',
              value: 0.2,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 27, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'What is your marital status?',
                    style: regularFont,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            maritalStatus = 'Single';
                          });
                          setMaritalStatus();
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              color: maritalStatus == "Single"
                                  ? highlightedButton
                                  : null,
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: const Color(0xff4701E0))),
                          child: const Center(
                            child: Text(
                              'Single',
                              style: regularFont,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            maritalStatus = 'Married';
                          });
                          setMaritalStatus();
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              color: maritalStatus == "Married"
                                  ? highlightedButton
                                  : null,
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: const Color(0xff4701E0))),
                          child: const Center(
                            child: Text(
                              'Married',
                              style: regularFont,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            maritalStatus = 'Divorced';
                          });
                          setMaritalStatus();
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              color: maritalStatus == "Divorced"
                                  ? highlightedButton
                                  : null,
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: const Color(0xff4701E0))),
                          child: const Center(
                            child: Text(
                              'Divorced',
                              style: regularFont,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            maritalStatus = 'Seperated';
                          });
                          setMaritalStatus();
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              color: maritalStatus == "Seperated"
                                  ? highlightedButton
                                  : null,
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: const Color(0xff4701E0))),
                          child: const Center(
                            child: Text(
                              'Seperated',
                              style: regularFont,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            maritalStatus = 'Widowed';
                          });
                          setMaritalStatus();
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              color: maritalStatus == "Widowed"
                                  ? highlightedButton
                                  : null,
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: const Color(0xff4701E0))),
                          child: const Center(
                            child: Text(
                              'Widowed',
                              style: regularFont,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Do you have dependents?",
                    style: regularBoldFont,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            dependents = true;
                          });
                        },
                        child: Container(
                          width: 150,
                          height: 40,
                          decoration: BoxDecoration(
                              color: dependents ? highlightedButton : null,
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: const Color(0xff4701E0))),
                          child: const Center(
                            child: Text(
                              'Yes, I do',
                              style: regularFont,
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
                            dependents = false;
                            dependent = "None";
                          });
                          setDependents();
                        },
                        child: Container(
                          width: 150,
                          height: 40,
                          decoration: BoxDecoration(
                              color: !dependents ? highlightedButton : null,
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(color: const Color(0xff4701E0))),
                          child: const Center(
                            child: Text(
                              'No, I don\'t',
                              style: regularFont,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(color: Color(0xff081952), thickness: 2),
                  dependents
                      ? const Text(
                          'How many dependents?',
                          style: regularBoldFont,
                        )
                      : Container(),
                  const SizedBox(
                    height: 10,
                  ),
                  dependents
                      ? Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  dependent = "1-2";
                                });
                                setDependents();
                              },
                              child: Container(
                                width: 150,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: dependent == "1-2"
                                        ? highlightedButton
                                        : null,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: const Color(0xff4701E0))),
                                child: const Center(
                                  child: Text(
                                    '1 to 2',
                                    style: regularFont,
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
                                  dependent = "3-4";
                                });
                                setDependents();
                              },
                              child: Container(
                                width: 150,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: dependent == "3-4"
                                        ? highlightedButton
                                        : null,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: const Color(0xff4701E0))),
                                child: const Center(
                                  child: Text(
                                    '3 to 4',
                                    style: regularFont,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  const SizedBox(
                    height: 10,
                  ),
                  dependents
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              dependent = "5 and above";
                            });
                            setDependents();
                          },
                          child: Container(
                            width: 150,
                            height: 40,
                            decoration: BoxDecoration(
                                color: dependent == "5 and above"
                                    ? highlightedButton
                                    : null,
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: const Color(0xff4701E0))),
                            child: const Center(
                              child: Text(
                                '5 & above',
                                style: regularFont,
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomELevatedButton(
                      text: 'Next',
                      onPressed: () {
                        Get.toNamed('/educational_background');
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
