import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:love_tale/app/utils/widgets/app_button.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/const/app_color.dart';
import '../../utils/const/app_images.dart';
import 'desktop_personal_info.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  void showDialogFunction() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 8,color: Colors.black45)
              ),
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              launch("https://love-tale-lp-ruqc.vercel.app/",
                                webOnlyWindowName: '_self',
                              );
                            },
                              child: Icon(Icons.cancel_outlined))),
                      Image(image: AssetImage(AppImages.logo), height: 60,width: 60,),
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
                            Image(image: AssetImage("assets/images/img.png"),height: 30,width: 30,),
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
          ),
        );
      },
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialogFunction();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image(
                image: AssetImage(
                    'assets/images/background_landing.PNG'),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
