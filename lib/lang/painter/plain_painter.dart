import 'package:flutter/material.dart';

import '../states/player_state_controller.dart';

class PlainPainter extends CustomPainter {
  final PlayerSateController playerStateController;

  PlainPainter({
    required this.playerStateController,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Path leftCrossbeam = Path()
      ..moveTo(0, size.height * 0.2)
      ..lineTo(size.width * playerStateController.getPlayPointerXRatio(),
          size.height * 0.2);

    Path rightCrossbeam = Path()
      ..moveTo(size.width * playerStateController.getPlayPointerXRatio(),
          size.height * 0.2)
      ..lineTo(size.width, size.height * 0.2);

    Path playPointer = Path()
      ..moveTo(size.width * playerStateController.getPlayPointerXRatio(),
          -size.height * 0.15)
      ..lineTo(size.width * playerStateController.getPlayPointerXRatio(),
          size.height * 0.5);

    final leftBeamPaint = Paint()
      ..color = Color(0xff435F8C)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    final rightBeamPaint = Paint()
      ..color = Color(0xff808080)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    canvas.drawPath(leftCrossbeam, leftBeamPaint);
    canvas.drawPath(rightCrossbeam, rightBeamPaint);
    canvas.drawPath(playPointer, leftBeamPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
