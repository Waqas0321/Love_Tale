import 'package:get/get.dart';
import '../utils/const/app_images.dart';


class GiftController extends GetxController {
  var gift = [
    {
      'name': 'GiftName',
      'distance': '\$120',
      'image': AppImages.Gift1,
    },
    {
      'name': 'Gift Name',
      'distance': '\$120',
      'image': AppImages.Gift2,
    },
    {
      'name': 'Gift Name',
      'distance': '\$120',
      'image': AppImages.Gift3,
    },
    {
      'name': 'Gift Name',
      'distance': '\$120',
      'image': AppImages.Gift4,
    },
    {
      'name': 'Gift Name',
      'distance': '\$120',
      'image': AppImages.Gift5,
    },
    {
      'name': 'Gift Name',
      'distance': '\$120',
      'image': AppImages.Gift6,
    },
    {
      'name': 'Gift Name',
      'distance': '\$120',
      'image': AppImages.Gift2,
    },
    {
      'name': 'Gift Name',
      'distance': '\$120',
      'image': AppImages.Gift4,
    },
  ].obs;

  var selectedIndex = (-1).obs;

  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  Map<String, String> get selectedHotel => gift[selectedIndex.value];
}
