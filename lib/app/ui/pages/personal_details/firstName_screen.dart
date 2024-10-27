import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/const/app_color.dart';
import '../../../utils/widgets/custom_textfield.dart';
import 'gender_screen.dart';

class FirstNameScreen extends StatefulWidget {
  const FirstNameScreen({super.key});

  @override
  State<FirstNameScreen> createState() => _FirstNameScreenState();
}

class _FirstNameScreenState extends State<FirstNameScreen> {
  final DateController dateController = Get.put(DateController());

  final List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];
  final List<String> days = List.generate(31, (index) => '${index + 1}');
  final List<String> years = List.generate(101, (index) => '${DateTime.now().year - index}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.pink,
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(GenderScreen());
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
        child: Center(
          child: SizedBox(
            width: 400,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Oh hey! let's start with an intro",
                    style: GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Your first name',
                    style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 3),
                  CustomTextField(),
                  SizedBox(height: 36),
                  Text(
                    'Your birthday',
                    style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Obx(() => Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey), // Set the border color
                            borderRadius: BorderRadius.circular(5), // Optional: Rounded corners
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 2), // Add padding for a consistent look
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              alignment: Alignment.center,
                              value: dateController.month.value.isEmpty ? null : dateController.month.value,
                              hint: Text('Month', style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54)),
                              items: months.map((month) {
                                return DropdownMenuItem(
                                  value: month,
                                  child: Text(month, style: GoogleFonts.poppins(fontSize: 12)),
                                );
                              }).toList(),
                              onChanged: (value) {
                                dateController.month.value = value!;
                              },
                              dropdownColor: Colors.white,
                            ),
                          ),
                        )),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Obx(() => Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 2),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              alignment: Alignment.center,
                              value: dateController.day.value.isEmpty ? null : dateController.day.value,
                              hint: Text('Day', style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54)),
                              items: days.map((day) {
                                return DropdownMenuItem(
                                  value: day,
                                  child: Text(day, style: GoogleFonts.poppins(fontSize: 16)),
                                );
                              }).toList(),
                              onChanged: (value) {
                                dateController.day.value = value!;
                              },
                              dropdownColor: Colors.white,
                            ),
                          ),
                        )),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Obx(() => Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 2),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              alignment: Alignment.center,
                              value: dateController.year.value.isEmpty ? null : dateController.year.value,
                              hint: Text('Year', style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54)),
                              items: years.map((year) {
                                return DropdownMenuItem(
                                  value: year,
                                  child: Text(year, style: GoogleFonts.poppins(fontSize: 16)),
                                );
                              }).toList(),
                              onChanged: (value) {
                                dateController.year.value = value!;
                              },
                              dropdownColor: Colors.white,
                            ),
                          ),
                        )),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    "It's never too early to count down",
                    style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DateController extends GetxController {
  var day = ''.obs;
  var month = ''.obs;
  var year = ''.obs;
}
