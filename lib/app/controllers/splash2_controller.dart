import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:love_tale/app/bindings/bottom_screen.dart';
import 'package:love_tale/app/ui/pages/Auth/login.dart';
import 'package:love_tale/app/ui/pages/policies.dart';
import 'package:video_player/video_player.dart';

class Splash2Controller extends GetxController {
  late final VideoPlayerController videoPlayerController;
  var isVideoInitialized = true.obs; // Observable for video initialization
  var containerPositionTop = 100.0.obs; // Observable for container position
  var containerPositionLeft = 20.0.obs; // Observable for container position

  void navigateToSplash3() {
    Timer(const Duration(seconds: 12), () {
      User? user = FirebaseAuth.instance.currentUser;
      if(user == null){
        Get.off(() =>LoginScreen());
      }
      else{
        Get.off(() =>BottomScreen());
      }
       // Navigate after 10 seconds
    });
  }

  void updateContainerPosition() {
    // Update the container position after 5 seconds
    Timer(const Duration(seconds: 4), () {
      containerPositionTop.value = 280; // New position
      containerPositionLeft.value = 160; // New position
    });
    Timer(const Duration(seconds: 8), () {
      containerPositionTop.value = 450; // New position
      containerPositionLeft.value = 20; // New position
    });
  }

  void videoPlay() async {
    videoPlayerController = VideoPlayerController.asset('assets/videos/splash_video.mp4');
    await videoPlayerController.initialize().then((_) {
      isVideoInitialized.value = true;
      videoPlayerController.play(); // Play the video after initialization
      navigateToSplash3(); // Navigate to the next screen
      updateContainerPosition(); // Start the timer to update position
    }).catchError((error) {
      print('Error initializing video player: $error');
    });
  }

  @override
  void onInit() {
    super.onInit();
    videoPlay();
  }
}
