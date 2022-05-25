import 'dart:convert';

import 'package:crendly/controller/update_user_profile.dart';
import 'package:crendly/core/repository/onboarding_repo.dart';
import 'package:crendly/core/repository/onboarding_repo_impl.dart';
import 'package:crendly/models/failed_api_response.dart';
import 'package:crendly/models/verify_bvn.dart';
import 'package:crendly/service/generic_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dartz/dartz.dart';

import '../models/verify_user_data.dart';

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

  Future<VerifyBvn> verifyUserBvn() async {
    String phoneNumber = updateUserProfileController.phoneNumber;
    print("phoneNumber: $phoneNumber");

    String gender = updateUserProfileController.gender;
    print("Gender: $gender");

    showLoading();

    //testing generic api

    ApiService api = ApiService();
    Map<String, dynamic> body = {
      "bvn": bvn.trim().toString(),
      "dateOfBirth": dob.trim().toString(),
      "phoneNumber": phoneNumber.trim().toString(),
      "gender": gender.trim().toString(),
      "profileType": "individual",
    };
    final responseresult = await api.apiRequest<VerifyBvn, FailedApiResponse>(
        "/api/auth/platform/signupv2",
        "post",
        (json) => VerifyBvn.fromJson(json),
        (json) => FailedApiResponse.fromJson(json),
        body: body);
    //end generic api test
    responseresult.fold(
      (success) {
        /// Handle left
        /// For example: show dialog or alert
        var result = success;
        updateUserProfileController.userId = result.verifyUserData!.userId;
        updateUserProfileController.picture =
            result.verifyUserData!.bvnData.image;
        updateUserProfileController.firstName =
            result.verifyUserData!.bvnData.firstName;
        updateUserProfileController.middleName =
            result.verifyUserData!.bvnData.middleName;
        updateUserProfileController.lastName =
            result.verifyUserData!.bvnData.lastName;

        updateUserProfileController.dob = result.verifyUserData!.bvnData.dob;
        return result;
      },
      (error) {
        /// Handle right
        /// For example: navigate to home page
        return VerifyBvn(
            statusRes: false,
            message: error.message,
            code: error.code,
            verifyUserData: null);
      },
    );
    throw Exception();
  }
}
