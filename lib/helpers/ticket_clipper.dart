import 'package:flutter/material.dart';

class TicketClipper extends CustomClipper<Path> {
  TicketClipper({
    this.position = 50,
    this.radius = 15,
  });

  double position;
  final double radius;

  @override
  Path getClip(Size size) {
    var h = size.height;
    var w = size.width;

    position = position + (radius * 0.25);

    Path path = Path();

    path.moveTo(0, 0);
    path.lineTo(position - radius, 0.0);

    path.lineTo(w, 0.0);
    path.lineTo(w, position - radius);
    path.arcToPoint(Offset(w, position),
        clockwise: false, radius: const Radius.circular(1));

    path.lineTo(w, h);
    path.lineTo(position, h);

    path.lineTo(0.0, h);
    path.lineTo(0, position);
    path.arcToPoint(Offset(0, position - radius),
        clockwise: false, radius: const Radius.circular(1));

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
