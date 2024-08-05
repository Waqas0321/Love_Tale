import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OtpController extends GetxController {
  var otpCode = ''.obs;

  void updateOtp(String value) {
    otpCode.value = value;
  }

  void addDigit(String digit) {
    if (otpCode.value.length < 4) {
      otpCode.value += digit;
    }
  }

  void removeDigit() {
    if (otpCode.value.isNotEmpty) {
      otpCode.value = otpCode.value.substring(0, otpCode.value.length - 1);
    }
  }

  void resendCode() {
  }

  void submitCode() {
  }
}