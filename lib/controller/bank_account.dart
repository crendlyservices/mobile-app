import 'package:crendly/service/generic_api.dart';
import 'package:crendly/service/http_service_impl.dart';
import 'package:get/get.dart';

import '../models/account_details.dart';
import '../models/failed_api_response.dart';

class BankAccountController extends GetxController {
  late ApiService _apiService;

  BankAccountController() {
    _apiService = ApiService();
  }
  String accountNumber = "Your name";
  String bankCode = "";
  String accountName = "";
  validateAccountNumber() async {
    Map<String, dynamic> body = {
      "accountNumber": accountNumber.trim().toString(),
      "bankCode": bankCode.trim().toString(),
    };
    final responseResult =
        await _apiService.apiRequest<AccountDetails, FailedApiResponse>(
            IDENTITY_BASE_URL,
            "/api/Identity/validate-account-number",
            "post",
            (json) => AccountDetails.fromJson(json),
            (json) => FailedApiResponse.fromJson(json),
            body: body);

    responseResult.fold(
      (success) {
        /// Handle left
        /// For example: show dialog or alert
        var result = success;

        if (result.status) {
          accountName = result.accountData?.accountName ?? "";
        }
        return result;
      },
      (error) {
        /// Handle right
        /// For example: navigate to home page
        return AccountDetails(
            status: false,
            message: error.message!,
            code: error.code!,
            accountData: null);
      },
    );
  }
}
