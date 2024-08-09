import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:love_tale/app/ui/pages/Auth/login.dart';
import 'package:love_tale/app/ui/pages/matchesMessagesTabBar.dart';
import 'package:love_tale/app/ui/pages/policies.dart';

import '../../utils/const/app_images.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Get.off(Policies());
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xffFF4B3A),
      body: Container(
        width: 414,
        height: 896,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.Splash),fit: BoxFit.cover,
            )
        ),
      ),
    );
  }
}
