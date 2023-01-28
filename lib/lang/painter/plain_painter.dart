import 'package:flutter/material.dart';

import '../states/player_state_controller.dart';

class PlainPainter extends CustomPainter {
  final PlayerSateController playerStateController;

  PlainPainter({
    required this.playerStateController,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final crossbeamPath = Path()
      ..moveTo(0, size.height * 0.2)
      ..lineTo(size.width, size.height * 0.2);
    Path playPointer = Path()
      ..moveTo(size.width * playerStateController.getPlayPointerXRatio(),
          -size.height * 0.15)
      ..lineTo(size.width * playerStateController.getPlayPointerXRatio(),
          size.height * 0.5);

    final paint = Paint()
      ..color = Color(0xff435F8C)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    canvas.drawPath(crossbeamPath, paint);
    canvas.drawPath(playPointer, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
