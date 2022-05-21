import 'package:crendly/controller/verify_bvn.dart';
import 'package:crendly/core/repository/onboarding_repo_impl.dart';
import 'package:get/get.dart';

import '../../controller/update_user_profile.dart';

class VerifyBvnBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OnboardingRepoImpl());
    Get.put(UpdateUserProfileController());
    Get.put(VerifyBvnController());
  }
}
