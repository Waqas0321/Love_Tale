// lib/controllers/photo_controller.dart
import 'package:get/get.dart';

class PhotoController extends GetxController {
  var selectedImages = <int>{}.obs;

  void toggleSelection(int index) {
    if (selectedImages.contains(index)) {
      selectedImages.remove(index);
    } else {
      selectedImages.add(index);
    }
  }

  bool isSelected(int index) {
    return selectedImages.contains(index);
  }
}
