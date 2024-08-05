import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../../bindings/bottom_screen.dart';
import '../../../controllers/personal_controller.dart';
import '../../../utils/const/app_color.dart';
import '../../../utils/const/app_strings.dart';
import '../../../utils/widgets/app_button.dart';
import '../../../utils/widgets/date_picker.dart';
import 'location_Screen.dart';

class PersonalInfoScreen extends StatelessWidget {
  final PersonalInfoController _controller = Get.put(PersonalInfoController());
  String _locationDetail = 'No location selected'; // State variable to hold location

  final RxList<String> options = ["Female", "Male"].obs;
  final RxList<String> Options = ["Straight", "Other"].obs;
   String  result="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 13),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 48),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back_rounded,
                        color: Colors.pink, size: 27),
                  ),
                  SizedBox(width: 103.5),
                  Text(
                    "Personal",
                    style: GoogleFonts.poppins(
                      fontSize: 23,
                      color: Colors.black87,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 26),
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
                    SizedBox(height: 19),
                    Text(
                      AppString.firstname,
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    Text(
                      AppString.john_doe,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.pink,
                      ),
                    ),
                    SizedBox(height: 6),
                    Divider(),
                    SizedBox(height: 6),
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
              SizedBox(height: 18),
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
                    SizedBox(height: 9),
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
                          groupValue: _controller.selectedGender.value,
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
                          groupValue: _controller.selectedGender.value,
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
                       SizedBox(height: 17),
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
                          groupValue: _controller.selectedSexuality.value,
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
                          groupValue: _controller.selectedSexuality.value,
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

              SizedBox(height: 17),
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
                    SizedBox(height: 19),
                    InkWell(
                      onTap:()async{
                        var result = await Get.to(() => LocationScreen());
                        if (result != null) {
                           print(result);
                            _locationDetail = result; // Update the state with the result

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

                    SizedBox(height: 10),
                    Text(
                     _locationDetail,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.pink,
                      ),
                    ),
                    SizedBox(height: 6),
                    Divider(),
                    SizedBox(height: 6),
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
              SizedBox(height: 17),
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
                    SizedBox(height: 16),
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
              SizedBox(height:18),
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
                height: 56.0, // Custom height
                width: 400.0, // Custom width
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
   
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
