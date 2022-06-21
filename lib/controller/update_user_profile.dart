import 'package:crendly/core/repository/onboarding_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/repository/onboarding_repo_impl.dart';

class UpdateUserProfileController extends GetxController {
  late OnboardingRepo _onboardingRepo;
  UpdateUserProfileController() {
    _onboardingRepo = Get.find<OnboardingRepoImpl>();
  }

  late String userId;
  late String firstName;
  late String lastName;
  late String? middleName;
  late String picture;
  String email = "";
  String phoneNumber = "";
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  String gender = "";
  String maritalStatus = "";
  String educationalQualification = "";
  String dob = "";
  String dependents = "None";
  RxBool isLoading = false.obs;

  showLoading() {
    isLoading.value = true;
  }

  hideLoading() {
    isLoading.value = false;
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    phoneNumberController.dispose();
    super.onClose();
  }

  updateUserProfile() async {
    showLoading();
    final result = await OnboardingRepoImpl().updateUserProfile(
        userId,
        phoneNumber,
        firstName,
        middleName,
        lastName,
        email,
        gender,
        maritalStatus,
        educationalQualification,
        dependents);

    if (result.code == 200) {
      hideLoading();
      Get.toNamed('/employment_status');
    }
    print("Update user profile result: ${result.message}");
  }
}
