// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../../bindings/bottom_screen.dart';
// import '../../../controllers/photo-controller.dart';
// import '../../../utils/const/app_color.dart';
// import '../../../utils/const/app_strings.dart';
// import '../../../utils/const/app_images.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: AddPhotosScreen(),
//     );
//   }
// }
//
// class AddPhotosScreen extends StatelessWidget {
//   final PhotoController _controller = Get.put(PhotoController()); // Initialize the controller
//
//   final List<String> images = [
//     AppImages.Pic2,
//     AppImages.Pic,
//     AppImages.Pic1,
//     AppImages.Pic3,
//     AppImages.Pic4,
//     AppImages.Pic5,
//     AppImages.Pic,
//     AppImages.Pic8,
//     AppImages.Pic1,
//     AppImages.Pic2,
//     AppImages.Pic6,
//     AppImages.Pic5,
//     AppImages.Pic6,
//     AppImages.Pic7,
//     AppImages.Pic8,
//     AppImages.Pic2,
//     AppImages.Pic6,
//     AppImages.Pic5,
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.only(left: 15, right: 15, top: 16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 43),
//             Row(
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Get.back();
//                   },
//                   child: Icon(Icons.arrow_back_rounded, color: Colors.pink, size: 27),
//                 ),
//                 SizedBox(width: 93.5),
//                 Text(
//                   AppString.add_photo,
//                   style: GoogleFonts.poppins(
//                     fontSize: 23,
//                     color: Colors.black87,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ],
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 10, right: 10, top: 23),
//                 child: GridView.builder(
//                   itemCount: images.length,
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                     crossAxisSpacing: 8.0,
//                     mainAxisSpacing: 8.0,
//                   ),
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         _controller.toggleSelection(index);
//                       },
//                       child: Obx(() {
//                         bool isSelected = _controller.isSelected(index);
//                         return Stack(
//                           children: [
//                             Container(
//                               width: 103,
//                               height: 104,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8),
//                                 image: DecorationImage(
//                                   image: AssetImage(images[index]),
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             if (isSelected)
//                               Positioned(
//                                 top: 60,
//                                 right: 5,
//                                 child: Container(
//                                   padding: EdgeInsets.all(4),
//                                   decoration: BoxDecoration(
//                                     // color: Colors.white,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: Icon(
//                                     Icons.check_circle,
//                                     color: AppColors.pink,
//                                   ),
//                                 ),
//                               ),
//                           ],
//                         );
//                       }),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),  bottomNavigationBar: Container(
//         height: 90,
//         width: 60,
//         padding: EdgeInsets.only(left:103,right:103,bottom: 10,top: 3), // Add padding at the bottom
//         child: Padding(
//           padding: EdgeInsets.only(left:16,right:16,bottom: 14,top: 12),
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: AppColors.pink,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(30),
//               ),
//               padding: EdgeInsets.symmetric(vertical: 15),
//             ),
//             onPressed: () {
//               Get.to(BottomScreen());
//             },
//             child: Center(
//               child: Text(
//                 'Done',
//                 style: GoogleFonts.poppins(fontSize: 18, color: Colors.white,  fontWeight: FontWeight.w500,),
//               ),
//             ),
//           ),
//         ),
//       ),
//       ),
//
//     );
//   }
// }
