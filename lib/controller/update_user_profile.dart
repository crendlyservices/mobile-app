import 'dart:io';

import 'package:crendly/service/generic_api.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/failed_api_response.dart';
import '../models/user_profile.dart';
import '../service/http_service_impl.dart';

class UpdateUserProfileController extends GetxController {
  late ApiService _apiService;
  UpdateUserProfileController() {
    _apiService = ApiService();
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

  Future<String?> deviceDetails() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    String? deviceName;
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        // deviceName = build.model;
        return Future.value(build.model);
        //UUID for Android
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        // deviceName = data.name;
        return Future.value(data.name);
        //UUID for iOS
      }
    } on PlatformException {
      print('Failed to get platform version');
    }
  }

  updateUserProfile() async {
    showLoading();
    Future<String?> deviceInfo = deviceDetails();
    String? deviceName = await deviceInfo;

    Map body = {
      "phoneNumber": phoneNumber,
      "gender": gender,
      "email": email,
      "maritalStatus": maritalStatus,
      "educationalQualification": educationalQualification,
      "deviceType": deviceName.toString(),
      "dependents": dependents
    };
    final responseResult =
        await _apiService.apiRequest<UpdateUserProfile, FailedApiResponse>(
            IDENTITY_BASE_URL,
            "/api/profilemanagement/update_profile/$userId",
            "post",
            (json) => UpdateUserProfile.fromJson(json),
            (json) => FailedApiResponse.fromJson(json),
            body: body);

    responseResult.fold(
      (success) {
        /// Handle left
        /// For example: show dialog or alert
        var result = success;

        if (result.code == 200) {
          hideLoading();
          Get.toNamed('/employment_status');
        } else {
          hideLoading();
          Get.back();
        }

        return result;
      },
      (error) {
        /// Handle right
        /// For example: navigate to home page
        return UpdateUserProfile(
            code: 400, message: error.message ?? "", userProfileData: null);
      },
    );

    // final result = await OnboardingRepoImpl().updateUserProfile(
    //     userId,
    //     phoneNumber,
    //     firstName,
    //     middleName,
    //     lastName,
    //     email,
    //     gender,
    //     maritalStatus,
    //     educationalQualification,
    //     dependents);
    //
    // if (result.code == 200) {
    //   hideLoading();
    //   Get.toNamed('/employment_status');
    // }
    // print("Update user profile result: ${result.message}");
  }
}
