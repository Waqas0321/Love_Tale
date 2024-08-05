// lib/styles/custom_text_styles.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyles {
  // Headline 1
  static TextStyle headline1 = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );

  // Headline 2
  static TextStyle headline2 = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w600,
      color: Colors.black87,
    ),
  );

  // Headline 3
  static TextStyle headline3 = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
  );

  // Body Text 1
  static TextStyle bodyText1 = GoogleFonts.poppins(

    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.black38,

    ),
  );

  // Body Text 2
  static TextStyle bodyText2 = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Colors.black87,
    ),
  );

  // Caption
  static TextStyle caption = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      color: Colors.grey,
    ),
  );

  // Subtitle 1
  static TextStyle subtitle1 = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: Colors.blueGrey,
    ),
  );

  // Subtitle 2
  static TextStyle subtitle2 = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.blueGrey.shade600,
    ),
  );

  // Button
  static TextStyle button = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );

  // Overline
  static TextStyle overline = GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: Colors.blueGrey.shade800,
    ),
  );
}
