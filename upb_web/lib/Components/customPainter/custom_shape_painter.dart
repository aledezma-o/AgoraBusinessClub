import 'package:flutter/material.dart';

class CustomShapePainter extends CustomPainter {
  final List<Offset> points;
  CustomShapePainter({required this.points});


  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    var path = Path()..moveTo(points.first.dx, points.first.dy);
      for (var i = 1; i < points.length; i++) {
        path.lineTo(points[i].dx, points[i].dy);
      }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class CustomShape extends StatelessWidget {
  final List<Offset> points;

  CustomShape({required this.points});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CustomShapePainter( points: points),
    );
  }
}
