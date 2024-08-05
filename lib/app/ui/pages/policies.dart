import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/const/app_color.dart';
import '../../utils/const/app_images.dart';
import '../../utils/const/app_strings.dart';
import '../../utils/const/text_style.dart';
import '../../utils/widgets/app_button.dart';
import '../../utils/widgets/policy_grid.dart';

class Policies extends StatelessWidget {
  const Policies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 28,
            ),
            InkWell(
              onTap: () {},
              child: Icon(Icons.clear,color: AppColors.pink,size: 25,),
            ),
            Image.asset(AppImages.Artboard_5),
            SizedBox(height: 20),

            // One-line text
            Text(
              AppString.followTheseClubsRulesWhenUsingThisApp,
              style: GoogleFonts.poppins(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 18),

            // 2x2 Grid of text items
            Container(
              height: 250,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 10,
                childAspectRatio:
                    2, // Adjust this to control the height of the items0
                children: [
                  GridTextItem(
                    title: AppString.beRespectfulTitle,
                    description: AppString.beRespectfulDescription,
                  ),
                  GridTextItem(
                    title: AppString.stayHonestTitle,
                    description: AppString.stayHonestDescription,
                  ),
                  GridTextItem(
                    title: AppString.protectPrivacyTitle,
                    description: AppString.protectPrivacyDescription,
                  ),
                  GridTextItem(
                    title: AppString.stayHonestTitle,
                    description: AppString.stayHonestDescription,
                  ),
                ],
              ),
            ),
            CustomButton(
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
            Spacer(),
            Center(
                child: Text(
              AppString.terms_policy,
              style: CustomTextStyles.bodyText1,
            )),
            SizedBox(height: 12,)
          ],
        ),
      ),
    );
  }
}
