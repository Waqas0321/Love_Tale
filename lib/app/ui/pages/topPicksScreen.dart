import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:love_tale/app/controllers/card_Controller.dart';
import 'package:love_tale/app/controllers/discovery_controller.dart';
import 'package:love_tale/app/ui/pages/Auth/gird_screen.dart';
import 'package:love_tale/app/ui/pages/Auth/swipe_screen.dart';
import 'package:love_tale/app/ui/pages/card_Screen.dart';
import 'package:love_tale/app/utils/const/app_color.dart';

class TopPickesScreen extends StatefulWidget {
TopPickesScreen({super.key});

  @override
  State<TopPickesScreen> createState() => _TopPickesScreenState();
}

class _TopPickesScreenState extends State<TopPickesScreen> {
  final DiscoverGridController controller = Get.put(DiscoverGridController());
  final CardDetailController CardDetailcontroller = Get.put(CardDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Upgrade to LovTale Plus for more"),
            Text("Top Pick"),
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
                          setState(() {
                            controller.setSelectedIndex(index);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SwipeScreen(),));
                          });

                        },
                        child: Card(
                          color: isSelected ? AppColors.pink : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(18.0)),
                                    child: Image.asset(
                                      controller.users[index]['image']!,
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
                        ),
                      );
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
