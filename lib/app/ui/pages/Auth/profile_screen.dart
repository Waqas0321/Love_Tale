import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../utils/const/app_color.dart';
import '../../../utils/const/app_images.dart';
import '../../gift_screen.dart';
import '../../settings_Screen.dart';
import '../personal_details/custom_chart_row.dart';

class CombinedScreen extends StatefulWidget {
  final String username;
  final String age;
  final String status;
  final String location;
  final String image;

  CombinedScreen({
    required this.username,
    required this.age,
    required this.status,
    required this.location,
    required this.image,
  });

  @override
  _CombinedScreenState createState() => _CombinedScreenState();
}

class _CombinedScreenState extends State<CombinedScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? user;

  void getMessqage() {
    setState(() {
      final now = DateTime.now();
    });
  }

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

  String _formatDate(String date) {
    final messageDate = DateTime.parse(date);
    final now = DateTime.now();
    final difference = now.difference(messageDate).inDays;

    if (difference == 0) return 'Today';
    if (difference == 1) return 'Yesterday';
    return DateFormat('MMM d, yyyy').format(messageDate);
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
                  backgroundImage: AssetImage(
                      AppImages.Pic6), // Replace with actual image URL
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
                      // Navigator.push(context, MaterialPageRoute(builder: (context) =>Setting() ,));
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
        body: Column(
          children: [
            if (showTopBar)
              Container(
                color: Colors.white,
                // elevation: 0,
                padding: EdgeInsets.only(left: 13, right: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.pink),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    // SizedBox(width: 54),
                    Text(
                      widget.username,
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600),
                    ),

                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(widget.image),
                    ),
                  ],
                ),
              ),
            if (showProfileSection)
              ProfileSection(
                username: widget.username,
                age: widget.age,
                status: widget.status,
                location: widget.location,
                image: widget.image,
              ),
            SimplePercentageRow(),
            // Expanded(
            //   child: ListView.builder(
            //     padding: EdgeInsets.symmetric(horizontal: 20),
            //     itemCount: messages.length,
            //     itemBuilder: (context, index) {
            //       final message = messages[index];
            //       final dateHeader = index == 0 ||
            //               messages[index]['date'] != messages[index - 1]['date']
            //           ? _formatDate(message['date']!)
            //           : null;
            //
            //       return Column(
            //         crossAxisAlignment: message[user?.email] == "true"
            //             ? CrossAxisAlignment.end
            //             : CrossAxisAlignment.start,
            //         children: [
            //           if (dateHeader != null)
            //             Padding(
            //               padding: const EdgeInsets.symmetric(vertical: 10),
            //               child: Center(
            //                 child: Container(
            //                   width: 90,
            //                   height: 30,
            //                   decoration: BoxDecoration(
            //                     color: Colors.white,
            //                     borderRadius: BorderRadius.circular(20),
            //                     boxShadow: [
            //                       BoxShadow(
            //                         color: Colors.grey.withOpacity(0.2),
            //                         spreadRadius: 0.2,
            //                         blurRadius: 2,
            //                         offset: Offset(0, 3),
            //                       ),
            //                     ],
            //                   ),
            //                   child: Center(
            //                     child: Text(
            //                       dateHeader,
            //                       style: GoogleFonts.poppins(
            //                         fontSize: 12.5,
            //                         color: AppColors.pink,
            //                       ),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ),
                      Expanded(
                        child: StreamBuilder(
                          stream: _firestore
                              .collection('Messages')
                              .orderBy('time')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if(!snapshot.hasData){
                              return Center(child: CircularProgressIndicator());
                            }else{
                              final messages = snapshot.data!.docs.reversed.map((doc) {
                                return Message.fromDocument(doc);
                              }).toList();
                              List<MessageBubble> messgesBubbles = messages.map((e) {
                                final currentUser = user?.email;
                                String formattedDate(DateTime dateTime) {
                                  // Define your desired format (e.g., 'yyyy-MM-dd HH:mm:ss')
                                  final DateFormat formatter = DateFormat('hh:mm a');
                                  return formatter.format(dateTime);
                                }
                                return MessageBubble(
                                  message: e.text,
                                  isMe: e.sender == currentUser,
                                  time: formattedDate(e.time.toDate()), // Convert timestamp to a readable date/time string
                                  image: e.sender != currentUser ? widget.image : null,
                                );
                              },).toList();
                              return ListView(
                                reverse: true,
                                children: messgesBubbles,
                              );
                            }
                          },
                        ),
                      ),

            //         ],
            //       );
            //     },
            //   ),
            // ),
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
                            prefixIcon: Icon(
                              Icons.insert_emoticon,
                              color: Colors.grey.shade400,
                            ),
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
                        sendMessage();
                        // if (_controller.text.trim().isNotEmpty) {
                        //   _sendMessage(_controller.text.trim());
                        // }
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.pink,
              size: 26,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Container(
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
              backgroundImage: AssetImage(image),
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
            backgroundImage: AssetImage(image!),
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
