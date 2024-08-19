import 'package:flutter/material.dart';
import 'package:love_tale/app/ui/pages/Auth/chat_screen.dart';
import 'package:love_tale/app/ui/pages/four_likesScreen.dart';
import 'package:love_tale/app/ui/pages/likes_screen.dart';
import 'package:love_tale/app/ui/pages/topPicksScreen.dart';
import 'package:love_tale/app/utils/widgets/custom_tabbar.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  String _currentSelection = "Likes";

  @override
  Widget build(BuildContext context) {
    return ChatScreen();
  }
}
