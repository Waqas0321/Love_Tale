import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:love_tale/app/ui/pages/Auth/chat_screen.dart';
import 'package:love_tale/app/ui/pages/Auth/gird_screen.dart';
import '../../controllers/card_Controller.dart';
import '../../utils/const/app_color.dart';
import '../../utils/const/app_images.dart';
import '../filters_Screen.dart';
import 'Auth/swipe_screen.dart';

class CardDetailView extends StatelessWidget {
  final CardDetailController controller = Get.put(CardDetailController());
  final CardSwiperController swiperController = CardSwiperController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(
                    top: 40.0, bottom: 16.0, left: 16.0, right: 16.0),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.rotate_right_rounded, color: Colors.black),
                      onPressed: () {
                        controller.setSelectedIndex(-1);
                      },
                    ),
                    Text(
                      'Discover',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: (){
                       // Navigator.push(context, MaterialPageRoute(builder: (context) => Filters(),));
                      },
                        child: Image.asset(AppImages.Filter,color: Colors.transparent,)),
                  ],
                ),
              ),
              Expanded(
                child: Obx(() => CardSwiper(
                  isLoop: true,
                  duration: Duration(microseconds: 1),
                  controller: swiperController,
                  cardsCount: controller.Users.length,
                  onSwipeDirectionChange:
                      (currentDirection, previousDirection) {
                    controller.setSwipeDirection(currentDirection.toString());
                  },
                  onSwipe: (previousIndex, currentIndex, direction) async {
                    return true;
                  },
                  cardBuilder: (context, index, realIndex, offset) {
                    final user = controller.Users[index];

                    return GestureDetector(
                      onTap: () {
                        // controller.showSwipeScreen(true);  // Update to show the SwipeScreen
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Center(
                              child: Card(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                elevation: 2,
                                child: Container(
                                  height: 392,
                                  width: 300,
                                  child: Stack(
                                    children: [
                                      // Image Background with Conditional Blur
                                      Container(
                                        height: 392,
                                        width: 330,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(user["image"]!),
                                          ),
                                        ),
                                        child: Obx(() {
                                          double blurAmount = 0;
                                          Color blurColor = Colors.white;

                                          if (controller.swipeDirection.value ==
                                              'CardSwiperDirection.left') {
                                            blurAmount = 5;
                                            blurColor = Color(0xff9b9c9f)
                                                .withOpacity(0.5);
                                          } else if (controller
                                              .swipeDirection.value ==
                                              'CardSwiperDirection.right') {
                                            blurAmount = 5;
                                            blurColor =
                                                Color(0xff9f7772);
                                          }

                                          return Blur(
                                            colorOpacity: 0,
                                            blur: blurAmount,
                                            blurColor: blurColor!,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(20.0),
                                                color: Colors.transparent,
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                      // Center Icon with Animation
                                      Positioned.fill(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: AnimatedOpacity(
                                            opacity: controller.swipeDirection
                                                .value.isNotEmpty
                                                ? 1
                                                : 0,
                                            duration: Duration(milliseconds: 300),
                                            child: controller.swipeDirection
                                                .value ==
                                                'CardSwiperDirection.left'
                                                ? Image.asset(
                                              "assets/images/cancel.png",
                                              height: 100,
                                              width: 100,
                                              color: Colors.white,
                                            )
                                                : controller.swipeDirection
                                                .value ==
                                                'CardSwiperDirection.right'
                                                ? Icon(
                                              Icons.favorite,
                                              color: AppColors.pink,
                                              size: 100,
                                            )
                                                : Container(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.close, color: AppColors.pink, size: 29.0),
                  SizedBox(width: 70),
                  Icon(Icons.favorite_border, color: AppColors.pink, size: 28.0),
                  SizedBox(width: 70),
                  Icon(Icons.star_border, color: AppColors.pink, size: 29.0),
                ],
              ),
              SizedBox(width: 3.0),
              Text(
                "Tiana Baptista",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  color: Colors.black87,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 4.0),
                  Text(
                    "Art Manager",
                    style: GoogleFonts.poppins(
                      fontSize: 14.5,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(Icons.location_on, color: AppColors.pink, size: 15.0),
                  Text(
                    " 10 miles",
                    style: GoogleFonts.poppins(
                      fontSize: 14.5,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3),
              Text(
                'Feminist. Cats. Other stuff that\'s mildly \n interesting.',
                style: GoogleFonts.poppins(
                  fontSize: 14.5,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Obx(() {
            return controller.isSwipeScreenVisible.value
                ? SwipeScreen()
                : Container();
          }),
        ],
      ),
    );
  }
}
