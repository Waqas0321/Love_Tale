import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:love_tale/app/ui/select_hotel.dart';
import '../controllers/gift_controller.dart';
import '../utils/const/app_color.dart';
import '../utils/const/app_images.dart';
import '../utils/widgets/app_button.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: GiftScreen(),
    );
  }
}
class GiftScreen extends StatelessWidget {
  final GiftController controller = Get.put(GiftController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(68),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: AppColors.customGradient,
            ),
          ),
          title: Row(
            children: [
              CircleAvatar(
                radius: 19,
                backgroundImage: AssetImage(AppImages.Pic6), // Replace with actual image URL
              ),
              SizedBox(width: 10),
              Text(
                'Celina',
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Icon(Icons.settings, color: Colors.black54, size: 22),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.5,
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 25.0, bottom: 16.0, left: 16.0, right: 16.0),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_outlined, color: AppColors.pink)),
                SizedBox(width: 104),
                Text(
                  'Send Gifts',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return Container(
                color: Colors.white,
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 18.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: controller.gift.length,
                  itemBuilder: (context, index) {
                    final isSelected = controller.selectedIndex.value == index;
                    return GestureDetector(
                      onTap: () {
                        // controller.setSelectedIndex(index);
                        // Get.to(() => HotelDetailScreen());
                      },
                      child: Card(
                        color: isSelected ? AppColors.pink : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(18.0)),
                              child: Image.asset(
                                controller.gift[index]['image']!,
                                height: 139.0,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 6),
                                Text(
                                  controller.gift[index]['name']!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16.0,
                                    color: isSelected ? Colors.white : Colors.black,
                                  ),
                                ),

                                Text(
                                  controller.gift[index]['distance']!,
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : Colors.black54,
                                    fontSize: 12.0,
                                  ),
                                ),
                                SizedBox(height: 1.0),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 16,top: 3),
            child: CustomButton(
              text: "Send Gifts",
              onPressed: () {
               Get.back();
              },
              textColor: Colors.white,
              borderRadius: 30.0,
              padding: 14.0,
              fontSize: 18.0,
              height: 52.0, // Custom height
              width: 358.0, // Custom width
            ),
          ),
        ],
      ),
    );
  }
}
