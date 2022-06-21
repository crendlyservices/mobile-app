import 'package:crendly/controller/update_user_profile.dart';
import 'package:crendly/service/generic_api.dart';
import 'package:crendly/service/http_service_impl.dart';
import 'package:get/get.dart';

import '../models/failed_api_response.dart';
import '../models/user_address.dart';

class AddressController extends GetxController {
  late ApiService _apiService;
  late UpdateUserProfileController _updateUserProfileController;
  AddressController() {
    _apiService = ApiService();
    _updateUserProfileController = Get.find<UpdateUserProfileController>();
  }

  String houseNumber = "";
  String apartmentNumber = "";
  String street = "";
  String area = "";
  String lga = "";
  String state = "";
  String residenceHolding = "";
  String rentedFor = "";
  String latitude = "";
  String longitude = "";
  String streetName = "";

  RxBool isLoading = false.obs;

  showLoading() {
    isLoading.value = true;
  }

  hideLoading() {
    isLoading.value = false;
  }

  updateAddress() async {
    showLoading();
    String userId = _updateUserProfileController.userId;

    Map<String, dynamic> body = {
      "userId": userId,
      "houseNumber": houseNumber.trim().toString(),
      "apartmentNumber": apartmentNumber.trim().toString(),
      "street": street.trim().toString(),
      "area": area.trim().toString(),
      "lga": lga.trim().toString(),
      "state": state.trim().toString(),
      "residenceHolding": residenceHolding.trim().toString(),
      "rentedFor": rentedFor.trim().toString(),
      // "locationHistories": [
      //   {
      //     "dateTimeLocation": DateTime.now().toString(),
      //     "directions": "string",
      //     "latitude": latitude.trim().toString(),
      //     "longitude": longitude.trim().toString(),
      //     "propertyName": "string",
      //     "relatedInformation": "string",
      //     "streetName": streetName.trim().toString()
      //   }
      // ]
    };
    final responseResult =
        await _apiService.apiRequest<Address, FailedApiResponse>(
            IDENTITY_BASE_URL,
            "/api/Identity/update-address",
            "post",
            (json) => Address.fromJson(json),
            (json) => FailedApiResponse.fromJson(json),
            body: body);
    responseResult.fold(
      (success) {
        /// Handle left
        /// For example: show dialog or alert
        var result = success;
        if (result.code == "200") {
          hideLoading();
          Get.toNamed('/face_scan');
        }

        return result;
      },
      (error) {
        /// Handle right
        /// For example: navigate to home page
        return Address(
            status: false,
            code: error.code ?? "",
            message: error.message ?? "",
            addressData: error.data);
      },
    );
  }
}
