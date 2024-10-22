// lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:love_tale/app/bindings/bottom_screen.dart';
import 'package:love_tale/app/ui/pages/Auth/otp_screen.dart';
import 'package:love_tale/app/ui/pages/Auth/phone_number.dart';
import 'package:love_tale/app/ui/pages/Auth/register_screen.dart';
import 'package:love_tale/app/utils/const/app_color.dart';
import '../../../../Constants/love_tale_Sizes.dart';
import '../../../controllers/auth/login.dart';
import '../../../utils/const/app_images.dart';
import '../../../utils/const/app_strings.dart';
import '../../../utils/const/text_style.dart';
import '../../../utils/widgets/app_button.dart';
import '../../../utils/widgets/custom_svg_image.dart';

class LoginScreen extends GetView<LoginController> {
  // Initialize the controller
  final controller = Get.find<LoginController>();
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
                      CustomSvgImage(
                        assetPath: AppImages.login_svg,
                        height: Get.height / 4,
                        width: MediaQuery.of(context).size.width,
                        color: Color(0xfff980ae),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60),
                        child: CustomSvgImage(
                          assetPath: AppImages.logo,
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          color: Color(0xfff980ae),
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
                  SizedBox(height: LoveTaleSizes.spaceBTWSections),
                  SizedBox(
                    width: contentWidth,
                    child: Column(
                      children: [
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
                        SizedBox(
                          width: contentWidth,
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                    text: "Continue",
                                    imagePath: AppImages.apple,
                                    showImage: true,
                                    fontSize: 11,
                                    borderRadius: 30,
                                    onPressed: () {
                                    },
                                    height: LoveTaleSizes.buttonHeight,
                                    width: MediaQuery.of(context).size.width / 2.3),
                              ),
                              SizedBox(width: LoveTaleSizes.spaceBTWItems,),
                              Expanded(
                                child: CustomButton(
                                    text: "Continue",
                                    fontSize: 12,
                                    imagePath: AppImages.facebook,
                                    showImage: true,
                                    borderRadius: 30,
                                    onPressed: () {
                                    },
                                    height: LoveTaleSizes.buttonHeight,
                                    width: buttonWidth),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: LoveTaleSizes.spaceBTWItems,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Expanded(
                              child: SizedBox(
                                width: Get.width * 0.5,
                                child: CustomButton(
                                    text: "Continue",
                                    fontSize: 12,
                                    showIcon: true,
                                    borderRadius: 30,
                                    onPressed: () {
                                      Get.to(PhoneScreen());
                                    },
                                    height: LoveTaleSizes.buttonHeight,
                                    width: 110),
                              ),
                            ),
                            SizedBox(width: LoveTaleSizes.spaceBTWItems),
                            Expanded(
                              child: SizedBox(
                                width: Get.width * 0.5,
                                child: CustomButton(
                                    text: "Continue",
                                    fontSize: 12,
                                    gradientColor: false,
                                    showImage: true,
                                    textColor: Colors.black,
                                    imagePath: 'assets/images/img_1.png',
                                    borderRadius: 30,
                                    onPressed: () async {
                                      controller.onContinueWithGoogle();
                                      final user = await controller.signInWithGoogle();
                                      if(user != null){
                                        Get.snackbar('Congratulations ${user.displayName}', 'Welcome to the Love Tale');
                                        Get.to(BottomScreen());
                                      }else{
                                        Get.snackbar('Error', 'Not SignIn on Love Tale');
                                      }
                                    },
                                    height: LoveTaleSizes.buttonHeight,
                                    width: 110),
                              ),
                            )
                          ],)
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
                            "Don't have any Account",
                            style: CustomTextStyles.bodyText2?.copyWith(
                              color: AppColors.blue,
                              fontWeight: FontWeight.w500,
                              // Add underline decoration here
                            ),
                          ),
                          SizedBox(width: 6,),
                          GestureDetector(
                            onTap: () {
                              Get.to(RegisterScreen());
                            },
                            child: Text(
                              'Register Now',
                              style: CustomTextStyles.bodyText2?.copyWith(
                                color: AppColors.pink,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline, // Add underline decoration here
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(height: LoveTaleSizes.spaceBTWSections),
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
