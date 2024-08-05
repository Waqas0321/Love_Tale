import 'package:get/get.dart';

class PersonalInfoController extends GetxController {
  var firstName = ''.obs;
  var selectedBirthday = Rx<DateTime?>(null); // Updated to DateTime
  var selectedGender = ''.obs;
  var selectedSexuality = ''.obs;

  void updateFirstName(String name) {
    firstName.value = name;
  }

  void updateBirthday(DateTime date) {
    selectedBirthday.value = date;
  }

  void updateGender(String gender) {
    selectedGender.value = gender;
  }

  void updateSexuality(String sexuality) {
    selectedSexuality.value  = sexuality;
  }
}
