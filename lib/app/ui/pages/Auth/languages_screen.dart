import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:love_tale/app/ui/pages/Auth/login.dart';
import 'package:love_tale/app/utils/const/app_color.dart';
import 'package:get/get.dart';
import '../../../../Constants/love_tale_Sizes.dart';
import '../../../utils/widgets/app_button.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({super.key});

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  String? _selectedItem;
  List<String> _items = ['English', 'Arabic', 'Hindi', 'Urdu', 'Italian'];

  // Mapping each language to its corresponding flag image path
  Map<String, String> _flagMap = {
    'English': 'assets/images/english.png',
    'Arabic': 'assets/images/arabic.png',
    'Hindi': 'assets/images/hindi.png',
    'Urdu': 'assets/images/urdu.png',
    'Italian': 'assets/images/italian.png',
  };
  final LoveTaleSizes _sizes = LoveTaleSizes();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double contentWidth = _sizes.getscreencontentWidth();
        bool isMobile = _sizes.isMobileFun();
        bool isDesktop = _sizes.isDesktopFun();
       return Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child:isMobile? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Card(
                      elevation: 9,
                      color: AppColors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 14),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Text(
                                'Lanugage'.toUpperCase(),
                                style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.pink),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Text(
                                'Choose you language here for LoveTale',
                                style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black45),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: _items.map((String item) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black45,width: 1),
                                        borderRadius: BorderRadius.circular(32)
                                    ),
                                    child: RadioListTile<String>(
                                      title: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: AssetImage( _flagMap[item]!,),
                                            radius: 16,
                                          ),
                                          SizedBox(width: 12),
                                          Text(item),
                                        ],
                                      ),
                                      value: item,
                                      groupValue: _selectedItem,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          _selectedItem = newValue;
                                        });
                                      },
                                      activeColor: AppColors.pink, // Customize active radio button color
                                      controlAffinity: ListTileControlAffinity.trailing, // Moves the radio button to the right
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    child: CustomButton(
                      text: "Continue",
                      borderRadius: 32,
                      onPressed: () {
                        Get.to(LoginScreen());
                      },
                      height: LoveTaleSizes.buttonHeight,
                      width: 327,
                    ),
                  ),
                ],
              ):Center(
                child: Container(
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Card(
                          elevation: 9,
                          color: AppColors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 14),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Text(
                                    'Lanugage'.toUpperCase(),
                                    style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.pink),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: Text(
                                    'Choose you language here for LoveTale',
                                    style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.black45),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: _items.map((String item) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 4),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black45,width: 1),
                                            borderRadius: BorderRadius.circular(32)
                                        ),
                                        child: RadioListTile<String>(
                                          title: Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundImage: AssetImage( _flagMap[item]!,),
                                                radius: 16,
                                              ),
                                              SizedBox(width: 12),
                                              Text(item),
                                            ],
                                          ),
                                          value: item,
                                          groupValue: _selectedItem,
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              _selectedItem = newValue;
                                            });
                                          },
                                          activeColor: AppColors.pink, // Customize active radio button color
                                          controlAffinity: ListTileControlAffinity.trailing, // Moves the radio button to the right
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        child: CustomButton(
                          text: "Continue",
                          borderRadius: 32,
                          onPressed: () {
                            Get.to(LoginScreen());
                          },
                          height: LoveTaleSizes.buttonHeight,
                          width: 327,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
