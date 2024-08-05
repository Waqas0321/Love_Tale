import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const/text_style.dart';

class GridTextItem extends StatelessWidget {
  final String title;
  final String description;

  const GridTextItem({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: CustomTextStyles.subtitle2,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 6,),
        Container(
          // height: 65,
          padding: EdgeInsets.all(8.0),
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.white54],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(color: Colors.grey.shade300, width: 1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.w300
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
