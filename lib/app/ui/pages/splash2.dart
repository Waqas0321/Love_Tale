import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:love_tale/app/utils/const/app_color.dart';
import 'package:video_player/video_player.dart';
import '../../../Constants/love_tale_Sizes.dart';
import '../../controllers/splash2_controller.dart';

class Splash2 extends StatelessWidget {
  Splash2({super.key});
  final LoveTaleSizes _sizes = LoveTaleSizes();

  @override
  Widget build(BuildContext context) {
    final Splash2Controller controller =
        Get.put(Splash2Controller()); // Initialize the controller

    return LayoutBuilder(
      builder: (context, constraints) {
        double contentWidth = _sizes.getscreencontentWidth();
        bool isMobile = _sizes.isMobileFun();
        bool isDesktop = _sizes.isDesktopFun();
        return isDesktop?Scaffold(
          body: Center(
            child: Container(
              width: 500,
              child: Center(
                child: Obx(() {
                  return controller.isVideoInitialized.value
                      ? Stack(
                    children: [
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 1000),
                        top: controller.containerPositionTop.value,
                        left: controller.containerPositionLeft.value,

                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          height: 180,
                          width: 180,
                          padding: const EdgeInsets.all(4),
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
                              radius: 40,
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
            ),
          ),
        ):Scaffold(
          body: Center(
            child: Obx(() {
              return controller.isVideoInitialized.value
                  ? Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 1000),
                    top: controller.containerPositionTop.value,
                    left: controller.containerPositionLeft.value,

                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      height: 180,
                      width: 180,
                      padding: const EdgeInsets.all(4),
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
                          radius: 40,
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
      },
    );
  }
}
