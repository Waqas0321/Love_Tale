import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:love_tale/app/controllers/auth/login.dart';

import '../../controllers/auth/editprofile_controller.dart';
import '../../utils/const/app_color.dart';
import '../../utils/const/app_strings.dart';
import '../../utils/widgets/app_button.dart';


class EditProfile extends StatelessWidget {
  final EditProfileController controller = Get.put(EditProfileController());
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap:()=> Get.back(),
                      child: const Icon(Icons.arrow_back, color: AppColors.pink)),
                  Text(
                    'Edit Profile',
                    style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87),
                  ),
                  const Icon(
                    Icons.more_horiz_rounded,
                    color: AppColors.pink,
                    size: 27,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(left: 24, right: 19, top: 14),
                children: [
                  controller.buildProfileItem('About Karter', controller.about.value),
                  controller.buildDivider(),
                  controller.buildProfileItem('Age', controller.age.value),
                  controller.buildDivider(),
                  controller.buildProfileItem('Living in', controller.location.value),
                  controller.buildDivider(),
                  controller.buildProfileItem('Gender', controller.gender.value),
                  controller.buildDivider(),
                  controller.buildProfileItem('Passions', controller.passions.value),
                  controller.buildDivider(),
                  controller.buildProfileItem('Profession', controller.profession.value),
                  controller.buildDivider(),
                  // controller.buildProfileItem('Social media', controller.socialMedia.value),
                  // controller.buildDivider(),
                  // controller.buildProfileItem('Show my Instagram photos', controller.showInstagramPhotos.value),
                   SizedBox(
                     height: 50,
                     child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.verified,color: Colors.green,),
                        SizedBox(width: 6,),
                        Text('Verified',style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 14
                        ),)
                      ],
                                       ),
                   ),
                  controller.buildDivider(),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 13),
              child: CustomButton(
                text: 'Log Out',
                onPressed: () {
                  // controller.updateProfile();
                  // Implement navigation or other actions here
                  _loginController.signOut();
                },
                textColor: Colors.white,
                borderRadius: 30.0,
                padding: 14.0,
                fontSize: 18.0,
                height: 52.0,
                width: 358.0,
              ),
            ),

          ],
        ),
      ),
    );


  }
}
