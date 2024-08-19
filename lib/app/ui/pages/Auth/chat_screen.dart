import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:love_tale/Constants/love_tale_Sizes.dart';
import '../../../controllers/auth/chat_controller.dart';
import '../../chat_item.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: ChatScreen(),
    );
  }
}
class ChatScreen extends StatelessWidget {
  final ChatController chatController = Get.put(ChatController());
  LoveTaleSizes _sizes =LoveTaleSizes();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = _sizes.isMobileFun();
        return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.only(left: 13, right: 10),
          child: Column(
            children: [
              SizedBox(height: 16),
              SizedBox(
                child: isMobile? Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_rounded,
                          color: Colors.pink, size: 27),
                    ),
                    SizedBox(width: 124),
                    Text(
                      "Chat",
                      style: GoogleFonts.poppins(
                        fontSize: 23,
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ): null,
              ),
              SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  chatController.updateSearchText(value);
                },decoration: InputDecoration(
                prefixIcon: Icon(Icons.search,color: Colors.grey.shade400,),
              hintText: 'Search',
               hintStyle: TextStyle(
                  color: Color(0xffd9d9d9),
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                ),
                filled: true,
                fillColor: Colors.grey[50],
                contentPadding:
                EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),

                ),

              ),

              SizedBox(height: 10),
              Expanded(
                child: Obx(() {
                  var filteredMessages = chatController.messages.where((message) {
                    return message.username
                        .toLowerCase()
                        .contains(chatController.searchText.value.toLowerCase());
                  }).toList();

                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: filteredMessages.length,
                    itemBuilder: (context, index) {
                      var message = filteredMessages[index];
                      return ChatItem(
                        username: message.username,
                        message: message.message,
                        time: message.time,
                        image: message.image,
                        isUnread: message.isUnread,
                        isOnline: message.isOnline,
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      );},
    );
  }
}
