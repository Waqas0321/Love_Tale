import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:love_tale/app/ui/filters_Screen.dart';
import 'package:love_tale/app/ui/settings_Screen.dart';
import 'package:love_tale/app/utils/const/app_color.dart';
import 'package:love_tale/app/utils/const/app_images.dart';


class Matchesscreen extends StatelessWidget {
  const Matchesscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(67),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: AppColors.customGradient,
            ),
          ),
          title: Row(
            children: [
              CircleAvatar(
                radius: 19,
                backgroundImage: AssetImage(AppImages.Pic6), // Replace with actual image URL
              ),
              SizedBox(width: 10),
              Text(
                'Celina',
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Filters()));
                  },
                  child: Image.asset(AppImages.Filter)),
              SizedBox(width: 8,),
              InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Settings(),));
                  },
                  child: Icon(Icons.settings, color: Colors.black54,size: 22,)),

            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.5,
        ),
      ),
    );
  }
}
