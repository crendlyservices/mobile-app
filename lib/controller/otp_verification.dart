import 'package:crendly/controller/update_user_profile.dart';
import 'package:crendly/core/repository/onboarding_repo.dart';
import 'package:crendly/core/repository/onboarding_repo_impl.dart';
import 'package:crendly/widgets/dialog.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  late OnboardingRepo _onboardingRepo;
  late UpdateUserProfileController _updateUserProfileController;

  OtpVerificationController() {
    _onboardingRepo = OnboardingRepoImpl();
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

    final result = await _onboardingRepo.otpVerificaton(otp, phoneNumber);
    print(
        'Otp: $otp, phoneNumber: ${_updateUserProfileController.phoneNumber}');
    print("Status: ${result.statusRes}");
    print("Code: ${result.code}");

    if (result.code == "200") {
      hideLoading();
      dialog('assets/images/phone_android.svg', () {
        Get.toNamed('/personal_info');
      }, 'OTP Verification successful', "ok");
    }else{
      Get.back();
    }
  }
}
