import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:love_tale/app/ui/pages/policies.dart';
import 'package:love_tale/app/ui/pages/splash2.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset('assets/videos/splash_video.mp4')
          ..initialize().then((_) {
            _videoPlayerController.play();
            setState(() {});
          });

    // Navigate to home after video completes
    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.position >=
          _videoPlayerController.value.duration) {
        navigateToSplash2();
      }
    });
  }

  void navigateToSplash2() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => Splash2()),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Center(
        child: AspectRatio(
          aspectRatio: _videoPlayerController.value.aspectRatio,
          child: VideoPlayer(_videoPlayerController),
        ),
      ),
    ]);
  }
}
