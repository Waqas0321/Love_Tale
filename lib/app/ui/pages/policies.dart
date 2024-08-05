import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Constants/love_tale_Sizes.dart';
import '../../utils/const/app_color.dart';
import '../../utils/const/app_images.dart';
import '../../utils/const/app_strings.dart';
import '../../utils/const/text_style.dart';
import '../../utils/widgets/app_button.dart';
import '../../utils/widgets/policy_grid.dart';

class Policies extends StatelessWidget {
  Policies({super.key});
  final LoveTaleSizes _sizes = LoveTaleSizes();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = _sizes.getScreenWidth();
        double buttonWidth = _sizes.getButtonWidth();
        double contentWidth = _sizes.getscreencontentWidth();
        return Material(
          color: AppColors.white,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(11),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {},
                              child: Icon(Icons.clear, color: AppColors.pink, size: 25)),
                      ],
                    ),
                    Image.asset(AppImages.Artboard_5, height: Get.height / 4),
                    SizedBox(height: LoveTaleSizes.spaceBTWItems),
                    Text(
                      AppString.followTheseClubsRulesWhenUsingThisApp,
                      style: GoogleFonts.poppins(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: LoveTaleSizes.spaceBTWItems),
                    SizedBox(
                      width: screenWidth,
                      child: Column(
                        children: [
                          SizedBox(
                            width: contentWidth,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: GridTextItem(
                                    title: AppString.beRespectfulTitle,
                                    description: AppString.beRespectfulDescription,
                                  ),
                                ),
                                Expanded(
                                  child: GridTextItem(
                                    title: AppString.stayHonestTitle,
                                    description: AppString.stayHonestDescription,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: LoveTaleSizes.spaceBTWItems / 2),
                          SizedBox(
                            width: contentWidth,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: GridTextItem(
                                    title: AppString.protectPrivacyTitle,
                                    description: AppString.protectPrivacyDescription,
                                  ),
                                ),
                                Expanded(
                                  child: GridTextItem(
                                    title: AppString.staySafeTitle,
                                    description: AppString.staySafeDescription,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: LoveTaleSizes.spaceBTWItems),
                    SizedBox(
                      width: buttonWidth,
                      child: CustomButton(
                        text: AppString.i_understand,
                        onPressed: () {
                          Get.toNamed("login_screen");
                        },
                        color: AppColors.pink,
                        textColor: Colors.white,
                        borderRadius: 30.0,
                        padding: 16.0,
                        fontSize: 18.0,
                        height: 56.0, // Custom height
                        width: 500.0, // Custom width
                      ),
                    ),
                    SizedBox(height: LoveTaleSizes.spaceBTWSections),
                    Center(
                      child: Text(
                        AppString.terms_policy,
                        style: CustomTextStyles.bodyText1,
                      ),
                    ),
                    SizedBox(height: LoveTaleSizes.spaceBTWItems)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
