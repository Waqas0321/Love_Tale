// filename: username_controller.dart

import 'package:get/get.dart';

class UsernameController extends GetxController {
  var username = ''.obs;

  void updateUsername(String value) {
    username.value = value;
  }
}
