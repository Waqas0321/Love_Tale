import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:love_tale/Constants/love_tale_Sizes.dart';
import 'package:love_tale/app/ui/pages/matchesMessagesTabBar.dart';
import 'package:love_tale/app/ui/settings_Screen.dart';
import '../controllers/auth/filter_controller.dart';
import '../utils/const/app_color.dart';
import '../utils/const/app_images.dart';
import '../utils/widgets/app_button.dart';


class Filters extends StatelessWidget {
  final FiltersController controller = Get.put(FiltersController());
  LoveTaleSizes _sizes = LoveTaleSizes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(67),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: AppColors.customGradient,
            ),
          ),
          title: Row(
            children: [
              CircleAvatar(
                radius: 19,
                backgroundImage: AssetImage(AppImages.Pic6), // Replace with actual image URL
              ),
              SizedBox(width: 10),
              Text(
                'Celina',
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Settings(),));
                  },
                  child: Icon(Icons.settings, color: Colors.black54,size: 22,)),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.5,
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double contentWidth = _sizes.getscreencontentWidth();
          bool isDesktop = _sizes.isDesktopFun();
          return Container(
            padding: EdgeInsets.only(left: 15, top: 17, right: 15),
            child: Center(
              child: SizedBox(
                width: contentWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: isDesktop? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Filters",
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              color: Colors.black87,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ):Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back_rounded, color: Colors.pink, size: 27),
                          ),
                          SizedBox(width: 105),
                          Text(
                            "Filters",
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              color: Colors.black87,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 23),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'View Style',
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Obx(() => Radio<String>(
                                          value: 'Classic',
                                          groupValue: controller.selectedValue.value,
                                          onChanged: (String? value) {
                                            controller.updateSelectedValue(value);
                                          },
                                          activeColor: AppColors.pink,
                                        )),
                                        const Text('Classic'),
                                        const SizedBox(width: 55),
                                        Obx(() => Radio<String>(
                                          value: 'Gallery',
                                          groupValue: controller.selectedValue.value,
                                          onChanged: (String? value) {
                                            controller.updateSelectedValue(value);
                                          },
                                          activeColor: AppColors.pink,
                                        )),
                                        const Text('Gallery'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ' Location',
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    Container(
                                      height: 50,
                                      width: 320,
                                      padding: EdgeInsets.only(left: 14, right: 14),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade50,
                                        border: Border.all(color: Colors.grey.shade300),
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 14),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              SizedBox(width: 3),
                                              Icon(
                                                Icons.location_on,
                                                color: Colors.grey.shade500,
                                                size: 22,
                                              ),
                                              SizedBox(width: 3),
                                              Text(
                                                "Current location",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                              SizedBox(width: 6),
                                              Expanded(
                                                child: Text(
                                                  "(San Francisco)",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 12.4,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black38,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 19),
                                    Container(
                                      height: 100,
                                      width: 320,
                                      padding: EdgeInsets.only(left: 14, right: 14),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade50,
                                        border: Border.all(color: Colors.grey.shade300),
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 7),
                                          Text(
                                            'Distance',
                                            style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Obx(() => Text(
                                              '${controller.ageValues.value.start.round()}-${controller.ageValues.value.end.round()} miles',
                                              style: GoogleFonts.poppins(
                                                color: Colors.black54,
                                                fontSize: 11.6,
                                              ),
                                            )),
                                          ),
                                          Expanded(
                                            child: Obx(() => SliderTheme(
                                              data: SliderThemeData(
                                                activeTrackColor: AppColors.pink,
                                                inactiveTrackColor: Colors.grey.withOpacity(0.3),
                                                trackHeight: 2.0,
                                                thumbColor: AppColors.pink,
                                                overlayColor: AppColors.white.withOpacity(0.2),
                                                activeTickMarkColor: AppColors.pink,
                                                inactiveTickMarkColor: AppColors.pink,
                                                valueIndicatorColor: Colors.grey.shade300,
                                                valueIndicatorTextStyle: TextStyle(
                                                  color: AppColors.pink,
                                                ),
                                              ),
                                              child: Slider(
                                                value: controller.ageValues.value.start,
                                                min: 0,
                                                max: 100,
                                                divisions: 10,
                                                label: '${controller.ageValues.value.start} miles',
                                                onChanged: (value) {
                                                  controller.updateAgeValues(
                                                    RangeValues(value, controller.ageValues.value.end),
                                                  );
                                                },
                                              ),
                                            )),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('3 miles', style: GoogleFonts.poppins(color: Colors.black54, fontSize: 11.6)),
                                              Text('100 miles', style: GoogleFonts.poppins(color: Colors.black54, fontSize: 11.6)),
                                            ],
                                          ),
                                          SizedBox(height: 13),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 19),
                                    Container(
                                      height: 92,
                                      width: 320,
                                      padding: EdgeInsets.only(left: 14, right: 14),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade50,
                                        border: Border.all(color: Colors.grey.shade300),
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 9),
                                          Text(
                                            'Interested',
                                            style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          FittedBox(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Obx(() => Radio<String>(
                                                      value: 'Dating',
                                                      groupValue: controller.selectedValueForInterested.value,
                                                      onChanged: (newValue) {
                                                        controller.updateSelectedValueForInterested(newValue);
                                                      },
                                                      activeColor: AppColors.pink,
                                                    )),
                                                    const Text('Dating')
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Obx(() => Radio<String>(
                                                      value: 'Friendship',
                                                      groupValue: controller.selectedValueForInterested.value,
                                                      onChanged: (newValue) {
                                                        controller.updateSelectedValueForInterested(newValue);
                                                      },
                                                      activeColor: AppColors.pink,
                                                    )),
                                                    const Text('Friendship')
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Obx(() => Radio<String>(
                                                      value: 'Business',
                                                      groupValue: controller.selectedValueForInterested.value,
                                                      onChanged: (newValue) {
                                                        controller.updateSelectedValueForInterested(newValue);
                                                      },
                                                      activeColor: AppColors.pink,
                                                    )),
                                                    const Text('Business')
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 19),
                                    Container(
                                      height: 90,
                                      width: 320,
                                      padding: EdgeInsets.only(left: 14, right: 14),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade50,
                                        border: Border.all(color: Colors.grey.shade300),
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 9),
                                          Text(
                                            'Age',
                                            style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.topRight,
                                            child: Obx(() => Text(
                                              '${controller.ageValues.value.start.round()}-${controller.ageValues.value.end.round()}',
                                              style: GoogleFonts.poppins(
                                                color: Colors.black54,
                                                fontSize: 11.6,
                                              ),
                                            )),
                                          ),
                                          Expanded(
                                            child: Obx(() => SliderTheme(
                                              data: SliderThemeData(
                                                activeTrackColor: AppColors.pink,
                                                inactiveTrackColor: Colors.grey.withOpacity(0.3),
                                                trackHeight: 2.0,
                                                thumbColor: AppColors.pink,
                                                overlayColor: AppColors.white.withOpacity(0.2),
                                                activeTickMarkColor: AppColors.pink,
                                                inactiveTickMarkColor: AppColors.pink,
                                                valueIndicatorColor: Colors.grey.shade300,
                                                valueIndicatorTextStyle: TextStyle(
                                                  color: AppColors.pink,
                                                ),
                                              ),
                                              child: RangeSlider(
                                                values: controller.ageValues.value,
                                                min: 0,
                                                max: 100,
                                                divisions: 100,
                                                labels: RangeLabels(
                                                  controller.ageValues.value.start.round().toString(),
                                                  controller.ageValues.value.end.round().toString(),
                                                ),
                                                onChanged: (values) {
                                                  controller.updateAgeValues(values);
                                                },
                                              ),
                                            )),
                                          ),
                                          SizedBox(height: 22),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 19),
                                    Container(
                                      height: 140,
                                      width: 320,
                                      padding: EdgeInsets.only(left: 14, right: 14),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade50,
                                        border: Border.all(color: Colors.grey.shade300),
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
                                                groupValue: controller.selectedGender.value,
                                                onChanged: (value) {
                                                  controller.updateSelectedGender(value);
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
                                                groupValue: controller.selectedGender.value,
                                                onChanged: (value) {
                                                  controller.updateSelectedGender(value);
                                                },
                                                activeColor: AppColors.pink,
                                              )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 13),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, bottom: 16),
                      child: SizedBox(
                        width: isDesktop? contentWidth / 1.6 : contentWidth,
                        child: CustomButton(
                          text: "Next",
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MatchesMessagesTabBarScreen(),));
                          },
                          textColor: Colors.white,
                          borderRadius: 30.0,
                          padding: 14.0,
                          fontSize: 18.0,
                          height: 52.0, // Custom height
                          width: contentWidth / 1.3, // Custom width
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
