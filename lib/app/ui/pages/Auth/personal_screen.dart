import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:love_tale/Constants/love_tale_Sizes.dart';
import '../../../bindings/bottom_screen.dart';
import '../../../controllers/personal_controller.dart';
import '../../../utils/const/app_color.dart';
import '../../../utils/const/app_strings.dart';
import '../../../utils/widgets/app_button.dart';
import '../../../utils/widgets/date_picker.dart';
import 'location_Screen.dart';

class PersonalInfoScreen extends StatelessWidget {
  final PersonalInfoController _controller = Get.put(PersonalInfoController());
  String _locationDetail =
      'No location selected'; // State variable to hold location
  final LoveTaleSizes _sizes = LoveTaleSizes();

  final RxList<String> options = ["Female", "Male"].obs;
  final RxList<String> Options = ["Straight", "Other"].obs;
  String result = "";

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double contentWidth = _sizes.getscreencontentWidth();
        bool isMobile = _sizes.isMobileFun();
        bool isDesktop = _sizes.isDesktopFun();
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: isMobile
              ? AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  title: Text(
                    "Personal",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  foregroundColor: Colors.pink,
                )
              : null,
          body: SafeArea(
            child: Center(
              child: Container(
                width: contentWidth,
                padding: EdgeInsets.all(LoveTaleSizes.defaultPadding),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: isDesktop ? Text(
                          "Personal",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ): null,
                      ),

                      SizedBox(height: LoveTaleSizes.spaceBTWSections),
                      Container(
                        height: 140,
                        width: 320,
                        padding: EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: LoveTaleSizes.spaceBTWItems),
                            Text(
                              AppString.firstname,
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            SizedBox(height: LoveTaleSizes.spaceBTWItems),
                            Text(
                              AppString.john_doe,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.pink,
                              ),
                            ),
                            SizedBox(height: LoveTaleSizes.spaceBTWItems / 1.3),
                            Divider(),
                            SizedBox(height: LoveTaleSizes.spaceBTWItems / 1.3),
                            Text(
                              AppString.appear_dater,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: LoveTaleSizes.spaceBTWItems),
                      buildDatePickerField(context, _controller),
                      SizedBox(height: 18),
                      Container(
                        height: 140,
                        width: 320,
                        padding: EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: LoveTaleSizes.spaceBTWItems),
                            Text(
                              'Gender',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Female'),
                                Obx(() => Radio<String>(
                                      value: 'female',
                                      groupValue:
                                          _controller.selectedGender.value,
                                      onChanged: (gender) {
                                        _controller.updateGender(gender!);
                                      },
                                      activeColor: AppColors.pink,
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Male'),
                                Obx(() => Radio<String>(
                                      value: 'male',
                                      groupValue:
                                          _controller.selectedGender.value,
                                      onChanged: (gender) {
                                        _controller.updateGender(gender!);
                                      },
                                      activeColor: AppColors.pink,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: LoveTaleSizes.spaceBTWItems * 1.3),
                      Container(
                        height: 140,
                        width: 320,
                        padding: EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 9),
                            Text(
                              'Sexuality',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Straight'),
                                Obx(() => Radio<String>(
                                      value: 'straight',
                                      groupValue:
                                          _controller.selectedSexuality.value,
                                      onChanged: (sexuality) {
                                        _controller.updateSexuality(sexuality!);
                                      },
                                      activeColor: AppColors.pink,
                                    )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Others'),
                                Obx(() => Radio<String>(
                                      value: 'other',
                                      groupValue:
                                          _controller.selectedSexuality.value,
                                      onChanged: (sexuality) {
                                        _controller.updateSexuality(sexuality!);
                                      },
                                      activeColor: AppColors.pink,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: LoveTaleSizes.spaceBTWItems * 1.2),
                      Container(
                        height: 140,
                        width: 320,
                        padding: EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: LoveTaleSizes.spaceBTWItems * 1.3),
                            InkWell(
                              onTap: () async {
                                var result =
                                    await Get.to(() => LocationScreen());
                                if (result != null) {
                                  print(result);
                                  _locationDetail =
                                      result; // Update the state with the result
                                }
                              },
                              child: Text(
                                AppString.location,
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ),
                            SizedBox(height: LoveTaleSizes.spaceBTWItems),
                            Text(
                              _locationDetail,
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: AppColors.pink,
                              ),
                            ),
                            SizedBox(height: LoveTaleSizes.spaceBTWItems / 1.3),
                            Divider(),
                            SizedBox(height: LoveTaleSizes.spaceBTWItems / 1.3),
                            Text(
                              AppString.appear_dater,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: LoveTaleSizes.spaceBTWItems * 1.2),
                      Container(
                        height: 140,
                        width: 320,
                        padding: EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: LoveTaleSizes.spaceBTWItems),
                            Text(
                              AppString.add_photo,
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            IconButton(
                              icon: Icon(Icons.camera, color: AppColors.pink),
                              onPressed: _pickImage,
                            ),
                            Divider(),
                            SizedBox(height: 3),
                            Text(
                              AppString.appear_dater,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: LoveTaleSizes.spaceBTWItems),
                      CustomButton(
                        text: AppString.done,
                        onPressed: () {
                          Get.to(BottomScreen());
                        },
                        color: AppColors.pink,
                        textColor: Colors.white,
                        borderRadius: 30.0,
                        padding: 16.0,
                        fontSize: 18.0,
                        height: 56.0,
                        // Custom height
                        width: contentWidth / 1.3, // Custom width
                      ),
                      SizedBox(height: LoveTaleSizes.spaceBTWItems * 1.3),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // Handle the selected image
      print('Image selected: ${image.path}');
    } else {
      print('No image selected.');
    }
  }
}
