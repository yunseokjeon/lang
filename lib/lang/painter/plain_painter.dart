import 'package:flutter/material.dart';

import '../states/player_state_controller.dart';

class PlainPainter extends CustomPainter {
  final double widgetSize;
  final PlayerSateController playerStateController;

  PlainPainter({required this.widgetSize, required this.playerStateController});

  @override
  void paint(Canvas canvas, Size size) {
    final crossbeamPath = Path()..lineTo(size.width, 0);
    // ..lineTo(widgetSize * 0.9, 0);

    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    canvas.drawPath(crossbeamPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
