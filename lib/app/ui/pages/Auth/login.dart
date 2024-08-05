// lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:love_tale/app/ui/pages/Auth/phone_number.dart';
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
                  SizedBox(
                    width: contentWidth,
                    child: Column(
                      children: [
                        // TextFormField for email
                        // TextFormField for email
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: CustomButton(
                                  text: "Continue",
                                  fontSize: 12,
                                  borderRadius: 30,
                                  onPressed: () {
                                    Get.to(PhoneScreen());
                                  },
                                  height: LoveTaleSizes.buttonHeight,
                                  width: 110),
                            ),
                            SizedBox(
                              width: LoveTaleSizes.spaceBTWItems,
                            ),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.onContinueWithGoogle();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  // padding:
                                  //     EdgeInsets.symmetric(vertical: 14, horizontal: 13),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                                child: SizedBox(
                                  height: LoveTaleSizes.buttonHeight,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "OR",
                                        style: CustomTextStyles.bodyText1,
                                      ),
                                      Image.asset(
                                        AppImages.image,
                                        height: 20,
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Text(
                                          'Continue with Google',
                                          maxLines: 2,
                                          style: CustomTextStyles.bodyText1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
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
                                      Get.to(PhoneScreen());
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
                                      Get.to(PhoneScreen());
                                    },
                                    height: LoveTaleSizes.buttonHeight,
                                    width: buttonWidth),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Row with buttons
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
