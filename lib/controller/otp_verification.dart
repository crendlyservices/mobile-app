import 'package:crendly/controller/update_user_profile.dart';
import 'package:crendly/widgets/dialog.dart';
import 'package:get/get.dart';

import '../models/failed_api_response.dart';
import '../models/otp_verification.dart';
import '../service/generic_api.dart';
import '../service/http_service_impl.dart';

class OtpVerificationController extends GetxController {
  late ApiService _apiService;
  late UpdateUserProfileController _updateUserProfileController;

  OtpVerificationController() {
    _apiService = ApiService();
    _updateUserProfileController = Get.find<UpdateUserProfileController>();
  }

  RxBool isLoading = false.obs;

  showLoading() {
    isLoading.value = true;
  }

  hideLoading() {
    isLoading.value = false;
  }

  verifyOtp(String otp) async {
    showLoading();
    String phoneNumber = _updateUserProfileController.phoneNumber;

    Map<String, dynamic> body = {"otp": otp, "username": phoneNumber};

    final responseResult =
        await _apiService.apiRequest<OtpVerification, FailedApiResponse>(
            AUTH_BASE_URL,
            "/api/auth/verify_emailOrPhone",
            "post",
            (json) => OtpVerification.fromJson(json),
            (json) => FailedApiResponse.fromJson(json),
            body: body);

    responseResult.fold(
      (success) {
        /// Handle left
        /// For example: show dialog or alert
        var result = success;

        if (result.statusRes) {
          hideLoading();
          dialog('assets/images/phone_android.svg', () {
            Get.toNamed('/personal_info');
          }, 'OTP Verification successful', "ok");
        } else {
          Get.back();
        }

        return result;
      },
      (error) {
        /// Handle right
        /// For example: navigate to home page
        return OtpVerification(
            statusRes: false,
            message: error.message ?? "",
            code: error.code ?? "",
            data: null);
      },
    );
  }
}
