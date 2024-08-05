import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/discovery_controller.dart';
import '../../../utils/const/app_color.dart';
import '../../../utils/const/app_images.dart';

class DiscoverGridView extends StatelessWidget {
  final DiscoverGridController controller = Get.put(DiscoverGridController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.only(
              top: 40.0, bottom: 16.0, left: 16.0, right: 16.0),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap:(){
                    Get.back();
                  },
                  child: Icon(Icons.rotate_right_rounded, color: Colors.black)),
              Text(
                'Discover',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(AppImages.Filter),
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
                itemCount: controller.users.length,
                itemBuilder: (context, index) {
                  final isSelected = controller.selectedIndex.value == index;
                  return GestureDetector(
                    onTap: () {
                      controller.setSelectedIndex(index);
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
                              controller.users[index]['image']!,
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
                                controller.users[index]['name']!,
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
                                    controller.users[index]['distance']!,
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
    );
  }
}
