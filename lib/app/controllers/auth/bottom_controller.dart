import 'package:get/get.dart';

class HomeController extends GetxController {
  // Reactive variable to keep track of the current tab index
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}
