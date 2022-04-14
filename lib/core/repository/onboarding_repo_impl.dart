import 'package:crendly/models/verify_bvn.dart';
import 'package:crendly/service/http_service.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../service/http_service_impl.dart';
import 'onboarding_repo.dart';

class OnboardingRepoImpl extends OnboardingRepo {
  late HttpService _httpService;

  OnboardingRepoImpl() {
    _httpService = Get.put(HttpServiceImpl());
  }
  @override
  Future<VerifyBvn> verifyBvn() async {
    // TODO: implement verifyBvn

    try {
      Map<String, dynamic> body = {
        "bvn": "11111111112",
        "dateOfBirth": "04-03-1987",
        "phoneNumber": "08100288084",
        "profileType": "individual",
      };
      Map<String, dynamic> headers = {"Content-Type": "application/json"};
      String url = "/api/auth/platform/signupv2";
      final response = await _httpService.verifyUserBvn(url, headers, body);
      final parsedResponse = VerifyBvn.fromJson(response.data);
      print(parsedResponse);
      return parsedResponse;
    } on Exception catch (e) {
      print(e);
      throw Exception();
    }
  }
}
