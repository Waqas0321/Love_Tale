import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:love_tale/app/ui/pages/personal_details/picture_upload_screen.dart';

import '../../../../Constants/love_tale_Sizes.dart';
import '../../../utils/const/app_color.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  static bool male =  false;
  static bool female =  false;
  static bool others =  false;
  void maleTogle(){
    setState(() {
      male = !male;
      if(male){
        female = false;
        others = false;
      }
    });

  }
  void femaleTogle() {
    setState(() {
      female = !female;
      if (female) {
        male = false;
        others = false;
      }
    });
  }
    void othersTogle(){
      setState(() {
        others = !others;
        if(others){
          male = false;
          female = false;
        }
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
       return Scaffold(
          backgroundColor: AppColors.white,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(PictureUploadScreen());
            },
            child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    gradient: AppColors.customGradient,
                    shape: BoxShape.circle

                ),
                child: Icon(Icons.navigate_next_sharp,color: Colors.white,size: 32,)), // You can use any icon you prefer
            shape: CircleBorder(), // Ensures the button is circular
            backgroundColor: Colors.black, // Set the background color
            elevation: 6, // Add elevation for a shadow effect
          ),
          body: SafeArea(
              child:isMobile? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only( top: 30),
                    child: Column(
                      children: [
                        Text(
                          "How do you identify?",
                          style: GoogleFonts.poppins(fontSize: 21, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "Pick which best describe you.",
                          style: GoogleFonts.poppins(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: !male? Colors.transparent : Colors.black
                              ),
                              onPressed: () {
                                setState(() {
                                  maleTogle();
                                });

                              }, child: Text('Male',style: GoogleFonts.poppins(fontSize: 18,color:male? Colors.white:Colors.black),)),
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          height: 56,
                          width: double.infinity,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: !female? Colors.transparent : Colors.black
                              ),
                              onPressed: () {
                                femaleTogle();
                              }, child: Text('Female',style: GoogleFonts.poppins(fontSize: 18,color: female? Colors.white:Colors.black),)),
                        ),
                        SizedBox(height: 8),
                        SizedBox(
                          height: 56,
                          width: double.infinity,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  backgroundColor: !others? Colors.transparent : Colors.black
                              ),
                              onPressed: () {
                                othersTogle();
                              }, child: Text('Others',style: GoogleFonts.poppins(fontSize: 18,color: others? Colors.white:Colors.black),)),
                        ),
                      ],),
                  )


                ],
              ):Center(
                child: Container(
                  width: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only( top: 30),
                        child: Column(
                          children: [
                            Text(
                              "How do you identify?",
                              style: GoogleFonts.poppins(fontSize: 21, fontWeight: FontWeight.w800),
                            ),
                            Text(
                              "Pick which best describe you.",
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 18),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 56,
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: !male? Colors.transparent : Colors.black
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      maleTogle();
                                    });

                                  }, child: Text('Male',style: GoogleFonts.poppins(fontSize: 18,color:male? Colors.white:Colors.black),)),
                            ),
                            SizedBox(height: 8),
                            SizedBox(
                              height: 56,
                              width: double.infinity,
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: !female? Colors.transparent : Colors.black
                                  ),
                                  onPressed: () {
                                    femaleTogle();
                                  }, child: Text('Female',style: GoogleFonts.poppins(fontSize: 18,color: female? Colors.white:Colors.black),)),
                            ),
                            SizedBox(height: 8),
                            SizedBox(
                              height: 56,
                              width: double.infinity,
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: !others? Colors.transparent : Colors.black
                                  ),
                                  onPressed: () {
                                    othersTogle();
                                  }, child: Text('Others',style: GoogleFonts.poppins(fontSize: 18,color: others? Colors.white:Colors.black),)),
                            ),
                          ],),
                      )


                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}


