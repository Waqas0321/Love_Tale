import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:love_tale/app/controllers/auth/login.dart';
import '../../controllers/auth/editprofile_controller.dart';
import '../../utils/const/app_color.dart';
import '../../utils/widgets/app_button.dart';
import '../settings_Screen.dart';


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
                  PopupMenuButton<MenuOption>(
                    color: AppColors.white,
                    onSelected: (MenuOption selected) {
                      switch (selected) {
                        case MenuOption.settings:
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SettingsScreen()),
                          );
                          break;
                        case MenuOption.logout:
                        // Perform logout logic here
                       showDialog(
                         context: context,
                         builder: (BuildContext context) {
                           return Dialog(
                             shape:
                             RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                             backgroundColor: Colors.white,
                             child: Container(
                               width: 230,
                               height: 152,
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(20),
                               ),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   SizedBox(
                                     height: 18,
                                   ),
                                   Center(
                                     child: Text(
                                       'Logout?',
                                       style: GoogleFonts.poppins(
                                         fontSize: 18,
                                         color: Colors.black87,
                                         fontWeight: FontWeight.w700,
                                       ),
                                     ),
                                   ),
                                   SizedBox(height: 7),
                                   Text(
                                     'Are you sure you want to logout?',
                                     style: GoogleFonts.poppins(
                                       fontSize: 12.6,
                                       color: Colors.black38,
                                     ),
                                     textAlign: TextAlign.center,
                                   ),
                                   SizedBox(height: 30),
                                   Row(
                                     children: [
                                       Expanded(
                                         child: Container(
                                           width: 140,
                                           height: 53,
                                           decoration: BoxDecoration(
                                               borderRadius: BorderRadius.only(
                                                   bottomLeft: Radius.circular(20)),
                                               border: Border.all(color: Colors.grey.shade300)),
                                           child: Center(
                                             child: GestureDetector(
                                               onTap: () {
                                                 Get.back();
                                               },
                                               child: Text(
                                                 'Cancel',
                                                 style: GoogleFonts.poppins(
                                                   fontSize: 14.2,
                                                   color: Colors.black38,
                                                   fontWeight: FontWeight.w600,
                                                 ),
                                               ),
                                             ),
                                           ),
                                         ),
                                       ),
                                       Expanded(
                                         child: Container(
                                           width: 140,
                                           height: 53,
                                           decoration: BoxDecoration(
                                               borderRadius: BorderRadius.only(
                                                   bottomRight: Radius.circular(20)),
                                               border: Border.all(color: Colors.grey.shade300)),
                                           child: Center(
                                             child: GestureDetector(
                                               onTap: () {
                                                 Get.back();
                                                 _loginController.signOut();
                                               },
                                               child: Text(
                                                 'Logout',
                                                 style: GoogleFonts.poppins(
                                                   fontSize: 14.2,
                                                   color: AppColors.pink,
                                                   fontWeight: FontWeight.w600,
                                                 ),
                                               ),
                                             ),
                                           ),
                                         ),
                                       ),
                                     ],
                                   ),
                                 ],
                               ),
                             ),
                           );
                         },
                       );
                          break;
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return <PopupMenuEntry<MenuOption>>[
                         PopupMenuItem<MenuOption>(
                          value: MenuOption.settings,
                          child: Text('Settings',style: GoogleFonts.poppins(),),
                        ),
                        PopupMenuItem<MenuOption>(
                          value: MenuOption.logout,
                          child: Text('Logout',style: GoogleFonts.poppins(),),
                        ),
                      ];
                    },
                    icon: Icon(Icons.more_horiz_outlined,color: AppColors.pink,size: 32,),
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
                text: 'Save',
                onPressed: () {
                  controller.updateProfile();
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
enum MenuOption { settings, logout }

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text('Settings Page'),
      ),
    );
  }
}
void _showLogoutDialog(BuildContext context) {
  // Add any necessary variables and methods here
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.white,
        child: Container(
          width: 230,
          height: 152,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 18,
              ),
              GestureDetector(
                onTap: () async{
                  Get.back();

                },
                child: Text(
                  'Logout?',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 7),
              Text(
                'Are you sure you want to logout?',
                style: GoogleFonts.poppins(
                  fontSize: 12.6,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 140,
                      height: 53,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20)),
                          border: Border.all(color: Colors.grey.shade300)),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            'Cancel',
                            style: GoogleFonts.poppins(
                              fontSize: 14.2,
                              color: Colors.black38,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 140,
                      height: 53,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20)),
                          border: Border.all(color: Colors.grey.shade300)),
                      child: Center(
                        child: Text(
                          'Logout',
                          style: GoogleFonts.poppins(
                            fontSize: 14.2,
                            color: AppColors.pink,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}