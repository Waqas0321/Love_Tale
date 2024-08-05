import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../const/app_color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double borderRadius;
  final double padding;
  final double fontSize;
  final FontWeight fontWeight;
  final double height;
  final double width;
  final String? imagePath; // Optional image path
  final bool showImage; // Flag to show or hide the image

  CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = AppColors.pink,
    this.textColor = Colors.white,
    this.borderRadius = 8.0,
    this.padding = 13.0,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.bold,
    required this.height,
    required this.width,
    this.imagePath,
    this.showImage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        gradient: AppColors.customGradient,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
          Colors.transparent, // Set to transparent to show gradient
          elevation: 0, // Remove the default elevation
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (showImage && imagePath != null)
                Padding(
                  padding: EdgeInsets.only(right: 8.0), // Space between image and text
                  child: Image.asset(
                    imagePath!,
                    height: 24.0, // Adjust height as needed
                    width: 24.0, // Adjust width as needed
                  ),
                ),
              Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
