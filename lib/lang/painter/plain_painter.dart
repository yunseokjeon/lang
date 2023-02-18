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
      ..moveTo(0, size.height * playerStateController.crossbeamYRatio)
      ..lineTo(size.width * playerStateController.getPlayPointerXRatio(),
          size.height * playerStateController.crossbeamYRatio);

    Path rightCrossbeam = Path()
      ..moveTo(size.width * playerStateController.getPlayPointerXRatio(),
          size.height * playerStateController.crossbeamYRatio)
      ..lineTo(
          size.width, size.height * playerStateController.crossbeamYRatio);

    Path playPointer = Path()
      ..moveTo(size.width * playerStateController.getPlayPointerXRatio(),
          size.height * playerStateController.playPointerYStartRatio)
      ..lineTo(size.width * playerStateController.getPlayPointerXRatio(),
          size.height * playerStateController.playPointerYEndRatio);

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

    RangePointer.pointerA(canvas, size, playerStateController,
        playerStateController.getPointerAXRatio());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RangePointer {
  static pointerA(Canvas canvas, Size size,
      PlayerSateController playerSateController, double pointerAXRatio) {
    double widthRatio = 0.05, heightRatio = playerSateController.pointerAYRatio;

    double floatingWidth = size.width * pointerAXRatio;
    double zeroWith = widthRatio * size.width * 0.5000000;

    Path path_0 = Path();

    path_0.moveTo(
        (widthRatio * size.width * 0.5000000 - zeroWith) + floatingWidth,
        heightRatio * size.height * 0.8933333);
    path_0.lineTo(
        (widthRatio * size.width * 0.08333333 - zeroWith) + floatingWidth,
        heightRatio * size.height * 0.5538080);
    path_0.lineTo(
        (widthRatio * size.width * 0.08333333 - zeroWith) + floatingWidth,
        heightRatio * size.height * 0.004444547);
    path_0.lineTo(
        (widthRatio * size.width * 0.9166667 - zeroWith) + floatingWidth,
        heightRatio * size.height * 0.004444453);
    path_0.lineTo(
        (widthRatio * size.width * 0.9166667 - zeroWith) + floatingWidth,
        heightRatio * size.height * 0.5538080);
    path_0.lineTo(
        (widthRatio * size.width * 0.5000000 - zeroWith) + floatingWidth,
        heightRatio * size.height * 0.8933333);
    path_0.close();

    Paint paint_0_fill = Paint()
      ..style = PaintingStyle.fill
      ..color = Color(0xff379CB0).withOpacity(0.71);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(
        (widthRatio * size.width * 0.2657687 - zeroWith) + floatingWidth,
        heightRatio * size.height * 0.5200000);
    path_1.lineTo(
        (widthRatio * size.width * 0.4727688 - zeroWith) + floatingWidth,
        heightRatio * size.height * 0.1596800);
    path_1.lineTo(
        (widthRatio * size.width * 0.5477688 - zeroWith) + floatingWidth,
        heightRatio * size.height * 0.1596800);
    path_1.lineTo(
        (widthRatio * size.width * 0.7567687 - zeroWith) + floatingWidth,
        heightRatio * size.height * 0.5200000);
    path_1.lineTo(
        (widthRatio * size.width * 0.7087687 - zeroWith) + floatingWidth,
        heightRatio * size.height * 0.5200000);
    path_1.lineTo(
        (widthRatio * size.width * 0.6417687 - zeroWith) + floatingWidth,
        heightRatio * size.height * 0.4016000);
    path_1.lineTo(
        (widthRatio * size.width * 0.3797687 - zeroWith) + floatingWidth,
        heightRatio * size.height * 0.4016000);
    path_1.lineTo(
        (widthRatio * size.width * 0.3117687 - zeroWith) + floatingWidth,
        heightRatio * size.height * 0.5200000);
    path_1.lineTo(
        (widthRatio * size.width * 0.2657687 - zeroWith) + floatingWidth,
        heightRatio * size.height * 0.5200000);
    path_1.close();
    path_1.moveTo(
        (widthRatio * size.width * 0.5107687 - zeroWith) + floatingWidth,
        heightRatio * size.height * 0.1724800);
    path_1.lineTo(
        (widthRatio * size.width * 0.3947687 - zeroWith) + floatingWidth,
        heightRatio * size.height * 0.3760000);
    path_1.lineTo(
        (widthRatio * size.width * 0.6267687 - zeroWith) + floatingWidth,
        heightRatio * size.height * 0.3760000);
    path_1.lineTo(
        (widthRatio * size.width * 0.5107687 - zeroWith) + floatingWidth,
        heightRatio * size.height * 0.1724800);
    path_1.close();

    Paint paint_1_fill = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white.withOpacity(1.0);

    canvas.drawPath(path_1, paint_1_fill);
  }
}
