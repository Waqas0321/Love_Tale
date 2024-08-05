import 'package:get/get.dart';
enum DistanceUnit { km, mi }

class SettingsController extends GetxController {
  var sliderValue = 30.0.obs;
  var swipeSurge = false.obs;
  var status = false.obs;
  var selectedUnit = DistanceUnit.km.obs;

  void updateSliderValue(double value) {
    sliderValue.value = value;
  }

  void updateSwipeSurge(bool value) {
    swipeSurge.value = value;
  }

  void updateActive(bool value) {
    status.value = value;
  }

  void updateSelectedUnit(DistanceUnit unit) {
    selectedUnit.value = unit;
  }
}
