import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:love_tale/app/bindings/bottom_screen.dart';
import '../../controllers/likes_controller.dart';
import '../../utils/const/app_color.dart';
import '../../utils/const/app_strings.dart';
import '../../utils/widgets/app_button.dart';


class LikesScreen extends StatelessWidget {
  final LikeController controller =
      Get.put(LikeController()); // Instantiate the controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.pink,
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 22.0, top: 8),
              child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.close,
                    color: AppColors.pink,
                    size: 29,
                  )),
            ),
            Container(
              height: 376,
              child: Obx(() => Swiper(
                    itemCount: controller.user.length,
                    itemBuilder: (context, index) {
                      final user = controller.user[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              elevation: 0,
                              child: Stack(
                                children: [
                                  Container(
                                    height: 268,
                                    width: 268,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(20.0),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(user['image']!),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Text(
                            '${user['name']} ',
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            user['distance']!,
                            style: GoogleFonts.poppins(
                                color: Colors.black54,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      );
                    },
                    pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                        color: Colors.grey,
                        activeColor: AppColors.pink,
                        size: 6.5,
                        activeSize: 8.0,
                      ),
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(top: 340.0),
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 11, right: 10),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: 114,
                      height: 136,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12)),
                          border: Border.all(color: AppColors.pink, width: 2)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            "3",
                            style: GoogleFonts.poppins(
                              fontSize: 27,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            "months",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "USD 50/mo",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                          // SizedBox(height:16),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 135,
                      height: 174,
                      decoration: BoxDecoration(
                          color: AppColors.pink,
                          borderRadius: BorderRadius.circular(13),
                          border: Border.all(color: AppColors.pink, width: 3)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            width: 120,
                            height: 28,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8))),
                            child: Center(
                              child: Text(
                                "Most Popular",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "6",
                            style: GoogleFonts.poppins(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "months",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "USD 10/mo",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 16),
                          Container(
                            width: 115,
                            height: 28,
                            decoration: BoxDecoration(
                                color: Colors.red.shade600,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(6),
                                    bottomLeft: Radius.circular(6))),
                            child: Center(
                              child: Text(
                                "Save 50%",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 114,
                      height: 136,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                          border: Border.all(color: AppColors.pink, width: 2)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            "1",
                            style: GoogleFonts.poppins(
                              fontSize: 27,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            "months",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "USD 20/mo",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                          // SizedBox(height:16),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 28),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: CustomButton(
                  text: AppString.continues,
                  onPressed: () {
                    Get.offAll(BottomScreen());
                  },
                  color: AppColors.pink,
                  textColor: Colors.white,
                  borderRadius: 30.0,
                  padding: 12.0,
                  fontSize: 18.0,
                  height: 47.0, // Custom height
                  width: 360.0, // Custom width
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Recurring billing, cancel anytime",
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 15, right: 12,top: 4),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      color: Colors.black54,
                      fontSize: 10,
                    ),
                    children: [
                      TextSpan(text: 'By tapping '),
                      TextSpan(
                        text: 'Continue',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                          text:
                              ', your payment will be charged to your Apple account, and your subscription will automatically renew for the same package length at the same price until you cancel in settings in the App Store. By tapping '),
                      TextSpan(
                        text: 'Continue',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(text: ', you agree to our '),
                      TextSpan(
                        text: 'Terms',
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(text: '.'),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
