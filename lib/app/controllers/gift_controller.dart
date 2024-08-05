import 'package:get/get.dart';
import '../utils/const/app_images.dart';


class GiftController extends GetxController {
  var gift = [
    {
      'name': 'Eliza William',
      'distance': '10 miles away',
      'image': AppImages.Gift1,
    },
    {
      'name': 'Marie Ann',
      'distance': '10 miles away',
      'image': AppImages.Gift2,
    },
    {
      'name': 'Mira Dokidis',
      'distance': '10 miles away',
      'image': AppImages.Gift3,
    },
    {
      'name': 'Tiana Baptista',
      'distance': '10 miles away',
      'image': AppImages.Gift4,
    },
    {
      'name': 'Rayna Ekstrom',
      'distance': '10 miles away',
      'image': AppImages.Gift5,
    },
    {
      'name': 'Madelyn Septimus',
      'distance': '10 miles away',
      'image': AppImages.Gift6,
    },
    {
      'name': 'Tiana Baptista',
      'distance': '10 miles away',
      'image': AppImages.Gift2,
    },
    {
      'name': 'Marie Ann',
      'distance': '10 miles away',
      'image': AppImages.Gift4,
    },
  ].obs;

  var selectedIndex = (-1).obs;

  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  Map<String, String> get selectedHotel => gift[selectedIndex.value];
}
