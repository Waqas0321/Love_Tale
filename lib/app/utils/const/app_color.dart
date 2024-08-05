import 'package:flutter/material.dart';

class AppColors {
 static const Color blue = Color(0xff504a9f);
 static const Color pink = Color(0xfff06562);
 static const Color white = Color(0xFFFFFFFF);

 static const LinearGradient customGradient = LinearGradient(
  colors: [
   Color(0xff6c5092), // Start color
   Color(0xffd8626b), // End color
  ],
  begin: Alignment.topLeft, // Start alignment of the gradient
  end: Alignment.bottomRight, // End alignment of the gradient
 );
}
