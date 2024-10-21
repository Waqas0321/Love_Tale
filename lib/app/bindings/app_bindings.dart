// lib/bindings/app_bindings.dart
import 'package:get/get.dart';
import 'package:love_tale/app/controllers/auth/register_controller.dart';

import '../controllers/auth/login.dart';
import '../controllers/splash.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {

    Get.put(SplashScreenController());
    Get.put(LoginController());

    Get.lazyPut(() => SplashScreenController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => RegisterControler());
  }
}
