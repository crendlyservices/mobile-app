import 'package:crendly/controller/update_user_profile.dart';
import 'package:crendly/widgets/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  RxBool isLoading = false.obs;

  showLoading() {
    isLoading.value = true;
  }

  hideLoading() {
    isLoading.value = false;
  }

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
    showLoading();
    String userId = _updateUserProfileController.userId;

    final result = await _onboardingRepo.updateRegulatoryId(
        userId, type, idNumber, issuanceDate, expiryDate, imagePath);
    if (result.status) {
      hideLoading();
      dialog("assets/images/person.svg", () {
        Get.toNamed('/address');
      }, "We'll have our AI system verify your ID in a bit", "ok");
    }
    print('upload Id card: $result');
  }
}
