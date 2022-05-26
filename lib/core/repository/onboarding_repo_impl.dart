import 'dart:io';

import 'package:crendly/models/employment_details.dart';
import 'package:crendly/models/otp_verification.dart';
import 'package:crendly/models/update_regulatory_id.dart';
import 'package:crendly/models/user_profile.dart';
import 'package:crendly/models/verify_bvn.dart';
import 'package:crendly/service/http_service.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../service/http_service_impl.dart';
import 'onboarding_repo.dart';

class OnboardingRepoImpl extends OnboardingRepo {
  late IHttpService _httpService;
  //late VerifyBvnController _controller;
  OnboardingRepoImpl() {
    _httpService = Get.put(HttpServiceImpl());
    // _controller = Get.find<VerifyBvnController>();
  }
  @override
  Future<VerifyBvn> verifyBvn(
      String bvn, String dob, String phoneNumber, String gender) async {
    // TODO: implement verifyBvn

    try {
      Map<String, dynamic> body = {
        "bvn": bvn.trim().toString(),
        "dateOfBirth": dob.trim().toString(),
        "phoneNumber": phoneNumber.trim().toString(),
        "gender": gender.trim().toString(),
        "profileType": "individual",
      };

      String url = "/api/auth/platform/signupv2";
      final response = await _httpService.verifyUserBvn(url, body);
      final parsedResponse = VerifyBvn.fromJson(response.data);
      print(parsedResponse);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      throw Exception();
    }
  }

  @override
  Future<OtpVerification> otpVerificaton(String otp, String phoneNumber) async {
    try {
      Map<String, dynamic> body = {"otp": otp, "username": phoneNumber};

      String url = "/api/auth/verify_emailOrPhone";
      final response = await _httpService.otpVerification(url, body);
      final parsedResponse = OtpVerification.fromJson(response.data);
      print(parsedResponse);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      throw Exception();
    }
  }

  @override
  Future<UpdateRegulatoryId> updateRegulatoryId(String userId, String idNumber,
      String issuanceDate, String expiryDate, String imagePath) async {
    try {
      Map<String, dynamic> body = {
        "userId": userId,
        "type": 4,
        "idNumber": idNumber,
        "issuanceDate": issuanceDate,
        "expiryDate": expiryDate,
        "imagePath": imagePath
      };

      String url = "/api/Identity/update-regulatory_Id";
      final response = await _httpService.updateUserRegulatoryId(url, body);
      final parsedResponse = UpdateRegulatoryId.fromJson(response.data);
      print(parsedResponse);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      throw Exception();
    }
  }

  @override
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

  @override
  Future<UpdateUserProfile> updateUserProfile(
      String userId,
      String phoneNumber,
      String firstName,
      String? middleName,
      String lastName,
      String email,
      String gender,
      String maritalStatus,
      String educationalQualification,
      String dependents) async {
    deviceDetails();
    Future<String?> deviceInfo = deviceDetails();
    String? deviceName = await deviceInfo;
    print("device Name: $deviceName");
    try {
      String url = "/api/profilemanagement/update_profile/$userId";
      print(url);
      Map body = {
        "phoneNumber": phoneNumber,
        "gender": gender,
        "email": email,
        "maritalStatus": maritalStatus,
        "educationalQualification": educationalQualification,
        "deviceType": deviceName.toString(),
        "dependents": dependents
      };
      final response = await _httpService.updateUserProfile(url, body);
      print(response.statusMessage);
      final parsedResponse = UpdateUserProfile.fromJson(response.data);
      print("update user profile: $parsedResponse");
      return parsedResponse;
    } on Exception catch (e) {
      print(e.toString());
      throw Exception();
    }
  }

  @override
  Future<EmploymentDetails> updateEmploymentDetails(
      String userId,
      String employer,
      String occupation,
      String salaryOrIncomeRange,
      bool politicallyExposed,
      String position,
      String employmentType,
      String employmentStatus) async {
    try {
      String url = "/api/Identity/update-employment_details";
      Map body = {
        "userId": userId,
        "employer": employer,
        "salaryOrIncomeRange": salaryOrIncomeRange,
        "politicallyExposed": politicallyExposed,
        "position": position,
        "employmentType": employmentType,
        "employmentStatus": employmentStatus
      };
      final response = await _httpService.updateEmploymentDetails(url, body);
      print(response.statusMessage);
      final parsedResponse = EmploymentDetails.fromJson(response.data);
      print("Employment Status: $parsedResponse");
      return parsedResponse;
    } on Exception catch (e) {
      print(e.toString());
      throw Exception();
    }
  }
}
