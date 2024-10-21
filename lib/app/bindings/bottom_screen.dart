import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:love_tale/Constants/love_tale_Sizes.dart';
import 'package:love_tale/app/ui/filters_Screen.dart';
import 'package:love_tale/app/ui/pages/matchesMessagesTabBar.dart';
import 'package:love_tale/app/ui/pages/splash.dart';
import 'package:love_tale/app/ui/select_hotel.dart';
import '../controllers/auth/bottom_controller.dart'; // Adjust this import path as needed
import '../ui/hotel_Screen.dart';
import '../ui/pages/Auth/chat_screen.dart';
import '../ui/pages/Auth/discover_screen.dart';
import '../ui/pages/Auth/gird_screen.dart';
import '../ui/pages/edit_profile.dart';
import '../utils/const/app_color.dart';

class BottomScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  LoveTaleSizes _sizes = LoveTaleSizes();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double contentWidth = _sizes.getscreencontentWidth();
        bool isMobile = _sizes.isMobileFun();
        bool isDesktop = _sizes.isDesktopFun();
        double desktopPadding = _sizes.getDesktopPadding();
        return isDesktop ? Row(
          children: [
            Expanded(
                flex: 2,
                child: Navigator(onGenerateRoute: (settings) => CupertinoPageRoute(builder: (context) {
              return MatchesMessagesTabBarScreen();
            },),)),
            Expanded(
              flex: 5,
              child: ClipRRect(
                child: Navigator(
                  onGenerateRoute: (settings) => CupertinoPageRoute(builder: (context) {
                    return  DiscoverScreen();
                  },),
                ),
              ),
            ),
          ],
        ) : Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Obx(() {
              return IndexedStack(
                index: controller.tabIndex.value,
                children: [
                  DiscoverScreen(),  // Show CardDetailView first
                  DiscoverGridView(),  // Show DiscoverGridView second
                  DiscoverGridView(),
                  ChatScreen(),
                  EditProfile(),
                ],
              );
            }),
          ),
          bottomNavigationBar: Obx(() {
            return  Padding(
              padding: isDesktop? EdgeInsets.only(left: desktopPadding, right: desktopPadding):EdgeInsets.all(0),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(27.0),
                    topRight: Radius.circular(27.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: BottomNavigationBar(
                  currentIndex: controller.tabIndex.value,
                  onTap: controller.changeTabIndex,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: AppColors.pink,
                  unselectedItemColor: Colors.black87,
                  backgroundColor: Colors.transparent, // Set background color to transparent
                  elevation: 0, // Remove elevation to avoid shadow conflict
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.location_on_outlined),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_border),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.star_outline),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.messenger_outline_rounded, size: 19),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: '',
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
