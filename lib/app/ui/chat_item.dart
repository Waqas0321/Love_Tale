import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:love_tale/app/ui/pages/Auth/profile_screen.dart';

class ChatItem extends StatelessWidget {
  final String username;
  final String message;
  final String time;
  final String image;
  final bool isUnread;
  final bool isOnline;

  ChatItem({
    required this.username,
    required this.message,
    required this.time,
    required this.image,
    this.isUnread = false,
    this.isOnline = false,
  });

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
              backgroundImage: AssetImage(image),
            ),
            if (isOnline)
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
          username,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
        ),
        subtitle: Text(
          message,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: isUnread ? FontWeight.w700 : FontWeight.w400,
            color: Colors.black38,
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isUnread)
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
              time,
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
                username: username,
                age: "23",
                status: "You're friends on Dater",
                location: "Lives in California, USA",
                image: image,
              ),
            ),
          );
        },
      ),
    );
  }
}
