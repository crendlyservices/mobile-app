import 'package:crendly/controller/update_user_profile.dart';
import 'package:crendly/resources/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../core/repository/onboarding_repo.dart';
import '../core/repository/onboarding_repo_impl.dart';

class SelectIdCardController extends GetxController {
  late OnboardingRepo _onboardingRepo;
  late UpdateUserProfileController _updateUserProfileController;

  SelectIdCardController() {
    _onboardingRepo = Get.find<OnboardingRepoImpl>();
    _updateUserProfileController = Get.find<UpdateUserProfileController>();
  }

  String idNumber = "";
  int type = 0;
  String issuanceDate = "";

  String expiryDate = "";

  String imagePath = "";

  late TextEditingController idNumberController;
  late TextEditingController issuanceDateController;
  late TextEditingController expiryDateController;

  @override
  void onInit() {
    idNumberController = TextEditingController();
    issuanceDateController = TextEditingController();
    expiryDateController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    idNumberController.dispose();
    issuanceDateController.dispose();
    expiryDateController.dispose();
    super.onClose();
  }

  uploadIdCard() async {
    String userId = _updateUserProfileController.userId;
    print("User Id: $userId");

    final result = await _onboardingRepo.updateRegulatoryId(
        userId, type, idNumber, issuanceDate, expiryDate, imagePath);
    if (result.status) {
      Get.defaultDialog(
          backgroundColor: ColorManager.backgroundColor,
          barrierDismissible: true,
          title: '',
          content: Column(children: [
            SvgPicture.asset('assets/images/phone_android.svg'),
            const SizedBox(
              height: 100,
            ),
            const Center(
              child: Text(
                'We\'ll have our AI system verify your ID in a bit ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: ColorManager.lightOrange,
                  fontFamily: 'KumbhSans',
                ),
              ),
            ),
            const SizedBox(
              height: 114,
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed('/face_scan');
                },
                child: const Text(
                  'Ok',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                        const Size.fromHeight(50)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        const RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color(0xff6DE7B4),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    )),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        ColorManager.backgroundColor)),
              ),
            )
          ]));
    }
    print('upload Id card: $result');
  }
}
