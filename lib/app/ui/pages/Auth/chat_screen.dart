import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:love_tale/Constants/love_tale_Sizes.dart';
import 'package:love_tale/app/ui/pages/Auth/profile_screen.dart';
import '../../../controllers/auth/chat_controller.dart';
import '../../chat_item.dart';
import '../personal_details/custom_chart_row.dart';

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
  User? user;
  LoveTaleSizes _sizes = LoveTaleSizes();

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
                  child: isMobile ? Row(
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
                  ) : null,
                ),
                SizedBox(height: 20),
                TextField(
                  onChanged: (value) {
                    chatController.updateSearchText(value);
                  }, decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade400,),
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
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('Messages')
                        .orderBy('time')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        final messages = snapshot.data!.docs.map((doc) {
                          return Message.fromDocument(doc);
                        }).toList();

                        // Create a Map to hold the last message for each user
                        Map<String, Message> lastMessagePerUser = {};

                        // Iterate through messages to get the last message per user
                        for (var message in messages) {
                          lastMessagePerUser[message.username] = message; // Update the last message for each user
                        }

                        // Convert the map values to a list for display
                        List<ChatItem> messagesBubbles = lastMessagePerUser.values.map((e) {
                          String formattedDate(DateTime dateTime) {
                            final DateFormat formatter = DateFormat('hh:mm a');
                            return formatter.format(dateTime);
                          }

                          return ChatItem(
                            username: e.username,
                            message: e.text, // Show the last message here
                            time: formattedDate(e.time.toDate()),
                            image: e.image,
                            isUnread: true,
                            isOnline: false,
                          );
                        }).toList();

                        return Expanded(
                          child: ListView(
                            reverse: false,
                            children: messagesBubbles,
                          ),
                        );
                      }
                    },
                  ),
                ),

                // Expanded(
                //   child: Obx(() {
                //     var filteredMessages = chatController.messages.where((
                //         message) {
                //       return message.username
                //           .toLowerCase()
                //           .contains(
                //           chatController.searchText.value.toLowerCase());
                //     }).toList();
                //
                //     return ListView.builder(
                //       padding: EdgeInsets.zero,
                //       itemCount: filteredMessages.length,
                //       itemBuilder: (context, index) {
                //         var message = filteredMessages[index];
                //         return ChatItem(
                //           username: message.username,
                //           message: message.message,
                //           time: message.time,
                //           image: message.image,
                //           isUnread: message.isUnread,
                //           isOnline: message.isOnline,
                //         );
                //       },
                //     );
                //   }),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
class Message {
  final String text;
  final String sender;
  final String image;
  final String username;
  final Timestamp time;


  Message({required this.text, required this.sender, required this.image, required this.time, required this.username,});

  // Factory method to create a Message from a Firestore document
  factory Message.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Message(
      text: data['text'] ?? '',
      username: data['userName'] ?? '',
      image: data['image'] ?? '',
      sender: data['sender'] ?? '',
      time: data['time'] ?? Timestamp.now(),
    );
  }
}