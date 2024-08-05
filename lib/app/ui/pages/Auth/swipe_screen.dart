import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controllers/auth/cointroller_swipecard.dart';
import '../../../controllers/card_Controller.dart';
import '../../../utils/const/app_color.dart';
import '../../../utils/const/app_strings.dart';

class SwipeScreen extends StatelessWidget {
  final SwipeController controller = Get.put(SwipeController());
  final CardDetailController cardDetailController = Get.find();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Swiper(
            itemCount: controller.users.length,
            itemBuilder: (context, index) {
              final user = controller.users[index];
              return Container(
                width: screenWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                  child: Card(
                    color: Colors.white,
                    margin: EdgeInsets.zero,
                    child: Stack(
                      children: [
                        Container(
                          width: screenWidth,
                          height: 393,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(user['image']!),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 29,
                          left: 15,
                          child: InkWell(
                            onTap: () {
                              cardDetailController.showSwipeScreen(false); // Update to hide the SwipeScreen
                            },
                            child: Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.white70,
                              size: 26,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 29,
                          right: 15,
                          child: InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.segment_outlined,
                              color: Colors.white70,
                              size: 26,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            pagination: SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                color: Colors.grey,
                activeColor: Colors.white,
                size: 7.0,
                activeSize: 10.0,
              ),
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 304.0),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: screenWidth,
              height: 412,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.only(top: 18, left: 18, right: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 315,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Text(
                              AppString.phtographer, // Fixed typo
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Colors.black38,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Gender:",
                            style: GoogleFonts.poppins(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Female",
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: AppColors.pink,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Instagram:",
                            style: GoogleFonts.poppins(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "arsh@165ha",
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: AppColors.pink,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(height: 22),
                      Text(
                        "Hobbies",
                        style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        AppString.hoby, // Fixed typo
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black38,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Other Photos",
                        style: GoogleFonts.poppins(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 14),
                      Container(
                        height: 103,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.users.length,
                          itemBuilder: (context, index) {
                            final user = controller.users[index];
                            return Container(
                              width: 108,
                              height: 70,
                              margin: EdgeInsets.only(right: 12),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(user['image']!),
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            );
                          },
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
  }
}
