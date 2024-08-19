import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:love_tale/app/utils/const/app_images.dart';
import '../../bindings/bottom_screen.dart';
import '../../controllers/personal_controller.dart';
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
  late bool isSelectWomen = false;
  late bool isSelectMen = false;
  late bool isSelectFemale = false;
  late bool isSelectMale = false;

  void showDialogFunction() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(
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
                    Image(image: AssetImage(AppImages.logo), height: 60,width: 60,),
                    Text(
                      "Welcome to LoveTale",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.check,
                              color: Colors.pink,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              AppString.beRespectfulTitle,
                              style: Theme.of(context).textTheme.headlineMedium,
                            )
                          ],
                        ),
                        Text(
                          AppString.beRespectfulDescription,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.check,
                              color: Colors.pink,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              AppString.beRespectfulTitle,
                              style: Theme.of(context).textTheme.headlineMedium,
                            )
                          ],
                        ),
                        Text(
                          AppString.stayHonestDescription,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.check,
                              color: Colors.pink,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              AppString.protectPrivacyTitle,
                              style: Theme.of(context).textTheme.headlineMedium,
                            )
                          ],
                        ),
                        Text(
                          AppString.protectPrivacyDescription,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.check,
                              color: Colors.pink,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              AppString.staySafeTitle,
                              style: Theme.of(context).textTheme.headlineMedium,
                            )
                          ],
                        ),
                        Text(
                          AppString.staySafeDescription,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      text: "I Agree",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      height: 45,
                      width: Get.width / 3.5,
                    ),
                  ]),
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
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image(image: AssetImage(AppImages.logo), height: 40,width: 40,),
                Text(
                  "Love Tale",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
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
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          isSelectWomen
                                              ? Colors.pink
                                              : null)),
                                  onPressed: () {
                                    setState(() {
                                      isSelectWomen = true;
                                      isSelectMen = false;
                                    });
                                  },
                                  child: Text(
                                    "Woman",
                                    style: TextStyle(
                                        color: isSelectWomen
                                            ? Colors.white
                                            : Colors.black),
                                  )),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            SizedBox(
                              height: 34,
                              width: 140,
                              child: OutlinedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          isSelectMen
                                              ? Colors.pink
                                              : null)),
                                  onPressed: () {
                                    setState(() {
                                      isSelectMen = true;
                                      isSelectWomen = false;
                                    });
                                  },
                                  child: Text(
                                    "Men",
                                    style: TextStyle(
                                        color: isSelectMen
                                            ? Colors.white
                                            : Colors.black),
                                  )),
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
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          isSelectFemale
                                              ? Colors.pink
                                              : Colors.transparent)),
                                  onPressed: () {
                                    setState(() {
                                      isSelectFemale = true;
                                      isSelectMale = false;
                                    });
                                  },
                                  child: Text(
                                    "Female",
                                    style: TextStyle(
                                        color: isSelectFemale
                                            ? Colors.white
                                            : Colors.black),
                                  )),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            SizedBox(
                              height: 34,
                              width: 140,
                              child: OutlinedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          isSelectMale
                                              ? Colors.pink
                                              : Colors.transparent)),
                                  onPressed: () {
                                    setState(() {
                                      isSelectMale = true;
                                      isSelectFemale = false;
                                    });
                                  },
                                  child: Text(
                                    "Male",
                                    style: TextStyle(
                                        color: isSelectMale
                                            ? Colors.white
                                            : Colors.black),
                                  )),
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
                      () => Stack(children: [
                        InPutTextFiled(
                          enabeled: false,
                          text: "Date of Birth",
                          labelText:
                              "${controller.selectedBirthday.value != null ? "${controller.selectedBirthday.value!.day} / ${controller.selectedBirthday.value!.month} / ${controller.selectedBirthday.value!.year}" : 'DD / MM / YYYY'}",
                          width: 250,
                          sufiIcon: true,
                        ),
                        Positioned(
                            right: 0,
                            top: 28,
                            child: IconButton(
                          onPressed: () async {
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
                          icon: Icon(Icons.calendar_month_outlined),
                        ))
                      ]),
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
                    CustomButton(
                      text: "Submit",
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottomScreen(),
                          )),
                      height: 30,
                      width: 150,
                      borderRadius: 30,
                    ),
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
                hintStyle: TextStyle(
                    color: sufiIcon? Colors.black: null,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                    ),
            cursorColor: Colors.black,
            cursorWidth: 2,
          ),
        )
      ],
    );
  }
}
