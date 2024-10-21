import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  final String messege;
  final String senderUID;
  final Timestamp dateTime;

  ChatModel({
    required this.messege,
    required this.senderUID,
    required this.dateTime,
  });
  factory ChatModel.fromJson(user) {
    return ChatModel(
      messege: user['message'],
      senderUID: user['senderUID'],
      dateTime: user['dateTime'],
    );
  }

  Map<String, dynamic> toJson(ChatModel user) {
    return {
      'message': user.messege,
      'dateTime': user.dateTime,
      'senderUID': user.senderUID,
    };
  }
}
