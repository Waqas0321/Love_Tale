import 'package:get/get.dart';
import '../utils/const/app_images.dart';

class DiscoverGridController extends GetxController {
  var users = [
    {
      'name': 'Eliza William',
      'distance': '10 miles away',
      'image': AppImages.Pic,
    },
    {
      'name': 'Marie Ann',
      'distance': '10 miles away',
      'image': AppImages.Pic1,
    },
    {
      'name': 'Mira Dokidis',
      'distance': '10 miles away',
      'image': AppImages.Pic2,
    },
    {
      'name': 'Tiana Baptista',
      'distance': '10 miles away',
      'image': AppImages.Pic4,
    },
    {
      'name': 'Rayna Ekstrom',
      'distance': '10 miles away',
      'image': AppImages.Pic5,
    },
    {
      'name': 'Madelyn Septimus',
      'distance': '10 miles away',
      'image': AppImages.Pic6,
    },
    {
      'name': 'Tiana Baptista',
      'distance': '10 miles away',
      'image': AppImages.Pic4,
    },
    {
      'name': 'Marie Ann',
      'distance': '10 miles away',
      'image': AppImages.Pic1,
    },
  ].obs;
  RxBool isSelected = false.obs;
  Rx<double> percentage= 0.3.obs;

  var selectedIndex = (-1).obs;
  // Method to set selected index
  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
