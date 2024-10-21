import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:love_tale/app/utils/pref_util.dart';
import '../Models/chat_model.dart';

class FirebaseUtil {
  static CollectionReference userReference =
      FirebaseFirestore.instance.collection('userschat');

  static Future sendMessage(
      ChatModel chat,
      String receiverUid,
      String senderUid,
      String userName,
      String userImage,
      String receiverName,
      String receiverImage) async {
    DocumentSnapshot<Map<String, dynamic>> receiverData = await userReference
        .doc(senderUid)
        .collection('mychats')
        .doc(receiverUid)
        .get();
    String currentUserName = PrefUtil.getString(PrefUtil.userName);

    Map<String, dynamic> lastMessage = {
      'message': chat.messege,
      'timestamp': Timestamp.now(),
    };
    // print("Reciever name is $receiverName");
    // print("Sender name is $currentUserName");

    if (receiverData.exists) {
      // Update sender's chat with receiver
      await userReference
          .doc(senderUid)
          .collection('mychats')
          .doc(receiverUid)
          .update({
        'myMessages': FieldValue.arrayUnion([chat.toJson(chat)]),
        'timestamp': Timestamp.now(),
        'seen': false,
        'unseenCount': 0,
        'lastMessage': lastMessage,
      });
      await userReference
          .doc(receiverUid)
          .collection('mychats')
          .doc(senderUid)
          .update({
        'myMessages': FieldValue.arrayUnion([chat.toJson(chat)]),
        'timestamp': Timestamp.now(),
        'seen': false,
        'unseenCount': FieldValue.increment(1),
        'lastMessage': lastMessage,
      });
    } else {
      // Create sender's chat with receiver
      await userReference
          .doc(senderUid)
          .collection('mychats')
          .doc(receiverUid)
          .set({
        'myMessages': FieldValue.arrayUnion([chat.toJson(chat)]),
        'receiverUID': receiverUid,
        'senderUID': senderUid,
        'userName': userName,
        "userImage": userImage,
        'seen': false,
        'unseenCount': 0,
        'timestamp': Timestamp.now(),
        'lastMessage': lastMessage,
      }, SetOptions(merge: true));

      // Create receiver's chat with sender
      await userReference
          .doc(receiverUid)
          .collection('mychats')
          .doc(senderUid)
          .set({
        'myMessages': FieldValue.arrayUnion([chat.toJson(chat)]),
        'receiverUID': senderUid,
        'senderUID': receiverUid,
        'userName': currentUserName,
        "userImage": userImage,
        'seen': false,
        'unseenCount': 1,
        'timestamp': Timestamp.now(),
        'lastMessage': lastMessage,
      }, SetOptions(merge: true));
    }

    print("Success $senderUid");
  }

  static Future updateSeenStatus(
      String senderUid, String receiverUid, bool seen) async {
    await userReference
        .doc(senderUid)
        .collection('mychats')
        .doc(receiverUid)
        .update({'seen': seen, 'unseenCount': 0});
  }

  static Future markChatAsSeen(String senderUid, String receiverUid) async {
    await updateSeenStatus(senderUid, receiverUid, true);
  }

  static Future markChatAsUnseen(String senderUid, String receiverUid) async {
    await updateSeenStatus(senderUid, receiverUid, false);
  }

  static Future<List> fetchAllMyChats() async {
   final userid = FirebaseAuth.instance.currentUser!.uid;
   print('user ID = ${userid}');
    List chats = [];

    try {
      QuerySnapshot<Object> snapshot = await userReference.doc(userid).collection('mychats').get();

      for(var doc in snapshot.docs){
        chats.add(doc.data());
      }


      print('Docs in Fetch fun ${chats}');
         // Assuming you have a fromJson method in ChatModel
    } catch (e) {
      print("Error retrieving chats: $e");
    }

    return chats;
  }
}
