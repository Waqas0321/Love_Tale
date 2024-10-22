import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:love_tale/app/Models/user_chat_model.dart';
import 'package:love_tale/app/ui/pages/edit_profile.dart';
import 'package:love_tale/app/ui/settings_Screen.dart';
import '../../../Models/chat_model.dart';
import '../../../utils/const/app_color.dart';
import '../../../utils/firebase_util.dart';
import '../../gift_screen.dart';
import '../personal_details/custom_chart_row.dart';

class CombinedScreen extends StatefulWidget {
  final String username;
  final String age;
  final String status;
  final String location;
  final String image;
  final String selectedId;

  CombinedScreen({
    required this.username,
    required this.age,
    required this.status,
    required this.location,
    required this.image, required this.selectedId,
  });

  @override
  _CombinedScreenState createState() => _CombinedScreenState();
}

class _CombinedScreenState extends State<CombinedScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? user;

  void getCurrentUser() {
    user = _auth.currentUser;
  } // Get the current logged-in user

  List<MessageBubble> messages = [];

  final TextEditingController _controller = TextEditingController();

  void sendMessage() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        _firestore.collection('Messages').add({
          'text': _controller.text,
          'sender': user?.email,
          'time': FieldValue.serverTimestamp(),
          'userName': user!.displayName,
          'image': user!.photoURL,
        });
        _controller.clear();
      }
    });
  }

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      // Handle the picked image file
    }
  }

  // void _sendMessage(String text) {
  //   setState(() {
  //     final now = DateTime.now();
  //     messages.add({
  //       "message": text,
  //       "time": "${now.hour}:${now.minute} ${now.hour >= 12 ? 'PM' : 'AM'}",
  //       "isMe": "true",
  //       "date": DateFormat('yyyy-MM-dd').format(now),
  //     });
  //     _controller.clear();
  //   });
  // }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
  final showProfileSection = true;
  final showTopBar = false;

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(67),
          child: AppBar(
            foregroundColor: Colors.white,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: AppColors.customGradient,
              ),
            ),
            title: Row(
              children: [
                CircleAvatar(
                  radius: 19,
                  backgroundImage: NetworkImage(
                      widget.image), // Replace with actual image URL
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 150,
                  child: Text(
                    widget.username,
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GiftScreen(),
                          ));
                    },
                    child: Icon(
                      Icons.card_giftcard,
                      color: Colors.white,
                      size: 28,
                    )),
                SizedBox(
                  width: 4,
                ),
                InkWell(
                    onTap: () {
                      Get.to(SettingsScreen());
                    },
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 28,
                    )),
              ],
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.5,
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              // Only show ProfileSection if chat.myMessages.length <= 4
              StreamBuilder(
                stream: FirebaseUtil.userReference
                    .doc(user!.uid)
                    .collection("mychats")
                    .where("receiverUID", isEqualTo: widget.selectedId)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return ProfileSection(
                      username: widget.username,
                      age: widget.age,
                      status: widget.status,
                      location: widget.location,
                      image: widget.image,
                    );
                  }

                  final chat = UserChatModel.fromJson(snapshot.data!.docs[0].data());
                  // Check if the number of messages is less than or equal to 4
                  if (chat.myMessages.length <= 4) {
                    return ProfileSection(
                      username: widget.username,
                      age: widget.age,
                      status: widget.status,
                      location: widget.location,
                      image: widget.image,
                    );
                  } else {
                    return SizedBox(height: 10,); // Return an empty container if messages are more than 4
                  }
                },
              ),
              SimplePercentageRow(),
          SizedBox(height: 10,),
          Expanded(
                child: StreamBuilder(
                  stream: FirebaseUtil.userReference
                      .doc(user!.uid)
                      .collection("mychats")
                      .where("receiverUID", isEqualTo: widget.selectedId)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData) {
                      return const Center(child: Text('Document does not exist or no data available.'));
                    }
                    if (snapshot.hasData) {
                      final data = snapshot.data!.docs;
                      if (data.isNotEmpty) {
                        UserChatModel chat = UserChatModel.fromJson(data[0].data());
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: chat.myMessages.length,
                          itemBuilder: (context, index) {
                            if (index < chat.myMessages.length) {
                              final data = chat.myMessages[index];
                              bool isSender = data.senderUID == user!.uid;
                              Timestamp time = data.dateTime;
                              String formattedTime = DateFormat.jm().format(time.toDate());
                              return MessageBubble(
                                isMe: isSender,
                                message: data.messege,
                                time: formattedTime,
                              );
                            } else {
                              return Container();
                            }
                          },
                        );
                      }
                    } else {
                      return Container();
                    }
                    return Container();
                  },
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(31),
                    topRight: Radius.circular(31),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0.2,
                      blurRadius: 2,
                      offset: Offset(1, -0.1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 7, top: 7, bottom: 5, right: 7),
                  child: Row(
                    children: [
                      SizedBox(width: 8),
                      Icon(Icons.add_circle_rounded,
                          color: AppColors.pink, size: 21),
                      SizedBox(width: 3),
                      InkWell(
                        onTap: () {
                          _pickImage(ImageSource.camera);
                        },
                        child: Icon(Icons.camera_alt_rounded,
                            color: Colors.pink, size: 21),
                      ),
                      SizedBox(width: 3),
                      InkWell(
                        onTap: () {
                          _pickImage(ImageSource.gallery);
                        },
                        child: Icon(Icons.photo, color: Colors.pink, size: 22),
                      ),
                      SizedBox(width: 3),
                      // InkWell(
                      //   onTap: () {
                      //     // Handle voice input
                      //   },
                      //   child: Icon(Icons.keyboard_voice_rounded, color: Colors.pink, size: 22),
                      // ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          width: 120,
                          height: 45,
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              hintText: 'Type a message',
                              hintStyle: TextStyle(color: Colors.grey[500]),
                              filled: true,
                              fillColor: Colors.grey[50],
                              // prefixIcon: Icon(
                              //   Icons.insert_emoticon,
                              //   color: Colors.grey.shade400,
                              // ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 7),
                      InkWell(
                        onTap: () {
                          FirebaseUtil.sendMessage(
                              ChatModel(
                                  messege: _controller.text.toString(),
                                  senderUID: FirebaseAuth.instance.currentUser!.uid,
                                  dateTime: Timestamp.now()),
                              widget.selectedId,
                              FirebaseAuth.instance.currentUser!.uid,
                              FirebaseAuth.instance.currentUser!.displayName!,
                              FirebaseAuth.instance.currentUser!.photoURL!,
                              widget.username,
                              "");
                          _controller.clear();
                          setState(() {
                          });
                        },
                        child: Icon(Icons.send, color: AppColors.pink),
                      ),
                      SizedBox(width: 11),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  final String username;
  final String age;
  final String status;
  final String location;
  final String image;

  ProfileSection({
    required this.username,
    required this.age,
    required this.status,
    required this.location,
    required this.image,
  });
  User? user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        GestureDetector(
          onTap: () => Get.to(EditProfile()),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 60,
              backgroundColor: AppColors.pink,
              child: CircleAvatar(
                radius: 56,
                backgroundImage: NetworkImage(image),
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
        Text(
          "$username, $age",
          style: GoogleFonts.poppins(
            fontSize: 23,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        Text(
          status,
          style: GoogleFonts.poppins(
            fontSize: 15,
            color: Colors.black54,
          ),
        ),
        SizedBox(height: 5),
        Text(
          location,
          style: GoogleFonts.poppins(
            fontSize: 13,
            color: Colors.black38,
          ),
        ),
        SizedBox(height: 17),
      ],
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final String time;
  final String? image;

  MessageBubble({
    required this.message,
    required this.isMe,
    required this.time,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isMe && image != null)
          CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage(image!),
          ),
        if (!isMe) SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7),
                margin: EdgeInsets.only(bottom: 5),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: isMe ? AppColors.pink : Colors.grey[100],
                  borderRadius: isMe
                      ? BorderRadius.only(
                          topLeft: Radius.circular(19),
                          topRight: Radius.circular(19),
                          bottomLeft: Radius.circular(19),
                          bottomRight: Radius.circular(0),
                        )
                      : BorderRadius.only(
                          topLeft: Radius.circular(19),
                          topRight: Radius.circular(19),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(19),
                        ),
                ),
                child: Text(
                  message,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: isMe ? 0 : 5, right: isMe ? 5 : 0, bottom: 5),
                child: Text(
                  time,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: Colors.black38,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
