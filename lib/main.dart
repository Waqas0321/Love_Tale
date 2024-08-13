import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:love_tale/Constants/love_tale_Sizes.dart';
import 'package:love_tale/app/ui/pages/policies.dart';
import 'package:love_tale/app/ui/pages/splash.dart';
import 'app/bindings/app_bindings.dart';
import 'app/data/routes/app_routes.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding:  AppBindings(), // Set the initial binding to initialize dependencies
      getPages:AppRoutes.getApproutes(),
    );
  }
}
