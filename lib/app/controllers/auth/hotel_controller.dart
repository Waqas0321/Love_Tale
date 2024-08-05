import 'package:get/get.dart';
import '../../utils/const/app_images.dart';

class HotelController extends GetxController {
  var hotel = [
    {
      'name': 'Eliza William',
      'distance': '10 miles away',
      'image': AppImages.Hotel6,
    },
    {
      'name': 'Marie Ann',
      'distance': '10 miles away',
      'image': AppImages.Hotel2,
    },
    {
      'name': 'Mira Dokidis',
      'distance': '10 miles away',
      'image': AppImages.Hotel3,
    },
    {
      'name': 'Tiana Baptista',
      'distance': '10 miles away',
      'image': AppImages.Hotel4,
    },
    {
      'name': 'Rayna Ekstrom',
      'distance': '10 miles away',
      'image': AppImages.Hotel5,
    },
    {
      'name': 'Madelyn Septimus',
      'distance': '10 miles away',
      'image': AppImages.Hotel1,
    },
    {
      'name': 'Tiana Baptista',
      'distance': '10 miles away',
      'image': AppImages.Hotel3,
    },
    {
      'name': 'Marie Ann',
      'distance': '10 miles away',
      'image': AppImages.Hotel2,
    },
  ].obs;

  var selectedIndex = (-1).obs;

  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  Map<String, String> get selectedHotel => hotel[selectedIndex.value];
}
