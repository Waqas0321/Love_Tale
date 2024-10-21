class MessageUserModel {
  String name;
  String avatar;
  String time;
  int unreadMessage;
  String lastMessage;
  bool isOnline;

  MessageUserModel({
    required this.name,
    required this.avatar,
    required this.time,
    required this.unreadMessage,
    required this.lastMessage,
     this.isOnline=true,
  });
}

class MessageUserList {
  static List<MessageUserModel> list = [
    MessageUserModel(
      name: 'Oliver',
      avatar:
      'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=387&q=80',
      time: '45 min',
      unreadMessage: 0,
      lastMessage: 'Hi...',
    ),
    MessageUserModel(
      name: 'Amelia',
      avatar:
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80',
      time: '52 min',
      unreadMessage: 2,
      lastMessage: 'How are you? 😍',
      isOnline: false,
    ),
    MessageUserModel(
      name: 'Olivia',
      avatar:
      'https://images.unsplash.com/photo-1520295187453-cd239786490c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=388&q=80',
      time: '1 hour',
      unreadMessage: 0,
      lastMessage: 'I am here.',
      isOnline: false,
    ),
    MessageUserModel(
      name: 'George',
      avatar:
      'https://images.unsplash.com/photo-1628157588553-5eeea00af15c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=580&q=80',
      time: '1 hour',
      unreadMessage: 2,
      lastMessage: 'I am coming..😍',
    ),
    MessageUserModel(
      name: 'Alena',
      avatar:
      'https://images.unsplash.com/photo-1619895862022-09114b41f16f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80',
      time: '2 hour',
      unreadMessage: 1,
      lastMessage: 'What are you doing.',
      isOnline: false,
    ),
    MessageUserModel(
      name: 'Noah',
      avatar:
      'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      time: '4 hours',
      unreadMessage: 3,
      lastMessage: 'I like..',
      isOnline: false,
    ),
    MessageUserModel(
      name: 'Amelia',
      avatar:
      'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80',
      time: '4 hours',
      unreadMessage: 2,
      lastMessage: 'How are you?',
    ),
  ];
}
