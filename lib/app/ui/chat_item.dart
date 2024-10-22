import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:love_tale/app/ui/pages/Auth/profile_screen.dart';

class ChatItem extends StatefulWidget {
  final String username;
  final String message;
  final String time;
  final String userId;
  final String image;
  final bool isUnread;
  final bool isOnline;

  ChatItem({
    required this.username,
     this.message= 'Message here',
    required this.time,
    required this.image,
    this.isUnread = false,
    this.isOnline = false, required this.userId,
  });

  @override
  State<ChatItem> createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  String _formatDate(String date) {

    final messageDate = DateTime.parse(date);
    final now = DateTime.now();
    final difference = now.difference(messageDate).inDays;
    if (difference == 0) return 'Today';
    if (difference == 1) return 'Yesterday';

    if(difference >= 1 && difference <= 6 ){
      return DateFormat('EEEE').format(messageDate);
    }
    return DateFormat('dd-MM-yyyy \n hh,mm').format(messageDate);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 12, right: 12),
        leading: Stack(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(widget.image),
            ),
            if (widget.isOnline)
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                ),
              ),
          ],
        ),
        title: Text(
          widget.username,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
        ),
        subtitle: Text(
          widget.message,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: widget.isUnread ? FontWeight.w700 : FontWeight.w400,
            color: Colors.black38,
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.isUnread)
              Container(
                margin: EdgeInsets.only(bottom: 3),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.pink.shade300,
                  shape: BoxShape.circle,
                ),
              ),
            Text(
              _formatDate(widget.time),
              style: GoogleFonts.poppins(
                fontSize: 11,
                color: Colors.black54,
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CombinedScreen (
                selectedId: widget.userId,
                username: widget.username,
                age: "23",
                status: "You're friends on LoveTale",
                location: "Lives in California, USA",
                image: widget.image,
              ),
            ),
          );
        },
      ),
    );
  }
}
