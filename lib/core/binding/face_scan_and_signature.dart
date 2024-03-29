import 'package:crendly/controller/facial_scan_and_signature.dart';
import 'package:crendly/controller/update_user_profile.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class FaceScanAndSignatureBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UpdateUserProfileController());
    Get.put(FaceScanAndSignatureController());
  }
}
