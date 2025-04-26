import 'package:flutter/material.dart';

class TCustomCurvedEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    final firstCurve = Offset(0, size.height - 20);
    final lastCurve = Offset(30, size.height - 20);

    path.quadraticBezierTo(
      firstCurve.dx,
      firstCurve.dy,
      lastCurve.dx,
      lastCurve.dy,
    );

    final secondfristCurve = Offset(0, size.height - 20);
    final secondLastCurve = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(
      secondfristCurve.dx,
      secondfristCurve.dy,
      secondLastCurve.dx,
      secondLastCurve.dy,
    );

    final theardfirstCurve = Offset(size.width, size.height - 20);
    final thearlastCurve = Offset(size.width , size.height);
    path.quadraticBezierTo(
      theardfirstCurve.dx,
      theardfirstCurve.dy,
      thearlastCurve.dx,
      thearlastCurve.dy,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldclipper) {
    return true;
  }
}
