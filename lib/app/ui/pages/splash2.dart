import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:love_tale/app/utils/const/app_color.dart';
import 'package:video_player/video_player.dart';
import '../../controllers/splash2_controller.dart';

class Splash2 extends StatelessWidget {
  const Splash2({super.key});

  @override
  Widget build(BuildContext context) {
    final Splash2Controller controller =
        Get.put(Splash2Controller()); // Initialize the controller

    return Scaffold(
      body: Center(
        child: Obx(() {
          return controller.isVideoInitialized.value
              ? Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 1000),
                      // Duration for the animation
                      top: controller.containerPositionTop.value,
                      // Use the observable position
                      left: controller.containerPositionLeft.value,
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        height: 180,
                        width: 180,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.purple,
                        ),
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 30,
                            child:
                                VideoPlayer(controller.videoPlayerController),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 40,
                        left: 0,
                        right: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Love Tale',
                              style: TextStyle(
                                  color: AppColors.purple,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w900),
                            ),
                            Text(
                              'Whre connections move',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'from digital to person',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        )),
                  ],
                )
              : const CircularProgressIndicator(); // Show loading indicator while initializing
        }),
      ),
    );
  }
}
