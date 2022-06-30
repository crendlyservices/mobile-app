import 'package:get/get.dart';

import '../../controller/update_user_profile.dart';

class UpdateUserProfileBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(OnboardingRepoImpl());
    Get.put(UpdateUserProfileController());
  }
}
