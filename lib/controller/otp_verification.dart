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
    showLoading();
    String phoneNumber = _updateUserProfileController.phoneNumber;

    final result = await _onboardingRepo.otpVerificaton(otp, phoneNumber);
    print(
        'Otp: $otp, phoneNumber: ${_updateUserProfileController.phoneNumber}');
    print("Status: ${result.statusRes}");
    print("Code: ${result.code}");
    hideLoading();
    if (result.code == "200") {
      Get.defaultDialog(
          backgroundColor: backgroundColor,
          barrierDismissible: true,
          title: '',
          content: Column(children: [
            SvgPicture.asset('assets/images/phone_android.svg'),
            const SizedBox(
              height: 100,
            ),
            const Text(
              'OTP Verification successful',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: lightOrange,
                fontFamily: 'Sansation',
              ),
            ),
            const SizedBox(height: 114,),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed('/personal_info');
                },
                child: const Text(
                  'Ok',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                        const Size.fromHeight(50)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        const RoundedRectangleBorder(
                      side: BorderSide(
                        color: Color(0xff6DE7B4),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    )),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(backgroundColor)),
              ),
            )
          ]));
    }
  }

  showLoading() async {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
