import 'package:crendly/core/repository/onboarding_repo.dart';
import 'package:crendly/core/repository/onboarding_repo_impl.dart';
import 'package:get/get.dart';

class VerifyBvnController extends GetxController {
  late OnboardingRepo _onboardingRepo;
  VerifyBvnController() {
    _onboardingRepo = Get.find<OnboardingRepoImpl>();
    verifyUserBvn();
  }

  verifyUserBvn() async {
    final result = await OnboardingRepoImpl().verifyBvn();

    if (result != null) {
      return result;
    } else {
      print('Data not received');
    }
  }
}
