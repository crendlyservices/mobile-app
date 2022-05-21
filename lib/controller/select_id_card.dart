import 'package:crendly/controller/update_user_profile.dart';
import 'package:flutter/cupertino.dart';
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

  String issuanceDate = "";

  String expiryDate = "";

  String imagePath = "";

  late TextEditingController idNumberController;
  late TextEditingController issuanceDateController;
  late TextEditingController expiryDateController;

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
        userId, idNumber, issuanceDate, expiryDate, imagePath);

    print('upload Id card: $result');
  }
}
