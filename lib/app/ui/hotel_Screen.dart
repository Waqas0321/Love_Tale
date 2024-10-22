import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:love_tale/app/ui/select_hotel.dart';
import 'package:love_tale/app/ui/settings_Screen.dart';
import '../controllers/auth/hotel_controller.dart';
import '../utils/const/app_color.dart';
import '../utils/const/app_images.dart';

class HotelScreen extends StatefulWidget {
  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  final HotelController controller = Get.put(HotelController());

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
              InkWell(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen(),));
                } ,
                  child: Icon(Icons.settings, color: Colors.black54, size: 22)),
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
                  'Discover',
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
                  itemCount: controller.hotel.length,
                  itemBuilder: (context, index) {
                    final isSelected = controller.selectedIndex.value == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          controller.setSelectedIndex(index);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HotelDetailScreen(),));
                        });
                      },
                      child: Card(
                        color: isSelected ? AppColors.pink : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(18.0)),
                                child: Image.asset(
                                  controller.hotel[index]['image']!,
                                  height: 139.0,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 6),
                                Text(
                                  controller.hotel[index]['name']!,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16.0,
                                    color: isSelected ? Colors.white : Colors.black,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.location_on,
                                        color: isSelected ? Colors.white : Colors.pink,
                                        size: 15.0),
                                    SizedBox(width: 4.0),
                                    Text(
                                      controller.hotel[index]['distance']!,
                                      style: TextStyle(
                                        color: isSelected ? Colors.white : Colors.black54,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
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
        ],
      ),
    );
  }
}
