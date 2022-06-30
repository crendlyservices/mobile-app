import 'package:crendly/controller/update_user_profile.dart';
import 'package:crendly/models/update_regulatory_id.dart';
import 'package:crendly/service/generic_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/failed_api_response.dart';
import '../service/http_service_impl.dart';
import '../widgets/dialog.dart';

class SelectIdCardController extends GetxController {
  late ApiService _apiService;
  late UpdateUserProfileController _updateUserProfileController;

  SelectIdCardController() {
    _apiService = ApiService();
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
    Map<String, dynamic> body = {
      "userId": userId,
      "type": type,
      "idNumber": idNumber,
      "issuanceDate": issuanceDate,
      "expiryDate": expiryDate,
      "imagePath": imagePath
    };
    final responseResult =
        await _apiService.apiRequest<UpdateRegulatoryId, FailedApiResponse>(
            IDENTITY_BASE_URL,
            "/api/Identity/update-regulatory_Id",
            "post",
            (json) => UpdateRegulatoryId.fromJson(json),
            (json) => FailedApiResponse.fromJson(json),
            body: body);

    responseResult.fold(
      (success) {
        /// Handle left
        /// For example: show dialog or alert
        var result = success;

        if (result.status) {
          hideLoading();
          dialog("assets/images/person.svg", () {
            Get.toNamed('/address');
          }, "We'll have our AI system verify your ID in a bit", "ok");
        } else {
          hideLoading();
          Get.back();
        }

        return result;
      },
      (error) {
        /// Handle right
        /// For example: navigate to home page
        return UpdateRegulatoryId(
            status: false,
            message: error.message ?? "",
            code: error.code ?? "",
            userRegulatoryidData: null);
      },
    );

    // final result = await _onboardingRepo.updateRegulatoryId(
    //     userId, type, idNumber, issuanceDate, expiryDate, imagePath);
    // if (result.status) {
    //   hideLoading();
    //   dialog("assets/images/person.svg", () {
    //     Get.toNamed('/address');
    //   }, "We'll have our AI system verify your ID in a bit", "ok");
    // }
  }
}
