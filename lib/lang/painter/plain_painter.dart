import 'package:flutter/material.dart';

import '../states/player_state_controller.dart';

class PlainPainter extends CustomPainter {
  final PlayerSateController playerStateController;

  PlainPainter({
    required this.playerStateController,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (playerStateController.isPlayerExpanded) {
    } else {
      double verticalLength = size.height * 0.3;

      if (playerStateController.pointerAXRatio == 0.0 &&
          playerStateController.pointerBXRatio == 1.0) {
        Paint leftPlaybarPaint = Paint()
          ..style = PaintingStyle.fill
          ..color = Color(0xffAAAAAA).withOpacity(0.8);

        canvas.drawRect(
            Offset(0, size.height * playerStateController.playbarYRatio) &
                Size(size.width * playerStateController.playPointerXRatio,
                    verticalLength),
            leftPlaybarPaint);

        Paint rightPlaybarPaint = Paint()
          ..style = PaintingStyle.fill
          ..color = Color(0xffFFFFFF).withOpacity(0.8);

        canvas.drawRect(
            Offset(size.width * playerStateController.playPointerXRatio,
                    size.height * playerStateController.playbarYRatio) &
                Size(size.width * (1 - playerStateController.playPointerXRatio),
                    verticalLength),
            rightPlaybarPaint);

        Path leftClipPath1 = Path()
          ..moveTo(0, size.height * playerStateController.playbarYRatio)
          ..lineTo(size.width * 0.01,
              size.height * playerStateController.playbarYRatio)
          ..lineTo(
              size.width * 0.01,
              size.height * playerStateController.playbarYRatio +
                  verticalLength)
          ..lineTo(
              0,
              size.height * playerStateController.playbarYRatio +
                  verticalLength)
          ..lineTo(0, size.height * playerStateController.playbarYRatio)
          ..close();

        Path leftClipPath2 = Path()
          ..moveTo(size.width * 0.01,
              size.height * playerStateController.playbarYRatio);
        leftClipPath2.quadraticBezierTo(
            0,
            size.height * playerStateController.playbarYRatio,
            0,
            size.height * playerStateController.playbarYRatio +
                (verticalLength / 2));
        leftClipPath2.quadraticBezierTo(
            0,
            size.height * playerStateController.playbarYRatio + verticalLength,
            size.width * 0.01,
            size.height * playerStateController.playbarYRatio + verticalLength);
        leftClipPath2.lineTo(size.width * 0.01,
            size.height * playerStateController.playbarYRatio);

        leftClipPath1.fillType = PathFillType.evenOdd;
        leftClipPath1.addPath(leftClipPath2, Offset(0, 0));

        Paint clipPaint = Paint()
          ..style = PaintingStyle.fill
          ..color = Color(0xff3D3D3D).withOpacity(1.0);

        canvas.drawPath(leftClipPath1, clipPaint);

        Path rightClipPath1 = Path()
          ..moveTo(size.width * 0.99,
              size.height * playerStateController.playbarYRatio);
        rightClipPath1.lineTo(
            size.width, size.height * playerStateController.playbarYRatio);
        rightClipPath1.lineTo(size.width,
            size.height * playerStateController.playbarYRatio + verticalLength);
        rightClipPath1.lineTo(size.width * 0.99,
            size.height * playerStateController.playbarYRatio + verticalLength);
        rightClipPath1.lineTo(size.width * 0.99,
            size.height * playerStateController.playbarYRatio);
        rightClipPath1.close();

        Path rightClipPath2 = Path()
          ..moveTo(size.width * 0.99,
              size.height * playerStateController.playbarYRatio);
        rightClipPath2.quadraticBezierTo(
            size.width,
            size.height * playerStateController.playbarYRatio,
            size.width,
            size.height * playerStateController.playbarYRatio +
                (verticalLength / 2));
        rightClipPath2.quadraticBezierTo(
            size.width,
            size.height * playerStateController.playbarYRatio + verticalLength,
            size.width * 0.99,
            size.height * playerStateController.playbarYRatio + verticalLength);
        rightClipPath2.lineTo(size.width * 0.99,
            size.height * playerStateController.playbarYRatio);
        rightClipPath2.close();

        rightClipPath1.fillType = PathFillType.evenOdd;
        rightClipPath1.addPath(rightClipPath2, Offset(0, 0));

        canvas.drawPath(rightClipPath1, clipPaint);

        RangePointer.pointerA(canvas, size, playerStateController,
            playerStateController.getPointerAXRatio());

        RangePointer.pointerB(canvas, size, playerStateController,
            playerStateController.pointerBXRatio);
      } else {}
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RangePointer {
  static pointerA(Canvas canvas, Size size,
      PlayerSateController playerStateController, double pointerAXRatio) {
    double widthRatio = 0.03,
        heightRatio = playerStateController.pointerAYRatio;
    double moveX = size.width * pointerAXRatio;
    double zeroWidth = widthRatio * size.width * 0.5000000;

    Path path = Path();
    final Paint paint = Paint();

    // Path 1 Fill
    paint.color = const Color(0xff379CB0);
    path.moveTo((widthRatio * size.width * 0.5 - zeroWidth) + moveX,
        heightRatio * size.height);
    path.lineTo(
        (widthRatio * 0 - zeroWidth) + moveX, heightRatio * size.height * 0.68);
    path.lineTo(
        (widthRatio * 0 - zeroWidth) + moveX, heightRatio * size.height * 0.15);
    path.lineTo((widthRatio * size.width - zeroWidth) + moveX,
        heightRatio * size.height * 0.15);
    path.lineTo((widthRatio * size.width - zeroWidth) + moveX,
        heightRatio * size.height * 0.68);
    path.lineTo((widthRatio * size.width * 0.5 - zeroWidth) + moveX,
        heightRatio * size.height);
    path.lineTo((widthRatio * size.width * 0.5 - zeroWidth) + moveX,
        heightRatio * size.height);
    canvas.drawPath(path, paint);

    // Path 2 Fill
    path = Path();
    paint.color = const Color(0xffffffff);
    path.moveTo((widthRatio * size.width * 0.19 - zeroWidth) + moveX,
        heightRatio * size.height * 0.62);
    path.lineTo((widthRatio * size.width * 0.45 - zeroWidth) + moveX,
        heightRatio * size.height * 0.29);
    path.lineTo((widthRatio * size.width * 0.55 - zeroWidth) + moveX,
        heightRatio * size.height * 0.29);
    path.lineTo((widthRatio * size.width * 0.81 - zeroWidth) + moveX,
        heightRatio * size.height * 0.62);
    path.lineTo((widthRatio * size.width * 0.75 - zeroWidth) + moveX,
        heightRatio * size.height * 0.62);
    path.lineTo((widthRatio * size.width * 0.66 - zeroWidth) + moveX,
        heightRatio * size.height * 0.51);
    path.lineTo((widthRatio * size.width * 0.34 - zeroWidth) + moveX,
        heightRatio * size.height * 0.51);
    path.lineTo((widthRatio * size.width * 0.25 - zeroWidth) + moveX,
        heightRatio * size.height * 0.62);
    path.lineTo((widthRatio * size.width * 0.19 - zeroWidth) + moveX,
        heightRatio * size.height * 0.62);
    path.lineTo((widthRatio * size.width * 0.19 - zeroWidth) + moveX,
        heightRatio * size.height * 0.62);
    path.moveTo((widthRatio * size.width * 0.50 - zeroWidth) + moveX,
        heightRatio * size.height * 0.3);
    path.lineTo((widthRatio * size.width * 0.36 - zeroWidth) + moveX,
        heightRatio * size.height * 0.49);
    path.lineTo((widthRatio * size.width * 0.65 - zeroWidth) + moveX,
        heightRatio * size.height * 0.49);
    path.lineTo((widthRatio * size.width * 0.50 - zeroWidth) + moveX,
        heightRatio * size.height * 0.3);
    path.lineTo((widthRatio * size.width * 0.50 - zeroWidth) + moveX,
        heightRatio * size.height * 0.3);
    canvas.drawPath(path, paint);
  }

  static pointerB(Canvas canvas, Size size,
      PlayerSateController playerStateController, double pointerBXRatio) {
    double widthRatio = 0.03,
        heightRatio = playerStateController.pointerBYRatio;
    double moveX = size.width * pointerBXRatio;
    double zeroWidth = widthRatio * size.width * 0.5000000;

    Path path = Path();
    final Paint paint = Paint();

    // Path 1 Fill
    paint.color = const Color(0xff379CB0);
    path.moveTo((widthRatio * size.width * 0.5 - zeroWidth) + moveX,
        heightRatio * size.height);
    path.lineTo(
        (widthRatio * 0 - zeroWidth) + moveX, heightRatio * size.height * 0.62);
    path.lineTo((widthRatio * 0 - zeroWidth) + moveX, heightRatio * 0);
    path.lineTo((widthRatio * size.width - zeroWidth) + moveX, heightRatio * 0);
    path.lineTo((widthRatio * size.width - zeroWidth) + moveX,
        heightRatio * size.height * 0.62);
    path.lineTo((widthRatio * size.width * 0.5 - zeroWidth) + moveX,
        heightRatio * size.height);
    path.lineTo((widthRatio * size.width * 0.5 - zeroWidth) + moveX,
        heightRatio * size.height);
    canvas.drawPath(path, paint);

    // Path 2 Fill
    path = Path();
    paint.color = const Color(0xffffffff);
    path.moveTo((widthRatio * size.width * 0.25 - zeroWidth) + moveX,
        heightRatio * size.height * 0.55);
    path.lineTo((widthRatio * size.width * 0.25 - zeroWidth) + moveX,
        heightRatio * size.height * 0.16);
    path.lineTo((widthRatio * size.width * 0.49 - zeroWidth) + moveX,
        heightRatio * size.height * 0.16);
    path.cubicTo(
        (widthRatio * size.width * 0.52 - zeroWidth) + moveX,
        heightRatio * size.height * 0.16,
        (widthRatio * size.width * 0.56 - zeroWidth) + moveX,
        heightRatio * size.height * 0.16,
        (widthRatio * size.width * 0.59 - zeroWidth) + moveX,
        heightRatio * size.height * 0.17);
    path.cubicTo(
        (widthRatio * size.width * 0.62 - zeroWidth) + moveX,
        heightRatio * size.height * 0.17,
        (widthRatio * size.width * 0.65 - zeroWidth) + moveX,
        heightRatio * size.height * 0.17,
        (widthRatio * size.width * 0.67 - zeroWidth) + moveX,
        heightRatio * size.height * 0.18);
    path.cubicTo(
        (widthRatio * size.width * 0.70 - zeroWidth) + moveX,
        heightRatio * size.height * 0.19,
        (widthRatio * size.width * 0.72 - zeroWidth) + moveX,
        heightRatio * size.height * 0.2,
        (widthRatio * size.width * 0.73 - zeroWidth) + moveX,
        heightRatio * size.height * 0.21);
    path.cubicTo(
        (widthRatio * size.width * 0.75 - zeroWidth) + moveX,
        heightRatio * size.height * 0.22,
        (widthRatio * size.width * 0.75 - zeroWidth) + moveX,
        heightRatio * size.height * 0.24,
        (widthRatio * size.width * 0.75 - zeroWidth) + moveX,
        heightRatio * size.height * 0.26);
    path.cubicTo(
        (widthRatio * size.width * 0.75 - zeroWidth) + moveX,
        heightRatio * size.height * 0.28,
        (widthRatio * size.width * 0.75 - zeroWidth) + moveX,
        heightRatio * size.height * 0.29,
        (widthRatio * size.width * 0.74 - zeroWidth) + moveX,
        heightRatio * size.height * 0.3);
    path.cubicTo(
        (widthRatio * size.width * 0.73 - zeroWidth) + moveX,
        heightRatio * size.height * 0.32,
        (widthRatio * size.width * 0.71 - zeroWidth) + moveX,
        heightRatio * size.height * 0.33,
        (widthRatio * size.width * 0.68 - zeroWidth) + moveX,
        heightRatio * size.height * 0.33);
    path.cubicTo(
        (widthRatio * size.width * 0.66 - zeroWidth) + moveX,
        heightRatio * size.height * 0.34,
        (widthRatio * size.width * 0.62 - zeroWidth) + moveX,
        heightRatio * size.height * 0.35,
        (widthRatio * size.width * 0.57 - zeroWidth) + moveX,
        heightRatio * size.height * 0.35);
    path.lineTo((widthRatio * size.width * 0.57 - zeroWidth) + moveX,
        heightRatio * size.height * 0.35);
    path.cubicTo(
        (widthRatio * size.width * 0.63 - zeroWidth) + moveX,
        heightRatio * size.height * 0.35,
        (widthRatio * size.width * 0.67 - zeroWidth) + moveX,
        heightRatio * size.height * 0.35,
        (widthRatio * size.width * 0.70 - zeroWidth) + moveX,
        heightRatio * size.height * 0.36);
    path.cubicTo(
        (widthRatio * size.width * 0.73 - zeroWidth) + moveX,
        heightRatio * size.height * 0.37,
        (widthRatio * size.width * 0.76 - zeroWidth) + moveX,
        heightRatio * size.height * 0.38,
        (widthRatio * size.width * 0.77 - zeroWidth) + moveX,
        heightRatio * size.height * 0.40);
    path.cubicTo(
        (widthRatio * size.width * 0.78 - zeroWidth) + moveX,
        heightRatio * size.height * 0.41,
        (widthRatio * size.width * 0.78 - zeroWidth) + moveX,
        heightRatio * size.height * 0.43,
        (widthRatio * size.width * 0.78 - zeroWidth) + moveX,
        heightRatio * size.height * 0.45);
    path.cubicTo(
        (widthRatio * size.width * 0.78 - zeroWidth) + moveX,
        heightRatio * size.height * 0.47,
        (widthRatio * size.width * 0.78 - zeroWidth) + moveX,
        heightRatio * size.height * 0.49,
        (widthRatio * size.width * 0.76 - zeroWidth) + moveX,
        heightRatio * size.height * 0.50);
    path.cubicTo(
        (widthRatio * size.width * 0.74 - zeroWidth) + moveX,
        heightRatio * size.height * 0.51,
        (widthRatio * size.width * 0.72 - zeroWidth) + moveX,
        heightRatio * size.height * 0.52,
        (widthRatio * size.width * 0.69 - zeroWidth) + moveX,
        heightRatio * size.height * 0.53);
    path.cubicTo(
        (widthRatio * size.width * 0.67 - zeroWidth) + moveX,
        heightRatio * size.height * 0.54,
        (widthRatio * size.width * 0.64 - zeroWidth) + moveX,
        heightRatio * size.height * 0.54,
        (widthRatio * size.width * 0.61 - zeroWidth) + moveX,
        heightRatio * size.height * 0.54);
    path.cubicTo(
        (widthRatio * size.width * 0.57 - zeroWidth) + moveX,
        heightRatio * size.height * 0.54,
        (widthRatio * size.width * 0.54 - zeroWidth) + moveX,
        heightRatio * size.height * 0.55,
        (widthRatio * size.width * 0.51 - zeroWidth) + moveX,
        heightRatio * size.height * 0.55);
    path.lineTo((widthRatio * size.width * 0.25 - zeroWidth) + moveX,
        heightRatio * size.height * 0.55);
    path.lineTo((widthRatio * size.width * 0.25 - zeroWidth) + moveX,
        heightRatio * size.height * 0.55);
    path.moveTo((widthRatio * size.width * 0.31 - zeroWidth) + moveX,
        heightRatio * size.height * 0.33);
    path.lineTo((widthRatio * size.width * 0.49 - zeroWidth) + moveX,
        heightRatio * size.height * 0.33);
    path.cubicTo(
        (widthRatio * size.width * 0.53 - zeroWidth) + moveX,
        heightRatio * size.height * 0.33,
        (widthRatio * size.width * 0.57 - zeroWidth) + moveX,
        heightRatio * size.height * 0.33,
        (widthRatio * size.width * 0.60 - zeroWidth) + moveX,
        heightRatio * size.height * 0.33);
    path.cubicTo(
        (widthRatio * size.width * 0.63 - zeroWidth) + moveX,
        heightRatio * size.height * 0.33,
        (widthRatio * size.width * 0.65 - zeroWidth) + moveX,
        heightRatio * size.height * 0.32,
        (widthRatio * size.width * 0.67 - zeroWidth) + moveX,
        heightRatio * size.height * 0.31);
    path.cubicTo(
        (widthRatio * size.width * 0.69 - zeroWidth) + moveX,
        heightRatio * size.height * 0.30,
        (widthRatio * size.width * 0.70 - zeroWidth) + moveX,
        heightRatio * size.height * 0.29,
        (widthRatio * size.width * 0.70 - zeroWidth) + moveX,
        heightRatio * size.height * 0.27);
    path.cubicTo(
        (widthRatio * size.width * 0.70 - zeroWidth) + moveX,
        heightRatio * size.height * 0.24,
        (widthRatio * size.width * 0.69 - zeroWidth) + moveX,
        heightRatio * size.height * 0.23,
        (widthRatio * size.width * 0.67 - zeroWidth) + moveX,
        heightRatio * size.height * 0.21);
    path.cubicTo(
        (widthRatio * size.width * 0.65 - zeroWidth) + moveX,
        heightRatio * size.height * 0.20,
        (widthRatio * size.width * 0.62 - zeroWidth) + moveX,
        heightRatio * size.height * 0.20,
        (widthRatio * size.width * 0.59 - zeroWidth) + moveX,
        heightRatio * size.height * 0.19);
    path.cubicTo(
        (widthRatio * size.width * 0.56 - zeroWidth) + moveX,
        heightRatio * size.height * 0.19,
        (widthRatio * size.width * 0.52 - zeroWidth) + moveX,
        heightRatio * size.height * 0.19,
        (widthRatio * size.width * 0.49 - zeroWidth) + moveX,
        heightRatio * size.height * 0.19);
    path.lineTo((widthRatio * size.width * 0.31 - zeroWidth) + moveX,
        heightRatio * size.height * 0.19);
    path.lineTo((widthRatio * size.width * 0.31 - zeroWidth) + moveX,
        heightRatio * size.height * 0.33);
    path.lineTo((widthRatio * size.width * 0.31 - zeroWidth) + moveX,
        heightRatio * size.height * 0.33);
    path.moveTo((widthRatio * size.width * 0.31 - zeroWidth) + moveX,
        heightRatio * size.height * 0.52);
    path.lineTo((widthRatio * size.width * 0.51 - zeroWidth) + moveX,
        heightRatio * size.height * 0.52);
    path.cubicTo(
        (widthRatio * size.width * 0.55 - zeroWidth) + moveX,
        heightRatio * size.height * 0.52,
        (widthRatio * size.width * 0.58 - zeroWidth) + moveX,
        heightRatio * size.height * 0.52,
        (widthRatio * size.width * 0.62 - zeroWidth) + moveX,
        heightRatio * size.height * 0.51);
    path.cubicTo(
        (widthRatio * size.width * 0.65 - zeroWidth) + moveX,
        heightRatio * size.height * 0.51,
        (widthRatio * size.width * 0.68 - zeroWidth) + moveX,
        heightRatio * size.height * 0.5,
        (widthRatio * size.width * 0.70 - zeroWidth) + moveX,
        heightRatio * size.height * 0.49);
    path.cubicTo(
        (widthRatio * size.width * 0.72 - zeroWidth) + moveX,
        heightRatio * size.height * 0.48,
        (widthRatio * size.width * 0.73 - zeroWidth) + moveX,
        heightRatio * size.height * 0.46,
        (widthRatio * size.width * 0.73 - zeroWidth) + moveX,
        heightRatio * size.height * 0.44);
    path.cubicTo(
        (widthRatio * size.width * 0.73 - zeroWidth) + moveX,
        heightRatio * size.height * 0.42,
        (widthRatio * size.width * 0.71 - zeroWidth) + moveX,
        heightRatio * size.height * 0.40,
        (widthRatio * size.width * 0.69 - zeroWidth) + moveX,
        heightRatio * size.height * 0.39);
    path.cubicTo(
        (widthRatio * size.width * 0.67 - zeroWidth) + moveX,
        heightRatio * size.height * 0.38,
        (widthRatio * size.width * 0.64 - zeroWidth) + moveX,
        heightRatio * size.height * 0.37,
        (widthRatio * size.width * 0.61 - zeroWidth) + moveX,
        heightRatio * size.height * 0.37);
    path.cubicTo(
        (widthRatio * size.width * 0.57 - zeroWidth) + moveX,
        heightRatio * size.height * 0.36,
        (widthRatio * size.width * 0.53 - zeroWidth) + moveX,
        heightRatio * size.height * 0.36,
        (widthRatio * size.width * 0.49 - zeroWidth) + moveX,
        heightRatio * size.height * 0.36);
    path.lineTo((widthRatio * size.width * 0.31 - zeroWidth) + moveX,
        heightRatio * size.height * 0.36);
    path.lineTo((widthRatio * size.width * 0.31 - zeroWidth) + moveX,
        heightRatio * size.height * 0.52);
    path.lineTo((widthRatio * size.width * 0.31 - zeroWidth) + moveX,
        heightRatio * size.height * 0.52);
    canvas.drawPath(path, paint);
  }

  static pointerAOld(Canvas canvas, Size size,
      PlayerSateController playerStateController, double pointerAXRatio) {
    double widthRatio = 0.05,
        heightRatio = playerStateController.pointerAYRatio;
    double floatingWidth = size.width * pointerAXRatio;
    double zeroWidth = widthRatio * size.width * 0.5000000;

    Path path_0 = Path();

    path_0.moveTo(
        (widthRatio * size.width * 0.5000000 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.8933333);
    path_0.lineTo(
        (widthRatio * size.width * 0.08333333 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5538080);
    path_0.lineTo(
        (widthRatio * size.width * 0.08333333 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.004444547);
    path_0.lineTo(
        (widthRatio * size.width * 0.9166667 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.004444453);
    path_0.lineTo(
        (widthRatio * size.width * 0.9166667 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5538080);
    path_0.lineTo(
        (widthRatio * size.width * 0.5000000 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.8933333);
    path_0.close();

    Paint paint_0_fill = Paint()
      ..style = PaintingStyle.fill
      ..color = Color(0xff379CB0).withOpacity(0.71);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(
        (widthRatio * size.width * 0.2657687 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5200000);
    path_1.lineTo(
        (widthRatio * size.width * 0.4727688 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.1596800);
    path_1.lineTo(
        (widthRatio * size.width * 0.5477688 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.1596800);
    path_1.lineTo(
        (widthRatio * size.width * 0.7567687 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5200000);
    path_1.lineTo(
        (widthRatio * size.width * 0.7087687 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5200000);
    path_1.lineTo(
        (widthRatio * size.width * 0.6417687 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4016000);
    path_1.lineTo(
        (widthRatio * size.width * 0.3797687 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4016000);
    path_1.lineTo(
        (widthRatio * size.width * 0.3117687 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5200000);
    path_1.lineTo(
        (widthRatio * size.width * 0.2657687 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5200000);
    path_1.close();
    path_1.moveTo(
        (widthRatio * size.width * 0.5107687 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.1724800);
    path_1.lineTo(
        (widthRatio * size.width * 0.3947687 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.3760000);
    path_1.lineTo(
        (widthRatio * size.width * 0.6267687 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.3760000);
    path_1.lineTo(
        (widthRatio * size.width * 0.5107687 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.1724800);
    path_1.close();

    Paint paint_1_fill = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white.withOpacity(1.0);

    canvas.drawPath(path_1, paint_1_fill);

    TextStyle textStyle =
        TextStyle(color: Colors.black, fontSize: size.width * 0.02);
    TextSpan textSpan = TextSpan(
        text: playerStateController.pointerAXRatio.toString(),
        style: textStyle);
    TextPainter textPainter =
        TextPainter(text: textSpan, textDirection: TextDirection.ltr);
    textPainter.layout(minWidth: 0, maxWidth: size.width * 0.1);
    Offset offset = Offset(floatingWidth, -size.height * 0.3);
    textPainter.paint(canvas, offset);
  }

  static pointerBOld(Canvas canvas, Size size,
      PlayerSateController playerStateController, double pointerBXRatio) {
    double widthRatio = 0.05,
        heightRatio = playerStateController.pointerBYRatio;
    double floatingWidth = size.width * pointerBXRatio;
    double zeroWidth = widthRatio * size.width * 0.5000000;

    /*
    widthRatio와 heightRatio로 포인터의 크기를 줄인다.
    floatingWidth로 포인터의 위치를 정한다.
    zeroWidth로 영점을 조절한다.
     */

    Path path_0 = Path();
    path_0.moveTo(
        (widthRatio * size.width * 0.5000000 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.9015159);
    path_0.lineTo(
        (widthRatio * size.width * 0.08333333 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.6121477);
    path_0.lineTo(
        (widthRatio * size.width * 0.08333333 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.1439398);
    path_0.lineTo(
        (widthRatio * size.width * 0.9166667 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.1439398);
    path_0.lineTo(
        (widthRatio * size.width * 0.9166667 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.6121477);
    path_0.lineTo(
        (widthRatio * size.width * 0.5000000 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.9015159);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff05B394).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(
        (widthRatio * size.width * 0.3107208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5795455);
    path_1.lineTo(
        (widthRatio * size.width * 0.3107208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.2724545);
    path_1.lineTo(
        (widthRatio * size.width * 0.5037208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.2724545);
    path_1.cubicTo(
        (widthRatio * size.width * 0.5297208 - zeroWidth) + floatingWidth,
        size.height * 0.2724545,
        (widthRatio * size.width * 0.5550542 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.2735455,
        (widthRatio * size.width * 0.5797208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.2757273);
    path_1.cubicTo(
        (widthRatio * size.width * 0.6050542 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.2775455,
        (widthRatio * size.width * 0.6277208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.2813636,
        (widthRatio * size.width * 0.6477208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.2871818);
    path_1.cubicTo(
        (widthRatio * size.width * 0.6677208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.2926364,
        (widthRatio * size.width * 0.6837208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.3008182,
        (widthRatio * size.width * 0.6957208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.3117273);
    path_1.cubicTo(
        (widthRatio * size.width * 0.7077208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.3222727,
        (widthRatio * size.width * 0.7137208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.3364545,
        (widthRatio * size.width * 0.7137208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.3542727);
    path_1.cubicTo(
        (widthRatio * size.width * 0.7137208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.3659091,
        (widthRatio * size.width * 0.7097208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.3768182,
        (widthRatio * size.width * 0.7017208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.3870000);
    path_1.cubicTo(
        (widthRatio * size.width * 0.6937208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.3968182,
        (widthRatio * size.width * 0.6787208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4048182,
        (widthRatio * size.width * 0.6567208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4110000);
    path_1.cubicTo(
        (widthRatio * size.width * 0.6353875 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4171818,
        (widthRatio * size.width * 0.6047208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4204545,
        (widthRatio * size.width * 0.5647208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4208182);
    path_1.lineTo(
        (widthRatio * size.width * 0.5647208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4224545);
    path_1.cubicTo(
        (widthRatio * size.width * 0.6113875 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4228182,
        (widthRatio * size.width * 0.6470542 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4266364,
        (widthRatio * size.width * 0.6717208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4339091);
    path_1.cubicTo(
        (widthRatio * size.width * 0.6970542 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4408182,
        (widthRatio * size.width * 0.7143875 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4500909,
        (widthRatio * size.width * 0.7237208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4617273);
    path_1.cubicTo(
        (widthRatio * size.width * 0.7330542 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4733636,
        (widthRatio * size.width * 0.7377208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4859091,
        (widthRatio * size.width * 0.7377208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4993636);
    path_1.cubicTo(
        (widthRatio * size.width * 0.7377208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5171818,
        (widthRatio * size.width * 0.7310542 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5313636,
        (widthRatio * size.width * 0.7177208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5419091);
    path_1.cubicTo(
        (widthRatio * size.width * 0.7050542 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5524545,
        (widthRatio * size.width * 0.6877208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5604545,
        (widthRatio * size.width * 0.6657208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5659091);
    path_1.cubicTo(
        (widthRatio * size.width * 0.6443875 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5713636,
        (widthRatio * size.width * 0.6207208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5750000,
        (widthRatio * size.width * 0.5947208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5768182);
    path_1.cubicTo(
        (widthRatio * size.width * 0.5687208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5786364,
        (widthRatio * size.width * 0.5427208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5795455,
        (widthRatio * size.width * 0.5167208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5795455);
    path_1.lineTo(
        (widthRatio * size.width * 0.3107208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5795455);
    path_1.close();
    path_1.moveTo(
        (widthRatio * size.width * 0.3557208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4104545);
    path_1.lineTo(
        (widthRatio * size.width * 0.4997208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4104545);
    path_1.cubicTo(
        (widthRatio * size.width * 0.5337208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4104545,
        (widthRatio * size.width * 0.5630542 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4093636,
        (widthRatio * size.width * 0.5877208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4071818);
    path_1.cubicTo(
        (widthRatio * size.width * 0.6130542 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4046364,
        (widthRatio * size.width * 0.6323875 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.3995455,
        (widthRatio * size.width * 0.6457208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.3919091);
    path_1.cubicTo(
        (widthRatio * size.width * 0.6597208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.3839091,
        (widthRatio * size.width * 0.6667208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.3717273,
        (widthRatio * size.width * 0.6667208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.3553636);
    path_1.cubicTo(
        (widthRatio * size.width * 0.6667208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.3368182,
        (widthRatio * size.width * 0.6590542 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.3233636,
        (widthRatio * size.width * 0.6437208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.3150000);
    path_1.cubicTo(
        (widthRatio * size.width * 0.6283875 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.3062727,
        (widthRatio * size.width * 0.6080542 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.3006364,
        (widthRatio * size.width * 0.5827208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.2980909);
    path_1.cubicTo(
        (widthRatio * size.width * 0.5573875 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.2955455,
        (widthRatio * size.width * 0.5300542 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.2942727,
        (widthRatio * size.width * 0.5007208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.2942727);
    path_1.lineTo(
        (widthRatio * size.width * 0.3557208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.2942727);
    path_1.lineTo(
        (widthRatio * size.width * 0.3557208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4104545);
    path_1.close();
    path_1.moveTo(
        (widthRatio * size.width * 0.3557208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5582727);
    path_1.lineTo(
        (widthRatio * size.width * 0.5147208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5582727);
    path_1.cubicTo(
        (widthRatio * size.width * 0.5473875 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5582727,
        (widthRatio * size.width * 0.5770542 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5570000,
        (widthRatio * size.width * 0.6037208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5544545);
    path_1.cubicTo(
        (widthRatio * size.width * 0.6303875 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5515455,
        (widthRatio * size.width * 0.6513875 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5457273,
        (widthRatio * size.width * 0.6667208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5370000);
    path_1.cubicTo(
        (widthRatio * size.width * 0.6827208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5282727,
        (widthRatio * size.width * 0.6907208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5151818,
        (widthRatio * size.width * 0.6907208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4977273);
    path_1.cubicTo(
        (widthRatio * size.width * 0.6907208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4791818,
        (widthRatio * size.width * 0.6820542 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4653636,
        (widthRatio * size.width * 0.6647208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4562727);
    path_1.cubicTo(
        (widthRatio * size.width * 0.6480542 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4468182,
        (widthRatio * size.width * 0.6250542 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4404545,
        (widthRatio * size.width * 0.5957208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4371818);
    path_1.cubicTo(
        (widthRatio * size.width * 0.5670542 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4335455,
        (widthRatio * size.width * 0.5353875 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4317273,
        (widthRatio * size.width * 0.5007208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4317273);
    path_1.lineTo(
        (widthRatio * size.width * 0.3557208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.4317273);
    path_1.lineTo(
        (widthRatio * size.width * 0.3557208 - zeroWidth) + floatingWidth,
        heightRatio * size.height * 0.5582727);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    TextStyle textStyle =
        TextStyle(color: Colors.black, fontSize: size.width * 0.02);
    TextSpan textSpan = TextSpan(
        text: playerStateController.pointerBXRatio.toString(),
        style: textStyle);
    TextPainter textPainter =
        TextPainter(text: textSpan, textDirection: TextDirection.ltr);
    textPainter.layout(minWidth: 0, maxWidth: size.width * 0.1);
    Offset offset = Offset(floatingWidth, -size.height * 0.3);
    textPainter.paint(canvas, offset);
  }
}
