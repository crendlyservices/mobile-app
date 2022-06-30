import 'package:get/get.dart';

import '../../controller/address.dart';
import '../../controller/update_user_profile.dart';

class AddressBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UpdateUserProfileController());
    Get.put(AddressController());
  }
}
