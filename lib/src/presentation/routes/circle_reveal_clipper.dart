import 'package:flutter/material.dart';

class CircleRevealClipper extends CustomClipper<Path> {
  final Offset center;
  final Animation<double> radius;

  CircleRevealClipper({required this.center, required this.radius});

  @override
  Path getClip(Size size) {
    return Path()
      ..addOval(Rect.fromCircle(radius: radius.value, center: center));
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
