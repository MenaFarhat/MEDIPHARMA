import 'package:flutter/material.dart';

class BottomCenterClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(
        0, size.height * 0.9); // Adjust the vertical position of the curve
    path.quadraticBezierTo(size.width * 0.5, size.height, size.width,
        size.height * 0.9); // Adjust the curvature
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
