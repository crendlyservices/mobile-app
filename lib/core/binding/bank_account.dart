import 'package:crendly/controller/bank_account.dart';
import 'package:get/get.dart';

class BankAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BankAccountController());
  }
}
