import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:love_tale/app/ui/pages/Auth/location_Screen.dart';
import 'package:love_tale/app/ui/pages/personal_details/location_screen.dart';

import '../../../../Constants/love_tale_Sizes.dart';
import '../../../utils/const/app_color.dart';
import '../../../utils/widgets/app_button.dart';
class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  int? _selectedValue; // This will store the selected value

  void _onChanged(int? value) {
    setState(() {
      _selectedValue = value;
    });
  }
  final LoveTaleSizes _sizes = LoveTaleSizes();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double contentWidth = _sizes.getscreencontentWidth();
        bool isMobile = _sizes.isMobileFun();
        bool isDesktop = _sizes.isDesktopFun();
        return  Scaffold(
            appBar: AppBar(
              foregroundColor: AppColors.pink,
              backgroundColor: AppColors.white,
            ),
          backgroundColor: AppColors.white,
          body:isMobile? SafeArea(
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        Text(
                          "Who would you like to see?",
                          style:
                          GoogleFonts.poppins(fontSize: 21, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "We want to make sure we find the right for you. You can always update this later",
                          style: GoogleFonts.poppins(fontSize: 16),
                        ),
                        SizedBox(height: 18),
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(36),
                              color: AppColors.white,
                              border: Border.all(color: Colors.black45, width: 1)

                          ),
                          child: RadioListTile<int>(
                            title: Text("I'd liek to see men"),
                            value: 1,
                            groupValue: _selectedValue,
                            onChanged: _onChanged,
                            activeColor: AppColors.pink,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(36),
                              color: AppColors.white,
                              border: Border.all(color: Colors.black45, width: 1)
                          ),
                          child: RadioListTile<int>(
                            title: Text("I'd liek to see women"),
                            value: 2,
                            groupValue: _selectedValue,
                            onChanged: _onChanged,
                            activeColor: AppColors.pink,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(36),
                              color: AppColors.white,
                              border: Border.all(color: Colors.black45, width: 1)
                          ),
                          child: RadioListTile<int>(
                            title: Text("I'd liek to see everyone"),
                            value: 3,
                            groupValue: _selectedValue,
                            onChanged: _onChanged,
                            activeColor: AppColors.pink,
                            controlAffinity: ListTileControlAffinity.trailing,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                        height: 55,
                        width: double.infinity,
                        child: CustomButton(
                          text: "Continue",
                          borderRadius: 32,
                          onPressed: () {
                            Get.to(LocationMapScreen());

                          },
                          height: LoveTaleSizes.buttonHeight,
                          width: 327,
                        ),
                      ),
                    ))
              ],
            ),
          ):SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 400,
                    child: Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Column(
                              children: [
                                SizedBox(height: 30),
                                Text(
                                  "Who would you like to see?",
                                  style:
                                  GoogleFonts.poppins(fontSize: 21, fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  "We want to make sure we find the right for you. You can always update this later",
                                  style: GoogleFonts.poppins(fontSize: 16),
                                ),
                                SizedBox(height: 18),
                                Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(36),
                                      color: AppColors.white,
                                      border: Border.all(color: Colors.black45, width: 1)

                                  ),
                                  child: RadioListTile<int>(
                                    title: Text("I'd liek to see men"),
                                    value: 1,
                                    groupValue: _selectedValue,
                                    onChanged: _onChanged,
                                    activeColor: AppColors.pink,
                                    controlAffinity: ListTileControlAffinity.trailing,
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(36),
                                      color: AppColors.white,
                                      border: Border.all(color: Colors.black45, width: 1)
                                  ),
                                  child: RadioListTile<int>(
                                    title: Text("I'd liek to see women"),
                                    value: 2,
                                    groupValue: _selectedValue,
                                    onChanged: _onChanged,
                                    activeColor: AppColors.pink,
                                    controlAffinity: ListTileControlAffinity.trailing,
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(36),
                                      color: AppColors.white,
                                      border: Border.all(color: Colors.black45, width: 1)
                                  ),
                                  child: RadioListTile<int>(
                                    title: Text("I'd liek to see everyone"),
                                    value: 3,
                                    groupValue: _selectedValue,
                                    onChanged: _onChanged,
                                    activeColor: AppColors.pink,
                                    controlAffinity: ListTileControlAffinity.trailing,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: SizedBox(
                        height: 55,
                        width: 350,
                        child: CustomButton(
                          text: "Continue",
                          borderRadius: 32,
                          onPressed: () {
                            Get.to(LocationMapScreen());

                          },
                          height: LoveTaleSizes.buttonHeight,
                          width: 327,
                        ),
                      ))
                ],
              ),
            ),
          )
        );
      },
    );
  }
}
