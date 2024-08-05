// lib/widgets/custom_svg_image.dart
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvgImage extends StatelessWidget {
  final String assetPath;
  final double height;
  final double width;
  final BoxFit fit;
  final Color color;
  CustomSvgImage({
    required this.assetPath,
    this.height = 100.0,
    this.width = 100.0,
    this.fit = BoxFit.contain,
  this.color=Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetPath,
      height: height,
      width: width,
      fit: fit,
      color:color,
    );
  }
}
