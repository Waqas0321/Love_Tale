// lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:love_tale/app/bindings/bottom_screen.dart';
import 'package:love_tale/app/controllers/auth/register_controller.dart';
import 'package:love_tale/app/ui/pages/Auth/login.dart';
import 'package:love_tale/app/ui/pages/Auth/otp_screen.dart';
import 'package:love_tale/app/ui/pages/Auth/phone_number.dart';
import 'package:love_tale/app/utils/const/app_color.dart';
import '../../../../Constants/love_tale_Sizes.dart';
import '../../../controllers/auth/login.dart';
import '../../../utils/const/app_images.dart';
import '../../../utils/const/app_strings.dart';
import '../../../utils/const/text_style.dart';
import '../../../utils/widgets/app_button.dart';
import '../../../utils/widgets/custom_svg_image.dart';

class RegisterScreen extends GetView<RegisterControler> {
  // Initialize the controller
  final controller = Get.put(RegisterControler());
  final LoveTaleSizes _sizes = LoveTaleSizes();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double contentWidth = _sizes.getscreencontentWidth();
        double buttonWidth = _sizes.getButtonWidth();
        return  Material(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(LoveTaleSizes.defaultPadding),
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(height: LoveTaleSizes.spaceBTWSections * 1.5,),
                      GestureDetector(
                        onTap: () {
                          controller.pickImage();
                        },
                        child: Obx(
                          () =>  Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black,width: 1)
                            ),
                              child:controller.image.value != null? CircleAvatar(
                                backgroundColor: AppColors.pink,
                                backgroundImage: FileImage(controller.image.value!)

                              ):Icon(Icons.person,size: 120,color: Colors.black12,)



                          ),
                        ),
                      ),
                      SizedBox(height: LoveTaleSizes.spaceBTWItems,),
                      Text(
                        AppString.whats_your_mail,
                        style: GoogleFonts.poppins(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Center(
                        child: Text(
                          AppString.dont_loss_the_acess_of_account,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                              color: Color(0xffd9d9d9),
                              letterSpacing: 1),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),

                  // Sub text
                  SizedBox(height: LoveTaleSizes.spaceBTWSections),
                  SizedBox(
                    width: contentWidth,
                    child: Column(
                      children: [
                        // TextFormField for email
                        // TextFormField for email
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Enter your name',
                            labelStyle: TextStyle(
                              color: Color(0xffd9d9d9),
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0.5, // Set the desired border width
                                style: BorderStyle.solid,
                                color: Color(0xffd9d9d9),
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                          onChanged: (value) {},
                        ),
                        SizedBox(height: LoveTaleSizes.spaceBTWItems,),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Enter your email',
                            labelStyle: TextStyle(
                              color: Color(0xffd9d9d9),
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0.5, // Set the desired border width
                                style: BorderStyle.solid,
                                color: Color(0xffd9d9d9),
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                          onChanged: (value) {},
                        ),
                        SizedBox(height: LoveTaleSizes.spaceBTWItems,),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Create Password',
                            labelStyle: TextStyle(
                              color: Color(0xffd9d9d9),
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0.5, // Set the desired border width
                                style: BorderStyle.solid,
                                color: Color(0xffd9d9d9),
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                          onChanged: (value) {},
                        ),
                        SizedBox(height: LoveTaleSizes.spaceBTWItems,),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(
                              color: Color(0xffd9d9d9),
                              fontWeight: FontWeight.w800,
                              fontSize: 15,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 0.5, // Set the desired border width
                                style: BorderStyle.solid,
                                color: Color(0xffd9d9d9),
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                          onChanged: (value) {},
                        ),
                        SizedBox(height: LoveTaleSizes.spaceBTWSections),
                        SizedBox(
                          width: double.infinity * 0.9,
                          child: CustomButton(
                              text: "Sign Up",
                              fontSize: 12,
                              borderRadius: 30,
                              onPressed: () {
                                Get.to(OtpScreen());
                              },
                              height: LoveTaleSizes.buttonHeight,
                              width: 110),
                        ),
                        SizedBox(
                          height: LoveTaleSizes.spaceBTWSections,
                        ),
                      ],
                    ),
                  ),
                  // Row with buttons
                  SizedBox(height: LoveTaleSizes.spaceBTWSections),
                  Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an Account',
                            style: CustomTextStyles.bodyText2?.copyWith(
                              color: AppColors.blue,
                              fontWeight: FontWeight.w500,
                              // Add underline decoration here
                            ),
                          ),
                          SizedBox(width: 6,),
                          GestureDetector(
                            onTap: () {
                              Get.to(LoginScreen());
                            },
                            child: Text(
                              'Login',
                              style: CustomTextStyles.bodyText2?.copyWith(
                                color: AppColors.pink,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline, // Add underline decoration here
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(height: LoveTaleSizes.spaceBTWItems),
                  Center(
                      child: Text(
                        AppString.terms_policy,
                        style: CustomTextStyles.bodyText1,
                      )),
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
