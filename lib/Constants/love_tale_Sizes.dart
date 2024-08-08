import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoveTaleSizes{
  static double spaceBTWItems = Get.height / 60;
  static double spaceBTWSections = Get.height / 30;
  static double defaultPadding = 11;
  static double buttonHeight = 52;


   bool isMobileFun(){
     double screenWidth = Get.width;
     if(screenWidth >= 10 && screenWidth <= 500){
       return true;
     }else{
       return false;
     }
   }
  bool isDesktopFun(){
    double screenWidth = Get.width;
    if(screenWidth > 500){
      return true;
    }else{
      return false;
    }
  }

   // Privacy and Policy Screen


  // hole Screen width
  double getScreenWidth(){
    double terms = Get.width ;
    if (isMobileFun()) {
      terms = Get.width; // Desktop
    } else {
      terms = Get.width / 2; // Tablet
    }
    return terms;
  }

  // Bottom Button width
  double getButtonWidth(){
    double width = Get.width ;
    if (isMobileFun()) {
      width = Get.width; // Desktop
    } else {
      width = Get.width / 4; // Tablet
    }
    return width;
  }

  // Sign In Screen
  double getscreencontentWidth(){
    double getWidth = Get.width ;
    if (isMobileFun()) {
      getWidth = Get.width; // Desktop
    } else {
      getWidth = Get.width / 3; // Tablet
    }
    return getWidth;
  }

  double getDesktopPadding(){
    double getPadding = Get.width ;
    if (isDesktopFun()) {
      getPadding = Get.width / 3; // Desktop
    } else {
      getPadding = Get.width; // Tablet
    }
    return getPadding;
  }

}