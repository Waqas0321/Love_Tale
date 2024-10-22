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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    SizedBox(height: 16,),
                    Text('Select Lanugage',style:GoogleFonts.poppins(fontSize: 18) ,),
                SizedBox(height: 16,),
                Container(
                  height: 55,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(32)
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: AppColors.white,

                      value: _selectedItem,
                      hint: Text('Select Language',style: GoogleFonts.poppins(),),

                      // Items in the dropdown
                      items: _items.map((String item) {
                        return DropdownMenuItem<String>(

                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedItem = newValue;
                        });
                      },
                    ),
                  ),
                ),
                  ],
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
    );
  }
}
