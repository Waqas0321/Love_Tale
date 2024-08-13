import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:love_tale/app/utils/widgets/app_button.dart';

import '../../utils/const/app_color.dart';
import '../../utils/const/app_images.dart';
import '../../utils/widgets/custom_svg_image.dart';
import 'desktop_personal_info.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image(
              image: NetworkImage(
                  'https://cdn.pixabay.com/photo/2014/12/08/11/49/couple-560783_640.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          // Top right buttons
          Positioned(
            top: 16,
            right: 16,
            child: Row(
              children: [
                InkWell(
                  onTap:(){
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        title: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(width: 8,color: Colors.black)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                    child: GestureDetector(
                                        onTap: () => Navigator.pop(context),
                                        child: Icon(Icons.cancel_outlined))),
                                CustomSvgImage(
                                  assetPath: AppImages.logo,
                                  height: 40,
                                  width: 40,
                                  color: Color(0xfff980ae),
                                ),
                                Text(
                                  "Hello",
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ),
                                Text(
                                  "Love Tale",
                                  style: Theme.of(context).textTheme.headlineMedium?.apply(color: Colors.pink),
                                ),
                                SizedBox(height: 20,),
                                Text(
                                  "Lorem ipsum dolor sit amet, consectetur \n adipiscing elit.Sed do eiusmod tempor \n incididunt ut labore et dolore magna aliqua.",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                SizedBox(height: 11,),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 1,
                                      ),

                                    ),
                                    hintText: "Enter Your Number",
                                    prefixIcon: Icon(Icons.call,color: Colors.black,)
                                  ),
                                ),
                                SizedBox(height: 11,),
                                CustomButton(text: "LogIn", onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => DesktopPersonalInfo(),));
                                }, height: 45, width: Get.width / 3.5,
                                ),
                                SizedBox(height: 16,),
                                Row(
                                  children: [
                                    Text(
                                      "Register Now",
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                    Spacer(),
                                    Text(
                                      "Forget Password?",
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(child: Divider()),
                                    SizedBox(width: 30,),
                                    Text(
                                      "or",
                                      style: Theme.of(context).textTheme.bodySmall,
                                    ),
                                    SizedBox(width: 30,),
                                    Expanded(child: Divider()),

                                  ],
                                ),
                                SizedBox(height: 16,),
                                Container(
                                  height: 45,
                                  width: Get.width / 3.5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: AppColors.customGradient,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(image: AssetImage(AppImages.facebook),height: 30,width: 30,),
                                      Text("LogIn with Google",style: Theme.of(context).textTheme.bodySmall?.apply(color: Colors.white),)
                                    ],
                                  ),
                                ),

                                SizedBox(height: 11,),
                                Container(
                                  height: 45,
                                  width: Get.width / 3.5,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,
                                      border: Border.all(width: 1,color: Colors.black)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(image: AssetImage(AppImages.facebook),height: 30,width: 30,),
                                      Text("LogIn with Facebook",style: Theme.of(context).textTheme.bodySmall,)
                                    ],
                                  ),
                                ),
                                SizedBox(height: 11,),
                                Container(
                                  height: 45,
                                  width: Get.width / 3.5,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.white,
                                      border: Border.all(width: 1,color: Colors.black)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.apple, size: 33,),
                                      Text("LogIn with Apple",style: Theme.of(context).textTheme.bodySmall,)
                                    ],
                                  ),
                                ),
                                SizedBox(height: 11,),
                              ]

                            ),
                          ),
                        ),
                      );

                    },);
                  },
            child: Container(
                    height: 45,
                    width: 100,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.white),
                        color: Colors.transparent),
                    child: Center(
                        child: Text(
                      "Log In",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        decoration: TextDecoration.none,
                      ),
                    )),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  height: 45,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white),
                      color: Colors.transparent),
                  child: Center(
                      child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      decoration: TextDecoration.none,
                    ),
                  )),
                ),
              ],
            ),
          ),
          // Top right text
          Positioned(
            top: 16,
            left: 16,
            child: Row(
              children: [
                Text('LoveTale',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.none)),
                SizedBox(width: 18),
                Text('Product',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        decoration: TextDecoration.none)),
                SizedBox(width: 12),
                Text('Safety',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        decoration: TextDecoration.none)),
                SizedBox(width: 12),
                Text('Learn',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        decoration: TextDecoration.none)),
                SizedBox(width: 12),
                Text('Download',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        decoration: TextDecoration.none)),
              ],
            ),
          ),
          // Center text
          Positioned(
            top: MediaQuery.of(context).size.height / 2,
            left: 0,
            right: 0,
            child: Text(
              'Lorem ipsum dolor sit amet, \n consectetur adipiscing elit.  Sed do eiusmod tempor incididunt \n ut labore et dolore magna aliqua.',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  decoration: TextDecoration.none),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
