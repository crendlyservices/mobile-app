import 'package:crendly/controller/select_id_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../style/style.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/onboarding_navigation.dart';

class SelectIdCardView extends StatefulWidget {
  const SelectIdCardView({Key? key}) : super(key: key);

  @override
  _SelectIdCardViewState createState() => _SelectIdCardViewState();
}

class _SelectIdCardViewState extends State<SelectIdCardView> {
  final SelectIdCardController _selectIdCardController =
      Get.find<SelectIdCardController>();
  int type = 0;
  void setType() {
    _selectIdCardController.type = type;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const OnboardingNavigation(
                value: 0.3,
                text: 'Select ID card',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 35.0,
                  vertical: 32.0,
                ),
                child: Column(
                  children: [
                    SvgPicture.asset('assets/images/id.svg'),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Choose your preferred ID',
                      style: boldSubtitle,
                    ),
                    const SizedBox(
                      height: 27,
                    ),
                    const Text(
                      'Make sure the document includes a picture of your face',
                      style: regularFont,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          type = 4;
                        });
                        setType();
                      },
                      child: Container(
                        width: 400,
                        height: 50,
                        decoration: BoxDecoration(
                            color: type == 4 ? highlightedButton : null,
                            border: Border.all(color: const Color(0xff4701E0)),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            'International Passport',
                            style: smallText,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          type = 2;
                        });
                        setType();
                      },
                      child: Container(
                        width: 400,
                        height: 50,
                        decoration: BoxDecoration(
                            color: type == 2 ? highlightedButton : null,
                            border: Border.all(color: const Color(0xff4701E0)),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            'Driver\'s license',
                            style: smallText,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          type = 1;
                        });
                        setType();
                      },
                      child: Container(
                        width: 400,
                        height: 50,
                        decoration: BoxDecoration(
                            color: type == 1 ? highlightedButton : null,
                            border: Border.all(color: const Color(0xff4701E0)),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            'National ID card ',
                            style: smallText,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          type = 3;
                        });
                        setType();
                      },
                      child: Container(
                        width: 400,
                        height: 50,
                        decoration: BoxDecoration(
                            color: type == 3 ? highlightedButton : null,
                            border: Border.all(color: const Color(0xff4701E0)),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            'Voter\'s card',
                            style: smallText,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomELevatedButton(
                        text: 'Next',
                        onPressed: () {
                          Get.toNamed('/upload_id_card');
                        })
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
