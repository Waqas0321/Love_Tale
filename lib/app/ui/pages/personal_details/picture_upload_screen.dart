import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:love_tale/app/ui/pages/Auth/location_Screen.dart';
import 'package:love_tale/app/ui/pages/personal_details/insterest_screen.dart';
import 'package:love_tale/app/utils/widgets/app_button.dart';

import '../../../../Constants/love_tale_Sizes.dart';
import '../../../utils/const/app_color.dart';
import 'location_screen.dart';
class PictureUploadScreen extends StatefulWidget {
  const PictureUploadScreen({super.key});

  @override
  State<PictureUploadScreen> createState() => _PictureUploadScreenState();
}

class _PictureUploadScreenState extends State<PictureUploadScreen> {
  File? _image;

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
  File? _image2;

  Future<void> pickImage2() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image2 = File(pickedFile.path);
      });
    }
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
          appBar: AppBar(
            foregroundColor: AppColors.pink,
            backgroundColor: AppColors.white,
          ),
          backgroundColor: AppColors.white,
          body: isMobile?SafeArea(
            child: Stack(
                children:[
                  Center(
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        Text(
                          "Choose your Photos",
                          style: GoogleFonts.poppins(fontSize: 21, fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "Upload at least 1 photo to get started",
                          style: GoogleFonts.poppins(fontSize: 16),
                        ),
                        SizedBox(height: 18),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              clipBehavior: Clip.antiAlias,
                              height: 230,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                color: Color(0xffd1dcdc),
                                image: _image != null
                                    ? DecorationImage(
                                  image: FileImage(_image!),
                                  fit: BoxFit.cover,
                                )
                                    : null,
                                borderRadius: BorderRadius.circular(26),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 110,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          if (_image == null)
                                            Icon(
                                              Icons.camera_alt,
                                              size: 42,
                                              color: Colors.black54,
                                            ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            height: 30,
                                            width: 30,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                pickImage();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                shape: CircleBorder(),
                                                padding: EdgeInsets.all(0),
                                                backgroundColor: Colors.white,
                                              ),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.black,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Container(
                              padding: EdgeInsets.all(12),
                              clipBehavior: Clip.antiAlias,
                              height: 230,
                              width: MediaQuery.of(context).size.width * 0.4,
                              decoration: BoxDecoration(
                                color: Color(0xffd1dcdc),
                                image: _image2 != null
                                    ? DecorationImage(
                                  image: FileImage(_image2!),
                                  fit: BoxFit.cover,
                                )
                                    : null,
                                borderRadius: BorderRadius.circular(26),
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 110,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          if (_image2 == null)
                                            Icon(
                                              Icons.camera_alt,
                                              size: 42,
                                              color: Colors.black54,
                                            ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            height: 30,
                                            width: 30,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                pickImage2();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                shape: CircleBorder(),
                                                padding: EdgeInsets.all(0),
                                                backgroundColor: Colors.white,
                                              ),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.black,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
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
                            text: "Upload Photos",
                            borderRadius: 32,
                            onPressed: () {
                              Get.to(InterestScreen());

                            },
                            height: LoveTaleSizes.buttonHeight,
                            width: 327,
                          ),
                        ),
                      ))]

            ),
          ):SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 30),
                      Text(
                        "Choose your Photos",
                        style: GoogleFonts.poppins(fontSize: 21, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        "Upload at least 1 photo to get started",
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                      SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            clipBehavior: Clip.antiAlias,
                            height: 230,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Color(0xffd1dcdc),
                              image: _image != null
                                  ? DecorationImage(
                                image: FileImage(_image!),
                                fit: BoxFit.cover,
                              )
                                  : null,
                              borderRadius: BorderRadius.circular(26),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 110,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        if (_image == null)
                                          Icon(
                                            Icons.camera_alt,
                                            size: 42,
                                            color: Colors.black54,
                                          ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              pickImage();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: CircleBorder(),
                                              padding: EdgeInsets.all(0),
                                              backgroundColor: Colors.white,
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.black,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Container(
                            padding: EdgeInsets.all(12),
                            clipBehavior: Clip.antiAlias,
                            height: 230,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Color(0xffd1dcdc),
                              image: _image2 != null
                                  ? DecorationImage(
                                image: FileImage(_image2!),
                                fit: BoxFit.cover,
                              )
                                  : null,
                              borderRadius: BorderRadius.circular(26),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 110,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        if (_image2 == null)
                                          Icon(
                                            Icons.camera_alt,
                                            size: 42,
                                            color: Colors.black54,
                                          ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              pickImage2();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: CircleBorder(),
                                              padding: EdgeInsets.all(0),
                                              backgroundColor: Colors.white,
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.black,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: SizedBox(
                      height: 55,
                      width: 400,
                      child: CustomButton(
                        text: "Upload Photos",
                        borderRadius: 32,
                        onPressed: () {
                          Get.to(InterestScreen());

                        },
                        height: LoveTaleSizes.buttonHeight,
                        width: 327,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}