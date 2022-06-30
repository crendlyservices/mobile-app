import 'package:crendly/controller/update_user_profile.dart';
import 'package:crendly/service/generic_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/employment_details.dart';
import '../models/failed_api_response.dart';
import '../service/http_service_impl.dart';

class EmployeeDetailsController extends GetxController {
  late ApiService _apiService;
  late UpdateUserProfileController _updateUserProfileController;

  EmployeeDetailsController() {
    _apiService = ApiService();
    _updateUserProfileController = Get.find<UpdateUserProfileController>();
  }

  String employer = "";
  String occupation = "";
  String salaryOrIncomeRange = "";
  bool politicallyExposed = false;
  String position = "";
  String employmentType = "";
  String employmentStatus = "";

  late TextEditingController employerNameController;
  late TextEditingController occupationController;
  late TextEditingController positionController;

  RxBool isLoading = false.obs;

  showLoading() {
    isLoading.value = true;
  }

  hideLoading() {
    isLoading.value = false;
  }

  @override
  void onInit() {
    employerNameController = TextEditingController();
    occupationController = TextEditingController();
    positionController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    employerNameController.dispose();
    occupationController.dispose();
    positionController.dispose();
    super.onClose();
  }

  employeeDetails() async {
    showLoading();
    String userId = _updateUserProfileController.userId;
    Map body = {
      "userId": userId,
      "employer": employer,
      "salaryOrIncomeRange": salaryOrIncomeRange,
      "politicallyExposed": politicallyExposed,
      "position": position,
      "employmentType": employmentType,
      "employmentStatus": employmentStatus
    };
    final responseResult =
        await _apiService.apiRequest<EmploymentDetails, FailedApiResponse>(
            IDENTITY_BASE_URL,
            "/api/Identity/update-employment_details",
            "post",
            (json) => EmploymentDetails.fromJson(json),
            (json) => FailedApiResponse.fromJson(json),
            body: body);

    responseResult.fold(
      (success) {
        /// Handle left
        /// For example: show dialog or alert
        var result = success;

        if (result.status) {
          hideLoading();
          Get.toNamed('/means_of_identification');
        } else {
          hideLoading();
          Get.back();
        }

        return result;
      },
      (error) {
        /// Handle right
        /// For example: navigate to home page
        return EmploymentDetails(
            status: false,
            message: error.message ?? "",
            code: error.code ?? "",
            data: null);
      },
    );
    //   String userId = _updateUserProfileController.userId;
    //   final result = await _onboardingRepo.updateEmploymentDetails(
    //       userId,
    //       employer,
    //       occupation,
    //       salaryOrIncomeRange,
    //       politicallyExposed,
    //       position,
    //       employmentType,
    //       employmentStatus);
    //
    //   if (result.status) {
    //     hideLoading();
    //     Get.toNamed('/means_of_identification');
    //   }
    //   print('Employment details: $result');
    // }
  }
}
