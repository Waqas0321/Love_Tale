import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Naviage();
  }

  Future<void> Naviage() async {
    Future.delayed(Duration(seconds: 3), () {
      Get.offNamed('/policies');
    });
  }
}
