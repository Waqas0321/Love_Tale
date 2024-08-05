import 'package:get/get.dart';
import '../../utils/const/app_images.dart';

class ChatController extends GetxController {
  var searchText = ''.obs;
  var messages = <Message>[
    Message('Dennis Steele', 'This is a message preview', '12:00 PM', AppImages.Pic1, isUnread: true, isOnline: true),
    Message('Rosa Richards', 'Another message preview', '1:00 AM', AppImages.Pic2, isUnread: false, isOnline: false),
    Message('Lora Barnett', "Hey, How's life going", '2:00 PM', AppImages.Pic3, isUnread: true, isOnline: false),
    Message('John Doe', 'Checking in', '3:00 PM', AppImages.Pic4, isUnread: false, isOnline: true),
    Message('Jane Smith', 'Meeting reminder', '4:00 PM', AppImages.Pic5, isUnread: true, isOnline: false),
    Message('Mike Johnson', 'See you soon', '5:00 PM', AppImages.Pic6, isUnread: false, isOnline: false),
    Message('Anna White', 'Happy Birthday!', '6:00 PM', AppImages.Pic7, isUnread: true, isOnline: true),
    Message('Dennis Steele', 'This is a message preview', '12:00 PM', AppImages.Pic4,isUnread: true, isOnline: true),
    Message('Rosa Richards', 'Another message preview', '1:00 AM', AppImages.Pic5,isUnread: true, isOnline: false),
    Message('Lora Barnett', "Hey, How's life going", '2:00 PM', AppImages.Pic6,isUnread:false, isOnline: false),
  ].obs;

  void updateSearchText(String text) {
    searchText.value = text;
  }

  void markAsRead(int index) {
    messages[index] = messages[index].copyWith(isUnread: false);
  }

  void toggleOnlineStatus(int index) {
    messages[index] = messages[index].copyWith(isOnline: !messages[index].isOnline);
  }
}

class Message {
  final String username;
  final String message;
  final String time;
  final String image;
  final bool isUnread;
  final bool isOnline;

  Message(this.username, this.message, this.time, this.image, {this.isUnread = false, this.isOnline = false});

  Message copyWith({String? username, String? message, String? time, String? image, bool? isUnread, bool? isOnline}) {
    return Message(
      username ?? this.username,
      message ?? this.message,
      time ?? this.time,
      image ?? this.image,
      isUnread: isUnread ?? this.isUnread,
      isOnline: isOnline ?? this.isOnline,
    );
  }
}
