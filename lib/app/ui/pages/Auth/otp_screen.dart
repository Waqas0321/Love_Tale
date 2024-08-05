import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:love_tale/app/ui/pages/Auth/personal_screen.dart';
import '../../../controllers/otp_controller.dart';
import '../../../utils/const/app_color.dart';
import '../../../utils/const/app_strings.dart';
import '../../../utils/widgets/app_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OtpScreen(),
    );
  }
}

class OtpScreen extends StatelessWidget {
  final OtpController _controller = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back_rounded,
                    color: AppColors.pink, size: 27),
              ),
            ),
            SizedBox(height: 17),
            Text(
              AppString.my_code_is,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      _controller.otpCode.value.length > index
                          ? _controller.otpCode.value[index]
                          : '',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                );
              }),
            )),
            SizedBox(height: 17),
            Container(
              height: 70,
              // width: 400,
              child: RichText(
                textAlign: TextAlign.start,
                textDirection:
                TextDirection.ltr, // Left-to-right text direction
                softWrap: true,
                maxLines: null,
                textScaleFactor: 1,
                text: TextSpan(
                  text: ' ',
                  children: <TextSpan>[
                    TextSpan(
                      text: AppString.enter_digits,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      text: AppString.No,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _controller.resendCode();
              },
              child: Container(
                width: 90,
                height: 31,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.pink),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    "Resend",
                    style: TextStyle(color: AppColors.pink),
                  ),
                ),
              ),
            ),
            SizedBox(height: 78),
            Container(
              height: 270, // Set the height of the container here
              width: 310,
              decoration: BoxDecoration(
                color: Colors.white70,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(11),
              ),
              child: GridView.builder(
                padding: EdgeInsets.only(top: 30,),
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.0, // Adjusted aspect ratio to fit within 70 height
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  String text;
                  Function onTap;
                  if (index < 9) {
                    text = '${index + 1}';
                    onTap = () => _controller.addDigit(text);
                  } else if (index == 9) {
                    text = '*';
                    onTap = () => _controller.addDigit(text);
                  } else if (index == 10) {
                    text = '0';
                    onTap = () => _controller.addDigit(text);
                  } else {
                    text = '#';
                    onTap = () => _controller.addDigit(text);
                  }

                  return GestureDetector(
                    onTap: () => onTap(),
                    child: Container(
                      height: 100,
                      margin: EdgeInsets.only(left: 6, right: 6, top: 8),
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.grey),
                        // borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          text,
                          style: TextStyle(fontSize: 24, letterSpacing: 1.5),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30), // Added some spacing before the button
            CustomButton(
              text: "Submit",
              borderRadius: 32,
              onPressed: () {
                Get.to(PersonalInfoScreen());
                _controller.submitCode();
              },
              height: 54,
              width: 327,
            ),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}
