import 'package:get/get.dart';

class PhoneController extends GetxController {
  var dialCode = '+1'.obs; // Observable dial code
  var phoneNumber = ''.obs; // Observable phone number

  void updateDialCode(String code) {
    dialCode.value = code;
  }

  void updatePhoneNumber(String number) {
    phoneNumber.value = number;
  }

  String get fullPhoneNumber => '$dialCode$phoneNumber';
}
