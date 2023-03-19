import 'package:flutter/material.dart';

import '../states/player_state_controller.dart';

class PlainPainter extends CustomPainter {
  final PlayerSateController playerStateController;

  PlainPainter({
    required this.playerStateController,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double verticalLength = size.height * 0.3;

    if (playerStateController.isPlayerExpanded) {
    } else {
      if (playerStateController.pointerAXRatio == 0.0 &&
          playerStateController.pointerBXRatio == 1.0) {
        Paint leftPlaybarPaint = Paint()
          ..style = PaintingStyle.fill
          ..color = Color(0xffAAAAAA).withOpacity(1.0);

        canvas.drawRect(
            Offset(
                    0,
                    size.height * playerStateController.playbarYRatio -
                        verticalLength) &
                Size(size.width * playerStateController.playPointerXRatio,
                    verticalLength),
            leftPlaybarPaint);

        Paint rightPlaybarPaint = Paint()
          ..style = PaintingStyle.fill
          ..color = Color(0xffFFFFFF).withOpacity(0.8);

        canvas.drawRect(
            Offset(
                    size.width * playerStateController.playPointerXRatio,
                    size.height * playerStateController.playbarYRatio -
                        verticalLength) &
                Size(size.width * (1 - playerStateController.playPointerXRatio),
                    verticalLength),
            rightPlaybarPaint);

        RangePointer.leftRightClipPath(
            canvas, size, playerStateController, verticalLength);

        RangePointer.pointerA(canvas, size, playerStateController,
            playerStateController.getPointerAXRatio(), verticalLength);

        RangePointer.pointerB(canvas, size, playerStateController,
            playerStateController.pointerBXRatio, verticalLength);
      } else {
        Paint leftPlaybarPaint = Paint()
          ..style = PaintingStyle.fill
          ..color = Color(0xffAAAAAA).withOpacity(1.0);

        canvas.drawRect(
            Offset(
                    0,
                    size.height * playerStateController.playbarYRatio -
                        verticalLength) &
                Size(size.width * playerStateController.pointerAXRatio,
                    verticalLength),
            leftPlaybarPaint);

        Paint aRangePaint = Paint()
          ..style = PaintingStyle.fill
          ..color = Color(0xff0A4141).withOpacity(1.0);

        canvas.drawRect(
            Offset(
                    size.width * playerStateController.pointerAXRatio,
                    size.height * playerStateController.playbarYRatio -
                        verticalLength) &
                Size(
                    size.width *
                        (playerStateController.playPointerXRatio -
                            playerStateController.pointerAXRatio),
                    verticalLength),
            aRangePaint);

        Paint bRangePaint = Paint()
          ..style = PaintingStyle.fill
          ..color = Color(0xff38A5A5).withOpacity(1.0);

        canvas.drawRect(
            Offset(
                    size.width * playerStateController.playPointerXRatio,
                    size.height * playerStateController.playbarYRatio -
                        verticalLength) &
                Size(
                    size.width *
                        (playerStateController.pointerBXRatio -
                            playerStateController.playPointerXRatio),
                    verticalLength),
            bRangePaint);

        Paint rightPlaybarPaint = Paint()
          ..style = PaintingStyle.fill
          ..color = Color(0xffAAAAAA).withOpacity(1.0);

        canvas.drawRect(
            Offset(
                    size.width * playerStateController.pointerBXRatio,
                    size.height * playerStateController.playbarYRatio -
                        verticalLength) &
                Size(size.width * (1 - playerStateController.pointerBXRatio),
                    verticalLength),
            rightPlaybarPaint);

        RangePointer.leftRightClipPath(
            canvas, size, playerStateController, verticalLength);

        RangePointer.pointerA(canvas, size, playerStateController,
            playerStateController.getPointerAXRatio(), verticalLength);

        RangePointer.pointerB(canvas, size, playerStateController,
            playerStateController.pointerBXRatio, verticalLength);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RangePointer {
  static leftRightClipPath(Canvas canvas, Size size,
      PlayerSateController playerStateController, double verticalLength) {
    Path leftClipPath1 = Path()
      ..moveTo(
          0, size.height * playerStateController.playbarYRatio - verticalLength)
      ..lineTo(size.width * 0.01,
          size.height * playerStateController.playbarYRatio - verticalLength)
      ..lineTo(
          size.width * 0.01,
          size.height * playerStateController.playbarYRatio +
              verticalLength -
              verticalLength)
      ..lineTo(
          0,
          size.height * playerStateController.playbarYRatio +
              verticalLength -
              verticalLength)
      ..lineTo(
          0, size.height * playerStateController.playbarYRatio - verticalLength)
      ..close();

    Path leftClipPath2 = Path()
      ..moveTo(size.width * 0.01,
          size.height * playerStateController.playbarYRatio - verticalLength);
    leftClipPath2.quadraticBezierTo(
        0,
        size.height * playerStateController.playbarYRatio - verticalLength,
        0,
        size.height * playerStateController.playbarYRatio +
            (verticalLength / 2) -
            verticalLength);
    leftClipPath2.quadraticBezierTo(
        0,
        size.height * playerStateController.playbarYRatio +
            verticalLength -
            verticalLength,
        size.width * 0.01,
        size.height * playerStateController.playbarYRatio +
            verticalLength -
            verticalLength);
    leftClipPath2.lineTo(size.width * 0.01,
        size.height * playerStateController.playbarYRatio - verticalLength);

    leftClipPath1.fillType = PathFillType.evenOdd;
    leftClipPath1.addPath(leftClipPath2, Offset(0, 0));

    Paint clipPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Color(0xff3D3D3D).withOpacity(1.0);

    canvas.drawPath(leftClipPath1, clipPaint);

    Path rightClipPath1 = Path()
      ..moveTo(size.width * 0.99,
          size.height * playerStateController.playbarYRatio - verticalLength);
    rightClipPath1.lineTo(size.width,
        size.height * playerStateController.playbarYRatio - verticalLength);
    rightClipPath1.lineTo(
        size.width,
        size.height * playerStateController.playbarYRatio +
            verticalLength -
            verticalLength);
    rightClipPath1.lineTo(
        size.width * 0.99,
        size.height * playerStateController.playbarYRatio +
            verticalLength -
            verticalLength);
    rightClipPath1.lineTo(size.width * 0.99,
        size.height * playerStateController.playbarYRatio - verticalLength);
    rightClipPath1.close();

    Path rightClipPath2 = Path()
      ..moveTo(size.width * 0.99,
          size.height * playerStateController.playbarYRatio - verticalLength);
    rightClipPath2.quadraticBezierTo(
        size.width,
        size.height * playerStateController.playbarYRatio - verticalLength,
        size.width,
        size.height * playerStateController.playbarYRatio +
            (verticalLength / 2) -
            verticalLength);
    rightClipPath2.quadraticBezierTo(
        size.width,
        size.height * playerStateController.playbarYRatio +
            verticalLength -
            verticalLength,
        size.width * 0.99,
        size.height * playerStateController.playbarYRatio +
            verticalLength -
            verticalLength);
    rightClipPath2.lineTo(size.width * 0.99,
        size.height * playerStateController.playbarYRatio - verticalLength);
    rightClipPath2.close();

    rightClipPath1.fillType = PathFillType.evenOdd;
    rightClipPath1.addPath(rightClipPath2, Offset(0, 0));

    canvas.drawPath(rightClipPath1, clipPaint);
  }

  static pointerA(
      Canvas canvas,
      Size size,
      PlayerSateController playerStateController,
      double pointerAXRatio,
      double verticalLength) {
    verticalLength = 0;

    double widthRatio = 0.03, heightRatio = 0.5;
    double moveX = size.width * pointerAXRatio;
    double zeroWidth = widthRatio * size.width * 0.5000000;

    Path path = Path();
    final Paint paint = Paint();

    // Path 1 Fill
    paint.color = const Color(0xff379CB0);
    path.moveTo((widthRatio * size.width * 0.5 - zeroWidth) + moveX,
        heightRatio * size.height - verticalLength);
    path.lineTo((widthRatio * 0 - zeroWidth) + moveX,
        heightRatio * size.height * 0.68 - verticalLength);
    path.lineTo((widthRatio * 0 - zeroWidth) + moveX,
        heightRatio * size.height * 0.15 - verticalLength);
    path.lineTo((widthRatio * size.width - zeroWidth) + moveX,
        heightRatio * size.height * 0.15 - verticalLength);
    path.lineTo((widthRatio * size.width - zeroWidth) + moveX,
        heightRatio * size.height * 0.68 - verticalLength);
    path.lineTo((widthRatio * size.width * 0.5 - zeroWidth) + moveX,
        heightRatio * size.height - verticalLength);
    path.lineTo((widthRatio * size.width * 0.5 - zeroWidth) + moveX,
        heightRatio * size.height - verticalLength);
    canvas.drawPath(path, paint);

    // Path 2 Fill
    path = Path();
    paint.color = const Color(0xffffffff);
    path.moveTo((widthRatio * size.width * 0.19 - zeroWidth) + moveX,
        heightRatio * size.height * 0.62 - verticalLength);
    path.lineTo((widthRatio * size.width * 0.45 - zeroWidth) + moveX,
        heightRatio * size.height * 0.29 - verticalLength);
    path.lineTo((widthRatio * size.width * 0.55 - zeroWidth) + moveX,
        heightRatio * size.height * 0.29 - verticalLength);
    path.lineTo((widthRatio * size.width * 0.81 - zeroWidth) + moveX,
        heightRatio * size.height * 0.62 - verticalLength);
    path.lineTo((widthRatio * size.width * 0.75 - zeroWidth) + moveX,
        heightRatio * size.height * 0.62 - verticalLength);
    path.lineTo((widthRatio * size.width * 0.66 - zeroWidth) + moveX,
        heightRatio * size.height * 0.51 - verticalLength);
    path.lineTo((widthRatio * size.width * 0.34 - zeroWidth) + moveX,
        heightRatio * size.height * 0.51 - verticalLength);
    path.lineTo((widthRatio * size.width * 0.25 - zeroWidth) + moveX,
        heightRatio * size.height * 0.62 - verticalLength);
    path.lineTo((widthRatio * size.width * 0.19 - zeroWidth) + moveX,
        heightRatio * size.height * 0.62 - verticalLength);
    path.lineTo((widthRatio * size.width * 0.19 - zeroWidth) + moveX,
        heightRatio * size.height * 0.62 - verticalLength);
    path.moveTo((widthRatio * size.width * 0.50 - zeroWidth) + moveX,
        heightRatio * size.height * 0.3 - verticalLength);
    path.lineTo((widthRatio * size.width * 0.36 - zeroWidth) + moveX,
        heightRatio * size.height * 0.49 - verticalLength);
    path.lineTo((widthRatio * size.width * 0.65 - zeroWidth) + moveX,
        heightRatio * size.height * 0.49 - verticalLength);
    path.lineTo((widthRatio * size.width * 0.50 - zeroWidth) + moveX,
        heightRatio * size.height * 0.3 - verticalLength);
    path.lineTo((widthRatio * size.width * 0.50 - zeroWidth) + moveX,
        heightRatio * size.height * 0.3 - verticalLength);
    canvas.drawPath(path, paint);
  }

  static pointerB(
      Canvas canvas,
      Size size,
      PlayerSateController playerStateController,
      double pointerBXRatio,
      double verticalLength) {
    verticalLength = verticalLength * 0.25;

    double widthRatio = 0.03, heightRatio = 0.4;
    double moveX = size.width * pointerBXRatio;
    double zeroWidth = widthRatio * size.width * 0.5000000;

    Path path = Path();
    final Paint paint = Paint();

    // Path 1 Fill
    paint.color = const Color(0xff379CB0);
    path.moveTo((widthRatio * size.width * 0.5 - zeroWidth) + moveX,
        heightRatio * size.height + verticalLength);
    path.lineTo((widthRatio * 0 - zeroWidth) + moveX,
        heightRatio * size.height * 0.62 + verticalLength);
    path.lineTo(
        (widthRatio * 0 - zeroWidth) + moveX, heightRatio * 0 + verticalLength);
    path.lineTo((widthRatio * size.width - zeroWidth) + moveX,
        heightRatio * 0 + verticalLength);
    path.lineTo((widthRatio * size.width - zeroWidth) + moveX,
        heightRatio * size.height * 0.62 + verticalLength);
    path.lineTo((widthRatio * size.width * 0.5 - zeroWidth) + moveX,
        heightRatio * size.height + verticalLength);
    path.lineTo((widthRatio * size.width * 0.5 - zeroWidth) + moveX,
        heightRatio * size.height + verticalLength);
    canvas.drawPath(path, paint);

    // Path 2 Fill
    path = Path();
    paint.color = const Color(0xffffffff);
    path.moveTo((widthRatio * size.width * 0.25 - zeroWidth) + moveX,
        heightRatio * size.height * 0.55 + verticalLength);
    path.lineTo((widthRatio * size.width * 0.25 - zeroWidth) + moveX,
        heightRatio * size.height * 0.16 + verticalLength);
    path.lineTo((widthRatio * size.width * 0.49 - zeroWidth) + moveX,
        heightRatio * size.height * 0.16 + verticalLength);
    path.cubicTo(
        (widthRatio * size.width * 0.52 - zeroWidth) + moveX,
        heightRatio * size.height * 0.16 + verticalLength,
        (widthRatio * size.width * 0.56 - zeroWidth) + moveX,
        heightRatio * size.height * 0.16 + verticalLength,
        (widthRatio * size.width * 0.59 - zeroWidth) + moveX,
        heightRatio * size.height * 0.17 + verticalLength);
    path.cubicTo(
        (widthRatio * size.width * 0.62 - zeroWidth) + moveX,
        heightRatio * size.height * 0.17 + verticalLength,
        (widthRatio * size.width * 0.65 - zeroWidth) + moveX,
        heightRatio * size.height * 0.17 + verticalLength,
        (widthRatio * size.width * 0.67 - zeroWidth) + moveX,
        heightRatio * size.height * 0.18 + verticalLength);
    path.cubicTo(
        (widthRatio * size.width * 0.70 - zeroWidth) + moveX,
        heightRatio * size.height * 0.19 + verticalLength,
        (widthRatio * size.width * 0.72 - zeroWidth) + moveX,
        heightRatio * size.height * 0.2 + verticalLength,
        (widthRatio * size.width * 0.73 - zeroWidth) + moveX,
        heightRatio * size.height * 0.21 + verticalLength);
    path.cubicTo(
        (widthRatio * size.width * 0.75 - zeroWidth) + moveX,
        heightRatio * size.height * 0.22 + verticalLength,
        (widthRatio * size.width * 0.75 - zeroWidth) + moveX,
        heightRatio * size.height * 0.24 + verticalLength,
        (widthRatio * size.width * 0.75 - zeroWidth) + moveX,
        heightRatio * size.height * 0.26 + verticalLength);
    path.cubicTo(
        (widthRatio * size.width * 0.75 - zeroWidth) + moveX,
        heightRatio * size.height * 0.28 + verticalLength,
        (widthRatio * size.width * 0.75 - zeroWidth) + moveX,
        heightRatio * size.height * 0.29 + verticalLength,
        (widthRatio * size.width * 0.74 - zeroWidth) + moveX,
        heightRatio * size.height * 0.3 + verticalLength);
    path.cubicTo(
        (widthRatio * size.width * 0.73 - zeroWidth) + moveX,
        heightRatio * size.height * 0.32 + verticalLength,
        (widthRatio * size.width * 0.71 - zeroWidth) + moveX,
        heightRatio * size.height * 0.33 + verticalLength,
        (widthRatio * size.width * 0.68 - zeroWidth) + moveX,
        heightRatio * size.height * 0.33 + verticalLength);
    path.cubicTo(
        (widthRatio * size.width * 0.66 - zeroWidth) + moveX,
        heightRatio * size.height * 0.34 + verticalLength,
        (widthRatio * size.width * 0.62 - zeroWidth) + moveX,
        heightRatio * size.height * 0.35 + verticalLength,
        (widthRatio * size.width * 0.57 - zeroWidth) + moveX,
        heightRatio * size.height * 0.35 + verticalLength);
    path.lineTo((widthRatio * size.width * 0.57 - zeroWidth) + moveX,
        heightRatio * size.height * 0.35 + verticalLength);
    path.cubicTo(
        (widthRatio * size.width * 0.63 - zeroWidth) + moveX,
        heightRatio * size.height * 0.35 + verticalLength,
        (widthRatio * size.width * 0.67 - zeroWidth) + moveX,
        heightRatio * size.height * 0.35 + verticalLength,
        (widthRatio * size.width * 0.70 - zeroWidth) + moveX,
        heightRatio * size.height * 0.36 + verticalLength);
    path.cubicTo(
        (widthRatio * size.width * 0.73 - zeroWidth) + moveX,
        heightRatio * size.height * 0.37 + verticalLength,
        (widthRatio * size.width * 0.76 - zeroWidth) + moveX,
        heightRatio * size.height * 0.38 + verticalLength,
        (widthRatio * size.width * 0.77 - zeroWidth) + moveX,
        heightRatio * size.height * 0.40 + verticalLength);
    path.cubicTo(
        (widthRatio * size.width * 0.78 - zeroWidth) + moveX,
        heightRatio * size.height * 0.41 + verticalLength,
        (widthRatio * size.width * 0.78 - zeroWidth) + moveX,
        heightRatio * size.height * 0.43 + verticalLength,
        (widthRatio * size.width * 0.78 - zeroWidth) + moveX,
        heightRatio * size.height * 0.45 + verticalLength);
    path.cubicTo(
        (widthRatio * size.width * 0.78 - zeroWidth) + moveX,
        heightRatio * size.height * 0.47 + verticalLength,
        (widthRatio * size.width * 0.78 - zeroWidth) + moveX,
        heightRatio * size.height * 0.49 + verticalLength,
        (widthRatio * size.width * 0.76 - zeroWidth) + moveX,
        heightRatio * size.height * 0.50 + verticalLength);
    path.cubicTo(
        (widthRatio * size.width * 0.74 - zeroWidth) + moveX,
        heightRatio * size.height * 0.51 + verticalLength,
        (widthRatio * size.width * 0.72 - zeroWidth) + moveX,
        heightRatio * size.height * 0.52 + verticalLength,
        (widthRatio * size.width * 0.69 - zeroWidth) + moveX,
        heightRatio * size.height * 0.53 + verticalLength);
    path.cubicTo(
        (widthRatio * size.width * 0.67 - zeroWidth) + moveX,
        heightRatio * size.height * 0.54 + verticalLength,
        (widthRatio * size.width * 0.64 - zeroWidth) + moveX,
        heightRatio * size.height * 0.54 + verticalLength,
        (widthRatio * size.width * 0.61 - zeroWidth) + moveX,
        heightRatio * size.height * 0.54 + verticalLength);
    path.cubicTo(
        (widthRatio * size.width * 0.57 - zeroWidth) + moveX,
        heightRatio * size.height * 0.54 + verticalLength,
        (widthRatio * size.width * 0.54 - zeroWidth) + moveX,
        heightRatio * size.height * 0.55 + verticalLength,
        (widthRatio * size.width * 0.51 - zeroWidth) + moveX,
        heightRatio * size.height * 0.55 + verticalLength);
    path.lineTo((widthRatio * size.width * 0.25 - zeroWidth) + moveX,
        heightRatio * size.height * 0.55 + verticalLength);
    path.lineTo((widthRatio * size.width * 0.25 - zeroWidth) + moveX,
        heightRatio * size.height * 0.55 + verticalLength);
    path.moveTo((widthRatio * size.width * 0.31 - zeroWidth) + moveX,
        heightRatio * size.height * 0.33 + verticalLength);
    path.lineTo((widthRatio * size.width * 0.49 - zeroWidth) + moveX,
        heightRatio * size.height * 0.33 + verticalLength);
    path.cubicTo(
        (widthRatio * size.width * 0.53 - zeroWidth) + moveX,
        heightRatio * size.height * 0.33 + verticalLength,
        (widthRatio * size.width * 0.57 - zeroWidth) + moveX,
        heightRatio * size.height * 0.33 + verticalLength,
        (widthRatio * size.width * 0.60 - zeroWidth) + moveX,
        heightRatio * size.height * 0.33 + verticalLength);
    path.cubicTo(
        (widthRatio * size.width * 0.63 - zeroWidth) + moveX,
        heightRatio * size.height * 0.33 + verticalLength,
        (widthRatio * size.width * 0.65 - zeroWidth) + moveX,
        heightRatio * size.height * 0.32 + verticalLength,
        (widthRatio * size.width * 0.67 - zeroWidth) + moveX,
        heightRatio * size.height * 0.31 + verticalLength);
    path.cubicTo(
        (widthRatio * size.width * 0.69 - zeroWidth) + moveX,
        heightRatio * size.height * 0.30 + verticalLength,
        (widthRatio * size.width * 0.70 - zeroWidth) + moveX,
        heightRatio * size.height * 0.29 + verticalLength,
        (widthRatio * size.width * 0.70 - zeroWidth) + moveX,
        heightRatio * size.height * 0.27 + verticalLength);
    path.cubicTo(
        (widthRatio * size.width * 0.70 - zeroWidth) + moveX,
        heightRatio * size.height * 0.24 + verticalLength,
        (widthRatio * size.width * 0.69 - zeroWidth) + moveX,
        heightRatio * size.height * 0.23 + verticalLength,
        (widthRatio * size.width * 0.67 - zeroWidth) + moveX,
        heightRatio * size.height * 0.21 + verticalLength);
    path.cubicTo(
        (widthRatio * size.width * 0.65 - zeroWidth) + moveX,
        heightRatio * size.height * 0.20 + verticalLength,
        (widthRatio * size.width * 0.62 - zeroWidth) + moveX,
        heightRatio * size.height * 0.20 + verticalLength,
        (widthRatio * size.width * 0.59 - zeroWidth) + moveX,
        heightRatio * size.height * 0.19 + verticalLength);
    path.cubicTo(
        (widthRatio * size.width * 0.56 - zeroWidth) + moveX,
        heightRatio * size.height * 0.19 + verticalLength,
        (widthRatio * size.width * 0.52 - zeroWidth) + moveX,
        heightRatio * size.height * 0.19 + verticalLength,
        (widthRatio * size.width * 0.49 - zeroWidth) + moveX,
        heightRatio * size.height * 0.19 + verticalLength);
    path.lineTo((widthRatio * size.width * 0.31 - zeroWidth) + moveX,
        heightRatio * size.height * 0.19 + verticalLength);
    path.lineTo((widthRatio * size.width * 0.31 - zeroWidth) + moveX,
        heightRatio * size.height * 0.33 + verticalLength);
    path.lineTo((widthRatio * size.width * 0.31 - zeroWidth) + moveX,
        heightRatio * size.height * 0.33 + verticalLength);
    path.moveTo((widthRatio * size.width * 0.31 - zeroWidth) + moveX,
        heightRatio * size.height * 0.52 + verticalLength);
    path.lineTo((widthRatio * size.width * 0.51 - zeroWidth) + moveX,
        heightRatio * size.height * 0.52 + verticalLength);
    path.cubicTo(
        (widthRatio * size.width * 0.55 - zeroWidth) + moveX,
        heightRatio * size.height * 0.52 + verticalLength,
        (widthRatio * size.width * 0.58 - zeroWidth) + moveX,
        heightRatio * size.height * 0.52 + verticalLength,
        (widthRatio * size.width * 0.62 - zeroWidth) + moveX,
        heightRatio * size.height * 0.51 + verticalLength);
    path.cubicTo(
        (widthRatio * size.width * 0.65 - zeroWidth) + moveX,
        heightRatio * size.height * 0.51 + verticalLength,
        (widthRatio * size.width * 0.68 - zeroWidth) + moveX,
        heightRatio * size.height * 0.5 + verticalLength,
        (widthRatio * size.width * 0.70 - zeroWidth) + moveX,
        heightRatio * size.height * 0.49 + verticalLength);
    path.cubicTo(
        (widthRatio * size.width * 0.72 - zeroWidth) + moveX,
        heightRatio * size.height * 0.48 + verticalLength,
        (widthRatio * size.width * 0.73 - zeroWidth) + moveX,
        heightRatio * size.height * 0.46 + verticalLength,
        (widthRatio * size.width * 0.73 - zeroWidth) + moveX,
        heightRatio * size.height * 0.44 + verticalLength);
    path.cubicTo(
        (widthRatio * size.width * 0.73 - zeroWidth) + moveX,
        heightRatio * size.height * 0.42 + verticalLength,
        (widthRatio * size.width * 0.71 - zeroWidth) + moveX,
        heightRatio * size.height * 0.40 + verticalLength,
        (widthRatio * size.width * 0.69 - zeroWidth) + moveX,
        heightRatio * size.height * 0.39 + verticalLength);
    path.cubicTo(
        (widthRatio * size.width * 0.67 - zeroWidth) + moveX,
        heightRatio * size.height * 0.38 + verticalLength,
        (widthRatio * size.width * 0.64 - zeroWidth) + moveX,
        heightRatio * size.height * 0.37 + verticalLength,
        (widthRatio * size.width * 0.61 - zeroWidth) + moveX,
        heightRatio * size.height * 0.37 + verticalLength);
    path.cubicTo(
        (widthRatio * size.width * 0.57 - zeroWidth) + moveX,
        heightRatio * size.height * 0.36 + verticalLength,
        (widthRatio * size.width * 0.53 - zeroWidth) + moveX,
        heightRatio * size.height * 0.36 + verticalLength,
        (widthRatio * size.width * 0.49 - zeroWidth) + moveX,
        heightRatio * size.height * 0.36 + verticalLength);
    path.lineTo((widthRatio * size.width * 0.31 - zeroWidth) + moveX,
        heightRatio * size.height * 0.36 + verticalLength);
    path.lineTo((widthRatio * size.width * 0.31 - zeroWidth) + moveX,
        heightRatio * size.height * 0.52 + verticalLength);
    path.lineTo((widthRatio * size.width * 0.31 - zeroWidth) + moveX,
        heightRatio * size.height * 0.52 + verticalLength);
    canvas.drawPath(path, paint);
  }
}
