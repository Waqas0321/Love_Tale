import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:love_tale/app/ui/pages/personal_details/gender_screen.dart';
import '../../../utils/widgets/custom_textfield.dart'; // Make sure to import your DateController

class FirstNameScreen extends StatefulWidget {
  const FirstNameScreen({super.key});

  @override
  State<FirstNameScreen> createState() => _FirstNameScreenState();
}

class _FirstNameScreenState extends State<FirstNameScreen> {
  final DateController dateController = Get.put(DateController()); // Initialize the controller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(GenderScreen());
        },
        child: Icon(Icons.navigate_next_sharp,color: Colors.white,size: 32,), // You can use any icon you prefer
        shape: CircleBorder(), // Ensures the button is circular
        backgroundColor: Colors.black, // Set the background color
        elevation: 6, // Add elevation for a shadow effect
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 30),
              child: SizedBox(
                width: 210,
                child: Text(
                  "Oh hey! let's start with an intro",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
                ),
              ),
            ),
            SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your first name',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 3),
                  CustomTextField(),
                ],
              ),
            ),
            SizedBox(height: 36),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your birthday',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Month',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.black54)),
                      Text('Day',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.black54)),
                      Text('Year',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.black54)),
                      SizedBox.shrink()
                    ],
                  ),
                  GestureDetector(
                    onTap:  () async {
                      // Show the date picker
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );

                      if (selectedDate != null) {
                        // Update the controller's values
                        dateController.day.value = '${selectedDate.day}';
                        dateController.month.value = '${selectedDate.month}';
                        dateController.year.value = '${selectedDate.year}';
                      }
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Obx(() => Container(
                            height: 55,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1.0), // Border color and width
                              borderRadius: BorderRadius.circular(16.0), // Rounded corners
                            ),
                            // Padding inside the container
                            child: Center(
                              child: Text(
                                 dateController.month.value, // Display hint or the value
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18// Change color based on value
                                ),
                              ),
                            ),
                          )),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Obx(() =>  Container(
                            height: 55,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1.0), // Border color and width
                              borderRadius: BorderRadius.circular(16.0), // Rounded corners
                            ),
                            // Padding inside the container
                            child: Center(
                              child: Text(
                                dateController.day.value, // Display hint or the value
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18// Change color based on value
                                ),
                              ),
                            ),
                          )),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Obx(() =>  Container(
                            height: 55,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1.0), // Border color and width
                              borderRadius: BorderRadius.circular(16.0), // Rounded corners
                            ),
                            // Padding inside the container
                            child: Center(
                              child: Text(
                                dateController.year.value, // Display hint or the value
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18// Change color based on value
                                ),
                              ),
                            ),
                          )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4,),
                  Text(
                    "It's never too early to count down",
                    style: TextStyle(fontSize: 16,color: Colors.black54),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class DateController extends GetxController {
  var day = ''.obs; // Observable for day
  var month = ''.obs; // Observable for month
  var year = ''.obs; // Observable for year
}

