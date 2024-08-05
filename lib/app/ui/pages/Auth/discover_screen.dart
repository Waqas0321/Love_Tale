import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/card_Controller.dart';
import '../card_Screen.dart';
import 'swipe_screen.dart';

class DiscoverScreen extends StatelessWidget {
  final CardDetailController controller = Get.put(CardDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        return controller.isSwipeScreenVisible.value
            ? SwipeScreen()
            : CardDetailView();
      }),
    );
  }
}
