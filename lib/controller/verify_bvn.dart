import 'package:crendly/controller/update_user_profile.dart';
import 'package:crendly/core/repository/onboarding_repo.dart';
import 'package:crendly/core/repository/onboarding_repo_impl.dart';
import 'package:crendly/models/verify_bvn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyBvnController extends GetxController {
  late OnboardingRepo onboardingRepo;
  late UpdateUserProfileController updateUserProfileController;

  VerifyBvnController() {
    onboardingRepo = Get.find<OnboardingRepoImpl>();
    updateUserProfileController = Get.find<UpdateUserProfileController>();
  }

  late TextEditingController bvnController, dobController;
  var bvn = '';
  var dob = '';
  String maritalStatus = '';
  String educationalQualification = '';
  String email = '';

  @override
  void onInit() {
    // TODO: implement onInit
    bvnController = TextEditingController();
    dobController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onInit
    bvnController.dispose();
    dobController.dispose();
    super.onClose();
  }

  Future<VerifyBvn> verifyUserBvn() async {
    String phoneNumber = updateUserProfileController.phoneNumber;
    print("phoneNumber: $phoneNumber");

    String gender = updateUserProfileController.gender;
    print("Gender: $gender");
    final result =
        await OnboardingRepoImpl().verifyBvn(bvn, dob, phoneNumber, gender);
    String statusCode = result.code;
    if (statusCode == "200") {
      updateUserProfileController.userId = result.verifyUserData.userId;
      updateUserProfileController.picture = result.verifyUserData.bvnData.image;
      updateUserProfileController.firstName =
          result.verifyUserData.bvnData.firstName;
      updateUserProfileController.middleName =
          result.verifyUserData.bvnData.middleName;
      updateUserProfileController.lastName =
          result.verifyUserData.bvnData.lastName;
      return result;
    } else {
      throw Exception();
    }
  }
}
