import 'dart:io';

import 'package:crendly/controller/update_user_profile.dart';
import 'package:crendly/models/face_scan_and_signature.dart';
import 'package:crendly/service/generic_api.dart';
import 'package:crendly/service/http_service_impl.dart';
import 'package:crendly/widgets/dialog.dart';
import 'package:get/get.dart';

import '../models/failed_api_response.dart';

class FaceScanAndSignatureController extends GetxController {
  late ApiService _apiService;
  late UpdateUserProfileController _updateUserProfileController;

  FaceScanAndSignatureController() {
    _apiService = ApiService();
    _updateUserProfileController = Get.find<UpdateUserProfileController>();
  }

  String faceScanImagePath = "";
  String signaturePath = "";
  File? fileImage;

  RxBool isLoading = false.obs;

  showLoading() {
    isLoading.value = true;
  }

  hideLoading() {
    isLoading.value = false;
  }

  updateUserFaceScanAndSignature() async {
    Map body = {
      "userId": _updateUserProfileController.userId,
      "imagePath": faceScanImagePath,
      "signaturePath": signaturePath
    };
    final responseResult =
        await _apiService.apiRequest<FaceScanAndSignature, FailedApiResponse>(
            IDENTITY_BASE_URL,
            "/api/Identity/update-facescan",
            "post",
            (json) => FaceScanAndSignature.fromJson(json),
            (json) => FailedApiResponse.fromJson(json),
            body: body);

    responseResult.fold(
      (success) {
        /// Handle left
        /// For example: show dialog or alert
        var result = success;
        if (result.status) {
          dialog("assets/images/person.svg", () {
            Get.toNamed('/bank_account');
          }, "Your signature has been secured in our database", "Continue");
        }
        return result;
      },
      (error) {
        /// Handle right
        /// For example: navigate to home page
        return FaceScanAndSignature(
            status: false,
            message: error.message!,
            code: error.code!,
            data: null);
      },
    );
  }
}
