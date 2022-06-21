import 'package:crendly/controller/update_user_profile.dart';
import 'package:get/get.dart';

import '../models/create_password.dart';
import '../models/failed_api_response.dart';
import '../service/generic_api.dart';
import '../service/http_service_impl.dart';

class CreatePasswordController extends GetxController {
  late ApiService _apiService;
  late UpdateUserProfileController _updateUserProfileController;

  CreatePasswordController() {
    _apiService = ApiService();
    _updateUserProfileController = Get.find<UpdateUserProfileController>();
  }

  String password = "";

  RxBool isLoading = false.obs;

  showLoading() {
    isLoading.value = true;
  }

  hideLoading() {
    isLoading.value = false;
  }

  createPassword() async {
    showLoading();
    Map body = {
      "userId": _updateUserProfileController.userId,
      "password": password.trim().toString()
    };
    final responseResult =
        await _apiService.apiRequest<CreatePassword, FailedApiResponse>(
            AUTH_BASE_URL,
            "/api/auth/create_password",
            "post",
            (json) => CreatePassword.fromJson(json),
            (json) => FailedApiResponse.fromJson(json),
            body: body);

    responseResult.fold(
      (success) {
        /// Handle left
        /// For example: show dialog or alert
        var result = success;
        if (result.status) {
          hideLoading();
          Get.toNamed('/onboarding_select_page');
        } else {
          Get.back();
        }
      },
      (error) {
        /// Handle right
        /// For example: navigate to home page
        return CreatePassword(
            status: false,
            message: error.message!,
            code: error.code!,
            data: null);
      },
    );
  }
}
