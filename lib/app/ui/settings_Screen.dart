import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:love_tale/Constants/love_tale_Sizes.dart';
import '../controllers/auth/setting_controller.dart';
import '../utils/const/app_color.dart';
import '../utils/widgets/app_button.dart';



class Settings extends StatelessWidget {
  final SettingsController controller = Get.put(SettingsController());
  LoveTaleSizes _sizes = LoveTaleSizes();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double contentWidth = _sizes.getscreencontentWidth();
          bool isDesktop = _sizes.isDesktopFun();
          return Container(
          padding: EdgeInsets.only(left: 23, right: 18, top: 13),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          SizedBox(height: 45),
          SizedBox(
            child:isDesktop? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Settings",
                  style: GoogleFonts.poppins(
                    fontSize: 23,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ):Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_rounded,
                      color: Colors.pink, size: 27),
                ),
                SizedBox(width: 94.5),
                Text(
                  "Settings",
                  style: GoogleFonts.poppins(
                    fontSize: 23,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 27,),
          Expanded(
          child: SingleChildScrollView(
          child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Column(
          children: [
          Container(
          height: 87,
          width: 380,
          padding: EdgeInsets.only(top: 14),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: AppColors.pink,
          ),
          child: Center(
          child: Text(
          'Unlimited likes & more!',
          style: GoogleFonts.poppins(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w500,
          ),
          ),
          ),
          ),
          SizedBox(height: 18),
          SizedBox(
            width: contentWidth * 1.45,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Container(
            width: contentWidth / 3,
            height: 56,
            decoration: BoxDecoration(
            color: AppColors.pink,
            borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
            SizedBox(width: 12),
            Icon(Icons.bolt, color: Colors.white),
            Expanded(
              child: Text('Get Boosts',
              style: TextStyle(color: Colors.white)),
            ),
            ],
            ),
            ),
            SizedBox(width: 20),
            Container(
            width: contentWidth / 3,
            height: 56,
            decoration: BoxDecoration(
            color: AppColors.pink,
            borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
            SizedBox(width: 12),
            Icon(Icons.star, color: Colors.white),
            Expanded(
              child: Text('Get Super Likes',
              style: TextStyle(color: Colors.white)),
            ),
            ],
            ),
            ),
            ],
            ),
          ),
          SizedBox(height: 24),
          Container(
          height: 115,
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
          SizedBox(height: 10),
          Text(
          'Personal Info',
          style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
          ),
          ),
          SizedBox(height: 7),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(
          "Username",
          style: GoogleFonts.poppins(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
          ),
          ),
          Icon(
          Icons.arrow_forward_ios_rounded,
          size: 17,
          color: Colors.black54,
          ),
          ],
          ),
          SizedBox(height: 13),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(
          "Email",
          style: GoogleFonts.poppins(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
          ),
          ),
          Icon(
          Icons.arrow_forward_ios_rounded,
          size: 17,
          color: Colors.black54,
          ),
          ],
          ),
          ],
          ),
          ),
          SizedBox(height: 14),
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
          SizedBox(height: 15),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(
          "Phone Number",
          style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: Colors.black54,
          ),
          ),
          Text(
          "+1 354 112 2376",
          style: GoogleFonts.poppins(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Colors.black54,
          ),
          ),
          Icon(
          Icons.arrow_forward_ios_rounded,
          size: 17,
          color: Colors.black54,
          ),
          ],
          ),
          ],
          ),
          ),
          SizedBox(height: 14),
          Container(
          height: 110,
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
          SizedBox(height: 10),
          Text(
          'Location',
          style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
          ),
          ),
          SizedBox(height: 7),
          Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Icon(
          Icons.location_on,
          size: 19,
          color: Colors.black38,
          ),
          Text(
          "Current location",
          style: GoogleFonts.poppins(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
          ),
          ),
          SizedBox(width: 120),
          Expanded(
            child: Icon(
            Icons.check_circle_rounded,
            size: 20,
            color: AppColors.pink,
            ),
          ),
          ],
          ),
          SizedBox(height: 12),
          Text(
          "Add a new location",
          style: GoogleFonts.poppins(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: AppColors.pink,
          ),
          ),
          ],
          ),
          ),
          SizedBox(height: 14),
          Container(
          height: 78,
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
          'Show Me',
          style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
          ),
          ),
          SizedBox(height: 8),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(
          "Women",
          style: GoogleFonts.poppins(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
          ),
          ),
          Icon(
          Icons.arrow_forward_ios_rounded,
          size: 17,
          color: Colors.black54,
          ),
          ],
          ),
          ],
          ),
          ),
          SizedBox(height: 14),
          Container(
          height: 83,
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
          'Maximum distance',
          style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
          ),
          ),
          // SizedBox(height: 8),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Expanded(
          child: Obx(
          () => SliderTheme(
          data: SliderThemeData(
          activeTrackColor: AppColors.pink,
          inactiveTrackColor:
          Colors.grey.withOpacity(0.3),
          trackHeight: 2.0,
          thumbColor: AppColors.pink,
          thumbShape: RoundSliderThumbShape(
          enabledThumbRadius: 8.0),
          overlayColor:
          AppColors.white.withOpacity(0.2),
          activeTickMarkColor: AppColors.pink,
          inactiveTickMarkColor: AppColors.pink,
          valueIndicatorColor: Colors.grey.shade300,
          valueIndicatorTextStyle: TextStyle(
          color: AppColors.pink,
          ),
          ),
          child: Slider(
          activeColor: AppColors.pink,
          inactiveColor:
          Colors.grey.withOpacity(0.3),
          value: controller.sliderValue.value,
          min: 0,
          max: 90,
          divisions: 10,
          label:
          '${controller.sliderValue.value.round()}ml',
          onChanged: (value) {
          controller.updateSliderValue(value);
          },
          ),
          ),
          ),
          ),
          Obx(
          () => Text(
          "${controller.sliderValue.value.round()}ml",
          style: GoogleFonts.poppins(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
          ),
          ),
          ),
          ],
          ),
          ],
          ),
          ),
          SizedBox(height: 14),
          Container(
          height: 48,
          width: 320,
          padding: EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
          color: Colors.grey.shade50,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(
          "Swipe Surge",
          style: GoogleFonts.poppins(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
          ),
          ),
          Obx(
          () => Transform.scale(
          scale: 0.5, // Scale the switch size
          child: Switch(
          value: controller.swipeSurge.value,
          onChanged: (value) {
          controller.updateSwipeSurge(value);
          },
          activeColor: AppColors.pink,
          inactiveThumbColor: Colors.grey[400],
          inactiveTrackColor: Colors.grey[200],
          )),
          ),
          ],
          ),
          ),
          SizedBox(height: 14),
          Container(
          height: 48,
          width: 320,
          padding: EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
          color: Colors.grey.shade50,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(
          "Active Status",
          style: GoogleFonts.poppins(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
          ),
          ),
          Obx(
          () => Transform.scale(
          scale: 0.5, // Scale the switch size
          child: Switch(
          value: controller.status.value,
          onChanged: (values) {
          controller.updateActive(values);
          },
          activeColor: AppColors.pink,
          inactiveThumbColor: Colors.grey[400],
          inactiveTrackColor: Colors.grey[200],
          )),
          ),
          ],
          ),
          ),
          SizedBox(height: 14),
          Container(
          height: 128,
          width: 320,
          padding: EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
          color: Colors.grey.shade50,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(14),
          ),
          child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(height: 5),
          Text(
          "Show Distance in",
          style: GoogleFonts.poppins(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
          ),
          ),
          Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text('Km.',
          style: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
          )),
          Radio<DistanceUnit>(
          value: DistanceUnit.km,
          groupValue: controller.selectedUnit.value,
          onChanged: (DistanceUnit? value) {
          controller.updateSelectedUnit(value!);
          },
          activeColor: Colors.pink,
          ),
          ],
          ),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text('Mi.',
          style: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
          )),
          Radio<DistanceUnit>(
          value: DistanceUnit.mi,
          groupValue: controller.selectedUnit.value,
          onChanged: (DistanceUnit? value) {
          controller.updateSelectedUnit(value!);
          },
          activeColor: Colors.pink,
          ),
          ],
          ),

          ],
          )),

          ],
          ),
          ),
          SizedBox(height: 14),
          Container(
          height: 52,
          width: 320,
          padding: EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
          color: Colors.grey.shade50,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(14),
          ),
          child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(
          "Share Dater",
          style: GoogleFonts.poppins(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
          ),
          ),
          Icon(
          Icons.arrow_forward_ios_rounded,
          size: 17,
          color: Colors.black54,
          ),
          ],
          ),
          ),
          SizedBox(height: 38),
          CustomButton(
          text: "Logout",
          onPressed: () => _showLogoutDialog(context),
          textColor: Colors.white,
          borderRadius: 30.0,
          padding: 14.0,
          fontSize: 18.0,
          height: 52.0,
          width: 358.0,
          ),
          SizedBox(height: 34),
          ],
          ),
          ),
          ),
          ),

          ],
          ),
          );
        },

      ),
    );
  }
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.white,
          child:Container(
            width: 230,

            height: 152,
            decoration: BoxDecoration(
              color: Colors.white,
                borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 18,),
                Text(
                  'Logout?',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                  ),
                ),
            SizedBox(height: 7),
            Text(
              'Are you sure you want to logout?',
              style: GoogleFonts.poppins(
                fontSize: 12.6,
                color: Colors.black38,
              ),   textAlign: TextAlign.center,),
                SizedBox(height: 30),
                Row(
                  children: [
                    Container(
                      width:140,
                      height: 53,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20)),
                        border: Border.all(color: Colors.grey.shade300)
                      ),
                      child: Center(
                        child:  Text(
                          'Cancel',
                          style: GoogleFonts.poppins(
                            fontSize: 14.2,
                            color: Colors.black38,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width:53,
                      height: 53,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(20)),
                          border: Border.all(color: Colors.grey.shade300)
                      ),
                      child: Center(
                       child:  Text(
                         'Logout',
                         style: GoogleFonts.poppins(
                           fontSize: 14.2,
                           color: AppColors.pink,
                           fontWeight: FontWeight.w600,
                         ),
                       ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


