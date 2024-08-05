import 'package:get/get.dart';
import '../utils/const/app_images.dart';

class CardDetailController extends GetxController {
  var Users = <Map<String, String>>[
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

  var selectedIndex = (-1).obs;
  var swipeDirection = ''.obs;
  var currentIndex = 0.obs; // Track the current card index
  var previousIndex = 0.obs;
  var isSwipeScreenVisible = false.obs;// Add swipe direction state

  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }

  void setSwipeDirection(String direction) {
    swipeDirection.value = direction;
    print("swipeDirection...${swipeDirection.value}");
  }

  void updateIndices(int newIndex) {
    previousIndex.value = currentIndex.value;
    currentIndex.value = newIndex;
  }

  void showSwipeScreen(bool show) {
    isSwipeScreenVisible.value = show;
  }
}
