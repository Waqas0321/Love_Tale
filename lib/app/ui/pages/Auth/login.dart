// lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:love_tale/app/ui/pages/Auth/phone_number.dart';
import '../../../controllers/auth/login.dart';
import '../../../utils/const/app_images.dart';
import '../../../utils/const/app_strings.dart';
import '../../../utils/const/text_style.dart';
import '../../../utils/widgets/app_button.dart';
import '../../../utils/widgets/custom_svg_image.dart';

class LoginScreen extends GetView<LoginController> {
  // Initialize the controller
  final controller = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height:10,),
              CustomSvgImage(
                assetPath: AppImages.login_svg,
                height: 220,
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
              Text(
                AppString.whats_your_mail,
                style: GoogleFonts.poppins(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),

              // Sub text
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

              SizedBox(height: 30),

              // TextFormField for email
              TextFormField(
                obscureText: true,
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
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                onChanged: (value) {},
              ),

              SizedBox(height: 30),

              // Row with buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                      text: "Continue",
                      fontSize: 12,
                      borderRadius: 30,
                      onPressed: () {
                        Get.to(PhoneScreen());
                      },
                      height: 50,
                      width: 110),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 4,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.onContinueWithGoogle();
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(20, 20),
                        backgroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 13),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
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
                          Text(
                            'Continue with Google',
                            style: CustomTextStyles.bodyText1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  CustomButton(
                      text: "Continue",
                      imagePath: AppImages.apple,
                      showImage: true,
                      fontSize: 12,
                      borderRadius: 30,
                      onPressed: () {
                        Get.to(PhoneScreen());
                      },
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2.3),
                  SizedBox(
                    width: 15,
                  ),
                  CustomButton(
                      text: "Continue",
                      fontSize: 12,
                      imagePath: AppImages.facebook,
                      showImage: true,
                      borderRadius: 30,
                      onPressed: () {
                        Get.to(PhoneScreen());
                      },
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2.3),
                ],
              ),
             SizedBox(height:60,),
              Center(
                  child: Text(
                    AppString.terms_policy,
                    style: CustomTextStyles.bodyText1,
                  )),
              SizedBox(height: 12,)
            ],
          ),
        ),
      ),
    );
  }
}
