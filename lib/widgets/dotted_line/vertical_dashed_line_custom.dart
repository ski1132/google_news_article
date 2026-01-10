import 'package:flutter/material.dart';

class VerticalDashedLineCustom extends StatelessWidget {
  final double dashHeight;
  final double dashSpace;
  final Color color;
  final double width;

  const VerticalDashedLineCustom({
    super.key,
    this.dashHeight = 4.0,
    this.dashSpace = 4.0,
    this.color = Colors.grey,
    this.width = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedVerticalLinePainter(
        dashHeight: dashHeight,
        dashSpace: dashSpace,
        color: color,
        width: width,
      ),
      size: Size(width, double.infinity), // Take full available height
    );
  }
}

class _DashedVerticalLinePainter extends CustomPainter {
  final double dashHeight;
  final double dashSpace;
  final Color color;
  final double width;

  _DashedVerticalLinePainter({
    required this.dashHeight,
    required this.dashSpace,
    required this.color,
    required this.width,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..strokeWidth = width
          ..style = PaintingStyle.stroke;

    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, startY),
        Offset(size.width / 2, startY + dashHeight),
        paint,
      );
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
