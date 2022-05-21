import 'package:crendly/controller/verify_bvn.dart';
import 'package:crendly/style/style.dart';
import 'package:crendly/widgets/custom_elevated_button.dart';
import 'package:crendly/widgets/onboarding_navigation.dart';
import 'package:crendly/widgets/textfield_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BvnView extends StatefulWidget {
  const BvnView({Key? key}) : super(key: key);

  @override
  _BvnViewState createState() => _BvnViewState();
}

class _BvnViewState extends State<BvnView> {
  final _verifyBvnController = Get.find<VerifyBvnController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const OnboardingNavigation(
              text: 'BVN',
              value: 0.2,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32, left: 24, right: 24),
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  TextFieldInput(
                    textEditingController: _verifyBvnController.bvnController,
                    label: 'Provide your BVN',
                    hintText: 'Enter Bvn',
                    textInputType: TextInputType.number,
                    onChanged: (value) {
                      _verifyBvnController.bvn = value;
                    },
                  ),
                  const SizedBox(
                    height: 125,
                  ),
                  CustomELevatedButton(
                      text: 'Next',
                      onPressed: () {
                        Get.toNamed('/dob');
                      }),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    'Can\'t get your BVN? Dial *565*0#',
                    style: smallText,
                  ),
                  const SizedBox(
                    height: 142,
                  ),
                  const Text(
                    'Don\'t have a BVN at the moment',
                    style: regularBoldFont,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  const Text(
                    'Continue without BVN',
                    style: skipText,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
