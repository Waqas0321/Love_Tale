import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:love_tale/app/ui/pages/personal_details/picture_upload_screen.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  static bool male =  false;
  static bool female =  false;
  void maleTogle(){
    setState(() {
      male = !male;
      if(male){
        female = false;
      }
    });

  }
  void femaleTogle(){
    setState(() {
      female = !female;
      if(female){
        male = false;
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(PictureUploadScreen());
        },
        child: Icon(Icons.navigate_next_sharp,color: Colors.white,size: 32,), // You can use any icon you prefer
        shape: CircleBorder(), // Ensures the button is circular
        backgroundColor: Colors.black, // Set the background color
        elevation: 6, // Add elevation for a shadow effect
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 30),
            child: Column(
              children: [
                Text(
                  "How do you identify?",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                ),
                Text(
                  "Pick which best describe you.",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: !male? Colors.transparent : Colors.black
                    ),
                    onPressed: () {
                      setState(() {
                        maleTogle();
                      });

                }, child: Text('Male',style: TextStyle(fontSize: 21,color:male? Colors.white:Colors.black),)),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 56,
                width: double.infinity,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: !female? Colors.transparent : Colors.black
                    ),
                    onPressed: () {
                      femaleTogle();
                }, child: Text('Female',style: TextStyle(fontSize: 21,color: female? Colors.white:Colors.black),)),
              ),
                SizedBox(height: 4,),
                Text(
                  "Another Gender",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                ),
            ],),
          )


        ],
      )),
    );
  }
}


