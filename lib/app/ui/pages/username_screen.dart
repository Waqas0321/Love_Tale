import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/auth/username_controller.dart';
import '../../utils/const/app_strings.dart';
import '../../utils/widgets/app_button.dart';

class Username extends StatelessWidget {
  final UsernameController controller = Get.put(UsernameController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 46),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back_rounded,
                      color: Colors.pink, size: 27),
                ),
                SizedBox(width: 92.5),
                Text(
                  "Username",
                  style: GoogleFonts.poppins(
                    fontSize: 23,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 65),
            Container(
              width: 330,
              height: 46,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'dater.com/@markfrakins',
                  hintStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                onChanged: controller.updateUsername,
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w600,
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
            ),
            SizedBox(height: 25),
            CustomButton(
              text: AppString.confirm,
              onPressed: () {
                // Handle confirm button press
                print('Username: ${controller.username.value}');
              },
              textColor: Colors.white,
              borderRadius: 30.0,
              padding: 14.0,
              fontSize: 18.0,
              height: 55.0, // Custom height
              width: 340.0, // Custom width
            ),
          ],
        ),
      ),
    );
  }
}
