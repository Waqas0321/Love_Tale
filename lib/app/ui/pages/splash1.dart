import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:love_tale/Constants/love_tale_Sizes.dart';
import 'package:love_tale/app/ui/pages/splash.dart';
import 'package:love_tale/app/utils/const/app_color.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Splash1Screen extends StatefulWidget {
  const Splash1Screen({super.key});

  @override
  State<Splash1Screen> createState() => _Splash1ScreenState();
}

class _Splash1ScreenState extends State<Splash1Screen> {
  int _secondsRemaining = 2; // Start the timer from 5 seconds
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--; // Decrease the timer
        });
      } else {
        _timer.cancel();
        if (mounted) {
          // Only navigate if the widget is still mounted
          Get.offAll(SplashScreen());
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // if (kIsWeb) {
    //   launch(
    //     "https://love-tale-lp-ruqc.vercel.app/",
    //     webOnlyWindowName: '_self',
    //   );
    //   return Container(); // Return an empty container since we're navigating away
    // } else {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: AppColors.customGradient,
          ),
          child: Center(
            child: Image.asset(
              'assets/images/logoImage.png',
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }
  // }
}