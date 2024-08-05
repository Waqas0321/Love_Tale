import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      initialBinding: AppBindings(), // Set the initial binding to initialize dependencies
      initialRoute:AppRoutes.initalroute,
      getPages:AppRoutes.getApproutes(),
    );
  }
}
