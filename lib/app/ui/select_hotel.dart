import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:love_tale/app/ui/settings_Screen.dart';
import '../controllers/auth/hotel_controller.dart';
import '../utils/const/app_color.dart';
import '../utils/const/app_images.dart';
import '../utils/const/app_strings.dart';
import '../utils/widgets/app_button.dart';

class HotelDetailScreen extends StatelessWidget {
  final HotelController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final selectedHotel = controller.selectedHotel;
    return Scaffold(
      backgroundColor: Colors.white,
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
                backgroundImage: AssetImage(AppImages.Pic6),
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
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Settings(),));
                  } ,
                  child: Icon(Icons.settings, color: Colors.black54, size: 22)),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.5,
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(selectedHotel['image']!),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.white,
                  size: 27,
                ),
              ),
            ),
            SizedBox(height: 335),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                padding: EdgeInsets.only(top: 18, left: 30, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 14),
                    Text(
                      selectedHotel['name']!,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      selectedHotel['distance']!,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 22),
                    Text(
                      AppString.place,
                      style: GoogleFonts.poppins(
                        fontSize: 12.5,
                        letterSpacing: 0.5,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 37),
                    Center(
                      child: CustomButton(
                        text: "Book Now",
                        onPressed: () {},
                        textColor: Colors.white,
                        borderRadius: 28.0,
                        padding: 14.0,
                        fontSize: 18.0,
                        height: 52.0,
                        width: 358.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
