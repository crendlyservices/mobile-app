import 'package:crendly/controller/update_user_profile.dart';
import 'package:crendly/core/repository/onboarding_repo.dart';
import 'package:crendly/core/repository/onboarding_repo_impl.dart';
import 'package:crendly/models/verify_bvn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service/generic_api.dart';

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

  RxBool isLoading = false.obs;

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }

  verifyUserBvn() async {
    String phoneNumber = updateUserProfileController.phoneNumber;
    print("phoneNumber: $phoneNumber");

    String gender = updateUserProfileController.gender;
    print("Gender: $gender");

    showLoading();

    //testing generic api
    String url = "/api/auth/platform/signupv2";
    String method = "post";
    ApiService api = ApiService();
    Map<String, dynamic> body = {
      "bvn": bvn.trim().toString(),
      "dateOfBirth": dob.trim().toString(),
      "phoneNumber": phoneNumber.trim().toString(),
      "gender": gender.trim().toString(),
      "profileType": "individual",
    };
    final responseResult = api.apiRequest<VerifyBvn>(
        url, method, (json) => VerifyBvn.fromJson(json),
        body: body);

    print('Verify Bvn: $responseResult');
    //end generic api test

    // final result =
    //     await OnboardingRepoImpl().verifyBvn(bvn, dob, phoneNumber, gender);
    // String statusCode = result.code;
    // hideLoading();
    // if (statusCode == "200") {
    //   updateUserProfileController.userId = result.verifyUserData.userId;
    //   updateUserProfileController.picture = result.verifyUserData.bvnData.image;
    //   updateUserProfileController.firstName =
    //       result.verifyUserData.bvnData.firstName;
    //   updateUserProfileController.middleName =
    //       result.verifyUserData.bvnData.middleName;
    //   updateUserProfileController.lastName =
    //       result.verifyUserData.bvnData.lastName;
    //
    //   updateUserProfileController.dob = result.verifyUserData.bvnData.dob;
    //   return result;
    // } else {
    //   throw Exception();
    // }
  }
}
