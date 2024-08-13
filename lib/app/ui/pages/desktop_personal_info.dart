import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:love_tale/app/utils/const/app_images.dart';
import '../../bindings/bottom_screen.dart';
import '../../controllers/personal_controller.dart';
import '../../utils/const/app_color.dart';
import '../../utils/const/app_strings.dart';
import '../../utils/widgets/app_button.dart';
import '../../utils/widgets/custom_svg_image.dart';

class DesktopPersonalInfo extends StatefulWidget {
  DesktopPersonalInfo({super.key});

  @override
  State<DesktopPersonalInfo> createState() => _DesktopPersonalInfoState();
}

class _DesktopPersonalInfoState extends State<DesktopPersonalInfo> {
  final PersonalInfoController controller = Get.put(PersonalInfoController());
  void showDialogFunction() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(
            width: 550,
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      "Welcome to LoveTale",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(height: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.check, color: Colors.pink,),
                            SizedBox(width: 12,),
                            Text(AppString.beRespectfulTitle,style: Theme.of(context).textTheme.headlineMedium,)
                          ],
                        ),
                        Text(AppString.beRespectfulDescription,)
                      ],
                    ),
                    SizedBox(height: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.check, color: Colors.pink,),
                            SizedBox(width: 12,),
                            Text(AppString.beRespectfulTitle,style: Theme.of(context).textTheme.headlineMedium,)
                          ],
                        ),
                        Text(AppString.stayHonestDescription,)
                      ],
                    ),
                    SizedBox(height: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.check, color: Colors.pink,),
                            SizedBox(width: 12,),
                            Text(AppString.protectPrivacyTitle,style: Theme.of(context).textTheme.headlineMedium,)
                          ],
                        ),
                        Text(AppString.protectPrivacyDescription,)
                      ],
                    ),
                    SizedBox(height: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.check, color: Colors.pink,),
                            SizedBox(width: 12,),
                            Text(AppString.staySafeTitle,style: Theme.of(context).textTheme.headlineMedium,)
                          ],
                        ),
                        Text(AppString.staySafeDescription,)
                      ],
                    ),
                    SizedBox(height: 30,),
                    CustomButton(text: "I Agree", onPressed: () {
                      Navigator.pop(context);
                    }, height: 45, width: Get.width / 3.5,
                    ),

                  ]

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
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomSvgImage(
                  assetPath: AppImages.logo,
                  height: 40,
                  width: 40,
                  color: Color(0xfff980ae),
                ),
                Text(
                  "Love Tale",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Divider(
              color: Colors.black,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InPutTextFiled(
                      text: "First Name",
                      labelText: "Jack",
                      width: 250,
                    ),
                    SizedBox(
                      width: 28,
                    ),
                    InPutTextFiled(
                      text: "Last Name",
                      labelText: "Cavin",
                      width: 200,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Interested In"),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 34,
                              width: 140,
                              child: OutlinedButton(
                                  onPressed: () {}, child: Text("Woman")),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            SizedBox(
                              height: 34,
                              width: 140,
                              child: OutlinedButton(
                                  onPressed: () {}, child: Text("Man")),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 28,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InPutTextFiled(
                      text: "Email",
                      labelText: "qwettyuiio@gmail.com",
                      width: 250,
                    ),
                    SizedBox(
                      width: 28,
                    ),
                    InPutTextFiled(
                      text: "Mobile No",
                      labelText: "+91 321654897",
                      width: 200,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Gender"),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 34,
                              width: 140,
                              child: OutlinedButton(
                                  onPressed: () {}, child: Text("Female")),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            SizedBox(
                              height: 34,
                              width: 140,
                              child: OutlinedButton(
                                  onPressed: () {}, child: Text("Male")),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 28,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => InPutTextFiled(
                        text: "Date of Birth",
                        labelText:
                            "${controller.selectedBirthday.value != null ? "${controller.selectedBirthday.value!.day} / ${controller.selectedBirthday.value!.month} / ${controller.selectedBirthday.value!.year}" : 'DD / MM / YYYY'}",
                        width: 250,
                        sufiIcon: true,
                      ),
                    ),
                    SizedBox(
                      width: 28,
                    ),
                    InPutTextFiled(
                      text: "Country",
                      labelText: "India",
                      width: 200,
                    ),
                    SizedBox(
                      width: 28,
                    ),
                  ],
                ),
                SizedBox(
                  height: 103,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 54,
                    ),
                    Expanded(
                        child: Divider(
                      color: Colors.pink,
                    )),
                    SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.pink)),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BottomScreen(),));
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        )),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: Divider(
                      color: Colors.pink,
                    )),
                    SizedBox(
                      width: 54,
                    ),
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class InPutTextFiled extends StatelessWidget {
  InPutTextFiled({
    super.key,
    required this.text,
    required this.labelText,
    required this.width,
    this.sufiIcon = false,
    this.enabeled = true,
  });

  final String text;
  final String labelText;
  final double width;
  final bool sufiIcon;
  final bool enabeled;

  final PersonalInfoController controller = Get.put(PersonalInfoController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text),
        SizedBox(
          height: 2,
        ),
        SizedBox(
          width: width,
          child: TextFormField(
            enabled: enabeled,
            decoration: InputDecoration(
                hintText: labelText,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                suffixIcon: sufiIcon
                    ? InkWell(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (pickedDate != null) {
                            controller.selectedBirthday.value = pickedDate;
                            print(pickedDate); // Update the observable variable
                          }
                        },
                        child: Icon(Icons.calendar_month_outlined))
                    : null),
            cursorColor: Colors.black,
            cursorWidth: 2,
          ),
        )
      ],
    );
  }
}
