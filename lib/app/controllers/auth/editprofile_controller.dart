import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class EditProfileController extends GetxController {
  // Define any variables or methods for managing the state here.
  var about = 'Fashion lover, Other stuff that\'s mildly interesting.'.obs;
  var age = '23'.obs;
  var location = 'Madrid, Spain'.obs;
  var gender = 'Transgender Male'.obs;
  var passions = 'Fashion, Instagram, Style, Art, Drawing, Poetry'.obs;
  var profession = 'Fashion Critic'.obs;
  var socialMedia = 'Instagram'.obs;
  var showInstagramPhotos = 'Yes'.obs;

  void updateProfile() {
    // Update profile logic
  }

  Widget buildProfileItem(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(top: 9, bottom: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                fontSize: 16),
          ),
          SizedBox(height: 4),
          Text(
            subtitle,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: Colors.black54,
                fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget buildDivider() {
    return Divider(
      color: Colors.grey[300],
      thickness: 1.2,
      height: 14,
    );
  }
}
