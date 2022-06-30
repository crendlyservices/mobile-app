import 'package:crendly/controller/create_password.dart';
import 'package:get/get.dart';

import '../../controller/update_user_profile.dart';

class CreatePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UpdateUserProfileController());
    Get.put(CreatePasswordController());
  }
}
