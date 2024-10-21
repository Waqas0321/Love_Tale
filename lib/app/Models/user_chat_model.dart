import 'package:cloud_firestore/cloud_firestore.dart';

import 'chat_model.dart';

class UserChatModel {
  final List<ChatModel> myMessages;
  final String receiverUID;
  final String senderUID;
  final String userName;
  final String userImage;
  final bool seen;
  final int unseenCount;
  final Timestamp timestamp;
  final Map<String, dynamic> lastMessage;

  UserChatModel({
    required this.myMessages,
    required this.receiverUID,
    required this.senderUID,
    required this.userName,
    required this.userImage,
    required this.seen,
    required this.unseenCount,
    required this.timestamp,
    required this.lastMessage,
  });

  factory UserChatModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> messagesJson = json['myMessages'];
    List<ChatModel> myMessages =
        messagesJson.map((message) => ChatModel.fromJson(message)).toList();

    return UserChatModel(
      myMessages: myMessages,
      receiverUID: json['receiverUID'],
      senderUID: json['senderUID'],
      userName: json['userName'],
      userImage: json['userImage'],
      seen: json['seen'],
      unseenCount: json['unseenCount'],
      timestamp: json['timestamp'],
      lastMessage: json['lastMessage'],
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> myMessagesJson =
        myMessages.map((message) => message.toJson(message)).toList();

    return {
      'myMessages': myMessagesJson,
      'receiverUID': receiverUID,
      'senderUID': senderUID,
      'userName': userName,
      'userImage': userImage,
      'seen': seen,
      'unseenCount': unseenCount,
      'timestamp': timestamp,
      'lastMessage': lastMessage,
    };
  }
}
