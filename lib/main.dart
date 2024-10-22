import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:love_tale/app/ui/pages/Auth/languages_screen.dart';
import 'package:love_tale/app/ui/pages/personal_details/firstName_screen.dart';
import 'package:love_tale/app/ui/pages/personal_details/gender_screen.dart';
import 'package:love_tale/app/ui/pages/personal_details/insterest_screen.dart';
import 'package:love_tale/app/ui/pages/personal_details/picture_upload_screen.dart';
import 'package:love_tale/app/ui/pages/splash1.dart';
import 'package:love_tale/firebase_options.dart';
import 'app/bindings/app_bindings.dart';
import 'app/data/routes/app_routes.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialBinding:  AppBindings(), // Set the initial binding to initialize dependencies
      getPages:AppRoutes.getApproutes(),
      home: Splash1Screen(),
    );
  }
}