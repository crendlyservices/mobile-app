import 'package:crendly/controller/otp_verification.dart';
import 'package:crendly/controller/update_user_profile.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../repository/onboarding_repo_impl.dart';

class OtpVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OnboardingRepoImpl());
    Get.put(UpdateUserProfileController());
    Get.put(OtpVerificationController());
  }
}
