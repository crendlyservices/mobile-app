import 'package:get/get.dart';

import '../../controller/employee_details.dart';
import '../../controller/update_user_profile.dart';

class EmployeeDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UpdateUserProfileController());
    Get.put(EmployeeDetailsController());
  }
}
