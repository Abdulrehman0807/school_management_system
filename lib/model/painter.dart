import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var height = size.height;
    var width = size.width;

    var paint = Paint()..color = Colors.blue;
    var paint1 = Paint()..color = Colors.blue;
    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(width * 0.5, height * 0.3, width, 0);
    path.close();

    Path path1 = Path();

    path1.moveTo(0, height);
    path1.quadraticBezierTo(width * 0.5, height * 0.83, width, height);

    canvas.drawPath(path1, paint1);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
