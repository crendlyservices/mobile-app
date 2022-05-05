import 'package:crendly/controller/update_user_profile.dart';
import 'package:crendly/core/repository/onboarding_repo.dart';
import 'package:crendly/core/repository/onboarding_repo_impl.dart';
import 'package:crendly/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  late OnboardingRepo _onboardingRepo;
  late UpdateUserProfileController _updateUserProfileController;

  OtpVerificationController() {
    _onboardingRepo = OnboardingRepoImpl();
    _updateUserProfileController = Get.find<UpdateUserProfileController>();
  }

  RxBool isLoading = false.obs;

  verifyOtp(String otp) async {
    String phoneNumber = _updateUserProfileController.phoneNumber;
    final result = await _onboardingRepo.otpVerificaton(otp, phoneNumber);
    print(
        'Otp: $otp, phoneNumber: ${_updateUserProfileController.phoneNumber}');
    print("Status: ${result.statusRes}");
    print("Code: ${result.code}");

    Get.defaultDialog(
        backgroundColor: backgroundColor,
        barrierDismissible: false,
        title: '',
        content: Column(children: [
          SvgPicture.asset('assets/images/phone_android.svg'),
          const SizedBox(
            height: 100,
          ),
          const Text('OTP Verification successful'),
        ]));
  }

  showLoading() async {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
