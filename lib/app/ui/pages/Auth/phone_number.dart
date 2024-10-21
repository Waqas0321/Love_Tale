import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Constants/love_tale_Sizes.dart';
import '../../../controllers/auth/phone.dart';
import '../../../utils/const/app_color.dart';
import '../../../utils/const/app_strings.dart';
import '../../../utils/const/text_style.dart';
import '../../../utils/widgets/app_button.dart';
import 'otp_screen.dart';

class PhoneScreen extends StatelessWidget {
  final PhoneController _controller = Get.put(PhoneController());
  final LoveTaleSizes _sizes = LoveTaleSizes();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double contentWidth = _sizes.getscreencontentWidth();
        bool isMobile = _sizes.isMobileFun();
        bool isDesktop = _sizes.isDesktopFun();
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: isMobile ? AppBar(
            title: Text(
              AppString.My_phone_number,
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            foregroundColor: Colors.pink,
            backgroundColor: AppColors.white,
          ): null,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(LoveTaleSizes.defaultPadding),
                child: Obx(() => Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: LoveTaleSizes.spaceBTWItems),
                      SizedBox(
                        child: isDesktop ? Text(
                          AppString.My_phone_number,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ): null,
                      ),
                      SizedBox(height: LoveTaleSizes.spaceBTWItems),
                      SizedBox(
                        width: contentWidth,
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: LoveTaleSizes.spaceBTWItems),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  SizedBox(height: LoveTaleSizes.spaceBTWSections),
                                  CountryCodePicker(
                                    onChanged: (countryCode) {
                                      _controller.updateDialCode(countryCode.dialCode!);
                                    },
                                    initialSelection: 'US',
                                    showCountryOnly: false,
                                    showFlagDialog: true,
                                    showOnlyCountryWhenClosed: false,
                                    alignLeft: true,
                                    padding: EdgeInsets.zero,
                                    showFlag: true, // Show the flag
                                    textStyle: TextStyle(
                                      fontSize: 16,
                                    ),
                                    builder: (countryCode) {
                                      return Row(
                                        children: [
                                          // Display the flag image
                                          Image.asset(
                                            countryCode!.flagUri??'',
                                            package: 'country_code_picker',
                                            width: 32.0,
                                            height: 24.0,
                                          ),
                                          SizedBox(width: 8), // Add some spacing
                                          // Display the dial code
                                          Text(
                                            "${countryCode.code}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),

                                  Divider(
                                    color: Colors.black54,
                                    thickness: 1.0,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: LoveTaleSizes.spaceBTWItems),
                            Expanded(
                              flex: 4,
                              child: Column(
                                children: [
                                  TextField(
                                    keyboardType: TextInputType.phone,
                                    onChanged: (text) {
                                      _controller.updatePhoneNumber(text);
                                    },
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(), // No border
                                      labelText: 'Phone Number',
                                      labelStyle: CustomTextStyles.subtitle2,
                                      prefixText: _controller.dialCode.value, // Show dial code as prefix
                                      prefixStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  // Divider(
                                  //   color: Colors.grey,
                                  //   thickness: 1.0,
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: LoveTaleSizes.spaceBTWSections),
                      Container(
                        padding: EdgeInsets.only(left: 10,right: 12),
                        height: 186,
                        width: 400,
                        child: RichText(
                          textAlign: TextAlign.start,
                          textDirection: TextDirection.ltr,
                          softWrap: true,
                          maxLines: null,
                          textScaleFactor: 1,
                          text: TextSpan(
                            text: ' ',
                            children: <TextSpan>[
                              TextSpan(
                                text: AppString.phone_continue,
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black38,
                                  ),
                                ),
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()..onTap = () {},
                                text: AppString.learn_what_happend_when_number_change,
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: LoveTaleSizes.spaceBTWSections),
                      CustomButton(
                        text: AppString.continues,
                        borderRadius: 32,
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(27.0)),
                            ),
                            builder: (context) => _buildBottomSheet(context),
                          );
                        },
                        height:LoveTaleSizes.buttonHeight,
                        width: 350,
                      )
                    ],
                  ),
                )),
              ),
            ),
          ),
        );
      },

    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      width: 400,
      height: 193,
      padding: EdgeInsets.only(left: 15,right: 15,top: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: LoveTaleSizes.spaceBTWItems,),
          Text(
            AppString.continuewith,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: LoveTaleSizes.spaceBTWItems),
          Text(
            AppString.No,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87),
          ),
          SizedBox(height: LoveTaleSizes.spaceBTWItems),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: CustomButton(text: "Continue", onPressed: () => Get.to(OtpScreen()), height: 40, width: 200,borderRadius: 50,),
            // child: Text(
            //   AppString.none_of_the_above,
            //   style: TextStyle(fontSize: 18, color: AppColors.pink,fontWeight: FontWeight.w600,),
            // ),
          ),
        ],
      ),
    );
  }
}
