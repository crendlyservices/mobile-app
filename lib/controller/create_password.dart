import 'package:crendly/controller/update_user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../models/create_password.dart';
import '../models/failed_api_response.dart';
import '../resources/color_manager.dart';
import '../service/generic_api.dart';
import '../service/http_service_impl.dart';
import '../widgets/custom_elevated_button.dart';

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
          Get.defaultDialog(
              title: '',
              radius: 24,
              backgroundColor: ColorManager.dialogBackgroundColor,
              barrierDismissible: true,
              content: Column(children: [
                CircleAvatar(
                  radius: 36,
                  backgroundColor: ColorManager.lightGreen,
                  child: CircleAvatar(
                      backgroundColor: ColorManager.dialogBackgroundColor,
                      radius: 32,
                      child: SvgPicture.asset("assets/images/success.svg")),
                ),
                const SizedBox(
                  height: 51,
                  child: VerticalDivider(
                    thickness: 1,
                    color: ColorManager.lightGreen,
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                const Center(
                  child: Text(
                    "Welcome to Crendly",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: ColorManager.lightOrange,
                      fontFamily: 'KumbhSans',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 102,
                ),
                SizedBox(
                    width: 150,
                    child: CustomELevatedButton(
                      onPressed: () {
                        Get.toNamed('/onboarding_select_page');
                      },
                      text: 'Continue',
                    ))
              ]));
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
