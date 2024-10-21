import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:love_tale/Constants/love_tale_Sizes.dart';
import 'package:love_tale/app/data/ModelClass.dart';
import 'package:love_tale/app/ui/pages/Auth/profile_screen.dart';
import 'package:love_tale/app/utils/pref_util.dart';
import '../../../Models/chat_model.dart';
import '../../../controllers/auth/chat_controller.dart';
import '../../../utils/firebase_util.dart';
import '../../chat_item.dart';
import '../personal_details/custom_chart_row.dart';
class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}



class _ChatScreenState extends State<ChatScreen> {
  final ChatController chatController = Get.put(ChatController());
  LoveTaleSizes _sizes = LoveTaleSizes();
  final username = PrefUtil.getString('username');
  final userid = PrefUtil.getString("userid");
  Stream<List<UserModel>> fetchUsers() {
    return FirebaseFirestore.instance
        .collection('Users')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
      return UserModel.fromFirestore(doc.data() as Map<String, dynamic>, doc.id);
    }).toList());
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {

    User? currentUser;
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = _sizes.isMobileFun();
        return SafeArea(
          child: Scaffold(
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
                StreamBuilder<List<UserModel>>(
                  stream: fetchUsers(), // Use the stream instead of future
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error fetching users: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No users found.'));
                    } else {
                      final users = snapshot.data!;
                      final currentUserId = FirebaseAuth.instance.currentUser!.uid;

                      // Filter users who are not the current user
                      final filteredUsers = users.where((user) {
                        return user.id != currentUserId;
                      }).toList();

                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: filteredUsers.length,
                        itemBuilder: (context, index) {
                          final user = filteredUsers[index];
                          return ChatItem(
                            userId: user.id,
                            username: user.displayName ?? 'No name',
                            time: user.createdAt.toString(),
                            image: user.photoURL ?? '',
                          );
                        },
                      );
                    }
                  },
                ),

                // ElevatedButton(onPressed: () {
                //   }, child: Text('Fetch users IDs'))
                ],
              ),
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