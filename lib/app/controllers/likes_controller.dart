import 'package:get/get.dart';
import '../utils/const/app_images.dart';

class LikeController extends GetxController {
  var user = [
    {
      'name': 'Unlimited likes',
      'distance': 'Swipe right as much as you want',
      'image': AppImages.Likes1,
    },
    {
      'name': 'Unlimited Rewinds',
      'distance': 'Go back and swipe again',
      'image': AppImages.Likes2,
    },
    {
      'name': 'Turn Off Ads',
      'distance': 'Have fun swiping',
      'image': AppImages.Likes3,
    },
    {
      'name': 'Unlimited Likes',
      'distance': 'Have fun swiping',
      'image': AppImages.Likes1,
    },
    {
      'name': 'Unlimited Rewinds',
      'distance': 'Go back and swipe again',
      'image': AppImages.Likes2,
    },
  ].obs;

  var selectedIndex = (-1).obs;

  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
