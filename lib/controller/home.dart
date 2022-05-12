import 'package:get/get.dart';

class HomeController extends GetxController {
  int currentIndex = 0;

  updateTab(index) {
    currentIndex = index;
  }
}
