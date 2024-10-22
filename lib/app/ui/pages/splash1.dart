import 'dart:async';
import 'package:flutter/material.dart';
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
    super.initState();
    // Start navigation timer in initState so it runs only once
    navigation();
  }

  void navigation() {
    Timer(
      Duration(milliseconds: 2000),
          () => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SplashScreen()),
            (Route<dynamic> route) => false,
      ),
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
