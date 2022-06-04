import 'package:crendly/controller/update_user_profile.dart';
import 'package:crendly/service/generic_api.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  late ApiService _apiService;
  late UpdateUserProfileController _updateUserProfileController;
  AddressController() {
    _apiService = ApiService();
    _updateUserProfileController = Get.find<UpdateUserProfileController>();
  }

  // updateAddress() async {
  //   String userId = _updateUserProfileController.userId;
  //   print("phoneNumber: $phoneNumber");
  //
  //   String gender = updateUserProfileController.gender;
  //   print("Gender: $gender");
  //
  //   ApiService api = ApiService();
  //   Map<String, dynamic> body = {
  //     "bvn": bvn.trim().toString(),
  //     "dateOfBirth": dob.trim().toString(),
  //     "phoneNumber": phoneNumber.trim().toString(),
  //     "gender": gender.trim().toString(),
  //     "profileType": "individual",
  //   };
  //   final responseResult = await api.apiRequest<VerifyBvn, FailedApiResponse>(
  //       "/api/auth/platform/signupv2",
  //       "post",
  //       (json) => VerifyBvn.fromJson(json),
  //       (json) => FailedApiResponse.fromJson(json),
  //       body: body);
  //
  //   responseResult.fold(
  //     (success) {
  //       /// Handle left
  //       /// For example: show dialog or alert
  //       var result = success;
  //       updateUserProfileController.userId = result.verifyUserData!.userId;
  //       updateUserProfileController.picture =
  //           result.verifyUserData!.bvnData.image;
  //       updateUserProfileController.firstName =
  //           result.verifyUserData!.bvnData.firstName;
  //       updateUserProfileController.middleName =
  //           result.verifyUserData!.bvnData.middleName;
  //       updateUserProfileController.lastName =
  //           result.verifyUserData!.bvnData.lastName;
  //
  //       updateUserProfileController.dob = result.verifyUserData!.bvnData.dob;
  //       return result;
  //     },
  //     (error) {
  //       /// Handle right
  //       /// For example: navigate to home page
  //       return VerifyBvn(
  //           statusRes: false,
  //           message: error.message,
  //           code: error.code,
  //           verifyUserData: null);
  //     },
  //   );
  // }
}
