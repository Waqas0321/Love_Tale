import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:love_tale/app/utils/const/app_images.dart';
import '../utils/const/app_color.dart';
import '../utils/widgets/app_button.dart'; // Ensure the correct path

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Match Alert Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MatchScreen(),
    );
  }
}

class MatchScreen extends StatelessWidget {
  void _showMatchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          backgroundColor: Colors.transparent,
          child: Container(
            width: 390,
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              image: DecorationImage(
                image: AssetImage(AppImages.alert), // Adjust the path as needed
                fit: BoxFit.fill,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    "You're Matched",
                    style: GoogleFonts.poppins(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "You and Desirae have both liked each other",
                    style: GoogleFonts.poppins(
                      fontSize: 10.9,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 13),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 54),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: 2),
                          Text(
                            "Kadin Dias",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "CTO",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.grey.shade50,
                                size: 14,
                              ),
                              SizedBox(width: 2),
                              Text(
                                "7 miles",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 17),
                      CircleAvatar(
                        radius: 43,
                        backgroundColor: Colors.grey[300],
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(AppImages.Pic2),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Icon(Icons.favorite,color: AppColors.white,size: 21,),
                  ),
                  SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // SizedBox(width: 54),
                      SizedBox(width:24),
                      CircleAvatar(
                        radius: 43,
                        backgroundColor: Colors.grey[300],
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(AppImages.Pic3),
                        ),
                      ),
                      SizedBox(width: 17),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2),
                          Text(
                            "Desirae Donin",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "CTO",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.grey.shade50,
                                size: 14,
                              ),
                              SizedBox(width: 2),
                              Text(
                                "7 miles",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                  SizedBox(height: 75),
                  CustomButton(
                    text: "Send a Message",

                    onPressed: () {
                      // Get.toNamed("login_screen");
                    },
                    color: AppColors.pink,
                    textColor: Colors.white,
                    borderRadius: 30.0,
                    padding: 16.0,
                    fontSize: 18.0,
                    height: 45.0, // Custom height
                    width: 245.0, // Custom width
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Go Back to Discover",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Match Alert Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showMatchDialog(context),
          child: Text('Show Match Alert'),
        ),
      ),
    );
  }
}
