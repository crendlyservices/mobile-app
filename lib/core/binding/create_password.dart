import 'package:crendly/controller/create_password.dart';
import 'package:get/get.dart';

import '../../controller/update_user_profile.dart';
import '../repository/onboarding_repo_impl.dart';

class CreatePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OnboardingRepoImpl());
    Get.put(UpdateUserProfileController());
    Get.put(CreatePasswordController());
  }
}
