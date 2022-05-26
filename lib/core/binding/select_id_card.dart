import 'package:crendly/controller/select_id_card.dart';
import 'package:get/get.dart';

import '../repository/onboarding_repo_impl.dart';

class SelectIdCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OnboardingRepoImpl());
    Get.put(SelectIdCardController());
  }
}
