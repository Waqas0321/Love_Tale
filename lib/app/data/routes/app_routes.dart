import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/route_manager.dart';
import 'package:love_tale/Constants/love_tale_Sizes.dart';
import 'package:love_tale/app/bindings/bottom_screen.dart';
import 'package:love_tale/app/ui/filters_Screen.dart';
import 'package:love_tale/app/ui/pages/Auth/discover_screen.dart';
import 'package:love_tale/app/ui/pages/desktop_personal_info.dart';
import 'package:love_tale/app/ui/pages/landingScreen.dart';
import '../../ui/pages/Auth/chat_screen.dart';
import '../../ui/pages/Auth/location_Screen.dart';
import '../../ui/pages/Auth/login.dart';
import '../../ui/pages/Auth/otp_screen.dart';
import '../../ui/pages/Auth/personal_screen.dart';
import '../../ui/pages/Auth/phone_number.dart';
import '../../ui/pages/Auth/swipe_screen.dart';
import '../../ui/pages/card_Screen.dart';
import '../../ui/pages/edit_profile.dart';
import '../../ui/pages/likes_screen.dart';
import '../../ui/pages/policies.dart';
import '../../ui/pages/splash.dart';
import '../../ui/pages/username_screen.dart';
import '../../ui/select_hotel.dart';
import '../../ui/settings_Screen.dart';

class AppRoutes {
  static const String initalroute = "/";
  static const String initalrouteTwo = "/polices";
  static getApproutes() => [
        GetPage(name: "/", page: () => LandingScreen()),
        GetPage(name: "/polices", page: () => Policies()),
        GetPage(name: "/login_screen", page: () => LoginScreen()),
        GetPage(name: "/phone_number", page: () => PhoneScreen()),
        GetPage(name: "/otp_screen", page: () => OtpScreen()),
        GetPage(name: "/personal_screen", page: () => PersonalInfoScreen()),
        GetPage(name: "/location_screen", page: () => LocationScreen()),
        // GetPage(name: "/photo_screen", page: () => AddPhotosScreen()),
        GetPage(name: "/bottom_screen", page: () => BottomScreen()),
        GetPage(name: "/HotelDetailScreen", page: () => HotelDetailScreen()),
        GetPage(name: "/DiscoverGridView", page: () => DiscoverScreen()),
        GetPage(name: "/CardDetailView", page: () => CardDetailView()),
        GetPage(name: "/SwipeScreen", page: () => SwipeScreen()),
        GetPage(name: "/ChatScreen", page: () => ChatScreen()),
        GetPage(name: "/LikesScreen", page: () => LikesScreen()),
        GetPage(name: "/EditProfile", page: () => EditProfile()),
        GetPage(name: "/Username", page: () => Username()),
        GetPage(name: "/Filters", page: () => Filters()),
        GetPage(name: "/Settings", page: () => Settings()),
      ];
}
