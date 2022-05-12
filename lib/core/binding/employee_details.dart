import 'package:get/get.dart';

import '../../controller/employee_details.dart';
import '../repository/onboarding_repo_impl.dart';

class EmployeeDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OnboardingRepoImpl());
    Get.put(EmployeeDetailsController());
  }
}
