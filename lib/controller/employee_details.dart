import 'package:crendly/controller/update_user_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/repository/onboarding_repo.dart';
import '../core/repository/onboarding_repo_impl.dart';

class EmployeeDetailsController extends GetxController {
  late OnboardingRepo _onboardingRepo;
  late UpdateUserProfileController _updateUserProfileController;

  EmployeeDetailsController() {
    _onboardingRepo = Get.find<OnboardingRepoImpl>();
    _updateUserProfileController = Get.find<UpdateUserProfileController>();
  }

  String employer = "";
  String occupation = "";
  String salaryOrIncomeRange = "";
  bool politicallyExposed = false;
  String position = "";
  String employmentType = "";
  String employmentStatus = "";

  late TextEditingController employerNameController;
  late TextEditingController occupationController;
  late TextEditingController positionController;

  void onInit() {
    employerNameController = TextEditingController();
    occupationController = TextEditingController();
    positionController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    employerNameController.dispose();
    occupationController.dispose();
    positionController.dispose();
    super.onClose();
  }

  employeeDetails() async {
    String userId = _updateUserProfileController.userId;
    print("User Id: $userId");
    print("employment Status: $employmentStatus");
    final result = await _onboardingRepo.updateEmploymentDetails(
        userId,
        employer,
        occupation,
        salaryOrIncomeRange,
        politicallyExposed,
        position,
        employmentType,
        employmentStatus);

    print('Employment details: $result');
  }
}
