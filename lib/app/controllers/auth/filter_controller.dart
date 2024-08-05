import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FiltersController extends GetxController {
  // Observables
  var selectedValue = Rxn<String>();
  var selectedValueForInterested = Rxn<String>();
  var selectedGender = Rxn<String>();
  var ageValues = RangeValues(18, 60).obs;

  // Update methods
  void updateSelectedValue(String? value) {
    selectedValue.value = value;
  }

  void updateSelectedValueForInterested(String? newValue) {
    selectedValueForInterested.value = newValue;
  }

  void updateSelectedGender(String? newValue) {
    selectedGender.value = newValue;
  }

  void updateAgeValues(RangeValues values) {
    ageValues.value = values;
  }
}
