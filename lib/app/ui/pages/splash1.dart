import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:love_tale/app/ui/pages/splash.dart';
import 'package:love_tale/app/utils/const/app_color.dart';

class Splash1Screen extends StatefulWidget {
  const Splash1Screen({super.key});

  @override
  State<Splash1Screen> createState() => _Splash1ScreenState();
}

class _Splash1ScreenState extends State<Splash1Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Get.offAll(SplashScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          child: Image.asset(
            'assets/images/splash.jpeg',
            fit: BoxFit.cover,
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: AppColors.customGradient,
          ),
        ),
      ),
    );
  }
}
