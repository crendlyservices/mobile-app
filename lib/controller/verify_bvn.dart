import 'package:crendly/controller/update_user_profile.dart';
import 'package:crendly/models/failed_api_response.dart';
import 'package:crendly/models/verify_bvn.dart';
import 'package:crendly/service/generic_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service/http_service_impl.dart';

class VerifyBvnController extends GetxController {
  late ApiService _apiService;
  late UpdateUserProfileController updateUserProfileController;

  VerifyBvnController() {
    _apiService = ApiService();
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
    isLoading.value = true;
  }

  hideLoading() {
    isLoading.value = false;
  }

  verifyUserBvn() async {
    showLoading();
    String phoneNumber = updateUserProfileController.phoneNumber;
    print("phoneNumber: $phoneNumber");

    String gender = updateUserProfileController.gender;
    print("Gender: $gender");

    Map<String, dynamic> body = {
      "bvn": bvn.trim().toString(),
      "dateOfBirth": dob.trim().toString(),
      "phoneNumber": phoneNumber.trim().toString(),
      "gender": gender.trim().toString(),
      "profileType": "individual",
    };
    final responseResult =
        await _apiService.apiRequest<VerifyBvn, FailedApiResponse>(
            AUTH_BASE_URL,
            "/api/auth/platform/signupv2",
            "post",
            (json) => VerifyBvn.fromJson(json),
            (json) => FailedApiResponse.fromJson(json),
            body: body);

    responseResult.fold(
      (success) {
        /// Handle left
        /// For example: show dialog or alert
        var result = success;

        if (result.statusRes) {
          hideLoading();
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

          Get.toNamed('/otp');
        } else {
          hideLoading();
          Get.back();
        }

        return result;
      },
      (error) {
        /// Handle right
        /// For example: navigate to home page
        return VerifyBvn(
            statusRes: false,
            message: error.message ?? "",
            code: error.code ?? "",
            verifyUserData: null);
      },
    );
  }
}
