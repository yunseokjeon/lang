import 'package:flutter/material.dart';

import '../states/player_state_controller.dart';
import '../states/vertical_category.dart';

class VerticalPainter extends CustomPainter {
  final PlayerSateController playerStateController;
  final VerticalCatogory category;

  VerticalPainter(
      {required this.playerStateController, required this.category});

  @override
  void paint(Canvas canvas, Size size) {
    VerticalFactory.volumeSlider(canvas, size, playerStateController, category);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class VerticalFactory {
  static volumeSlider(Canvas canvas, Size size,
      PlayerSateController playerStateController, VerticalCatogory category) {
    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffD7D7D7).withOpacity(1.0);

    canvas.drawRect(Offset(0, 0) & Size(size.width, size.height), paint_0_fill);

    if (category == VerticalCatogory.volume) {
      double volumeYRatio = playerStateController.volumeYRatio;
      double volumeIconRatio = 0.1;
      double volumeIconMoveX = size.width * 0.3;
      double volumeIconMoveY = size.height * 0.8;
      double volumeTextX = size.width * 0.55;
      double volumeTextY = size.height * 0.8;

      Paint volumePaint = Paint()
        ..style = PaintingStyle.fill
        ..color = Color(0xff466593).withOpacity(1.0);

      canvas.drawRect(
          Offset(0, 0 + (1 - volumeYRatio) * size.height) &
              Size(size.width, size.height * volumeYRatio),
          volumePaint);

      Path clipPath1 = Path()
        ..moveTo(0, 0)
        ..lineTo(size.width, 0)
        ..lineTo(size.width, size.height)
        ..lineTo(0, size.height)
        ..lineTo(0, 0)
        ..close();

      /*Path clipPath2 = Path()..moveTo(size.width * 0.1, size.height * 0.2);
      clipPath2.quadraticBezierTo(size.width * 0.1, size.height * 0.1,
          size.width * 0.2, size.height * 0.1);
      clipPath2.lineTo(size.width * 0.8, size.height * 0.1);
      clipPath2.quadraticBezierTo(size.width * 0.9, size.height * 0.1,
          size.width * 0.9, size.height * 0.2);
      clipPath2.lineTo(size.width * 0.9, size.height * 0.8);
      clipPath2.quadraticBezierTo(size.width * 0.9, size.height * 0.9,
          size.width * 0.8, size.height * 0.9);
      clipPath2.lineTo(size.width * 0.2, size.height * 0.9);
      clipPath2.quadraticBezierTo(size.width * 0.1, size.height * 0.9,
          size.width * 0.1, size.height * 0.8);
      clipPath2.lineTo(size.width * 0.1, size.height * 0.2);
      clipPath2.close();*/

      Path clipPath2 = Path()..moveTo(0, size.height * 0.2);
      clipPath2.quadraticBezierTo(0, 0, size.width * 0.2, 0);
      clipPath2.lineTo(size.width * 0.8, 0);
      clipPath2.quadraticBezierTo(size.width, 0, size.width, size.height * 0.2);
      clipPath2.lineTo(size.width, size.height * 0.8);
      clipPath2.quadraticBezierTo(
          size.width, size.height, size.width * 0.8, size.height);
      clipPath2.lineTo(size.width * 0.2, size.height);
      clipPath2.quadraticBezierTo(0, size.height, 0, size.height * 0.8);
      clipPath2.lineTo(0, size.height * 0.2);
      clipPath2.close();

      Paint clipPaint = Paint()
        ..style = PaintingStyle.fill
        ..color = Color(0xff3D3D3D).withOpacity(1.0);

      // 가운데 부분을 뚫어준다.
      clipPath1.fillType = PathFillType.evenOdd;
      clipPath1.addPath(clipPath2, Offset(0, 0));

      canvas.drawPath(clipPath1, clipPaint);

      Path volumeIconPath = Path();
      final Paint volumeIconPaint = Paint();

      volumeIconPaint.color = const Color(0xffffffff);
      volumeIconPath.moveTo(
          size.width * 0.91 * volumeIconRatio + volumeIconMoveX,
          0 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.cubicTo(
          size.width * 0.89 * volumeIconRatio + volumeIconMoveX,
          0 * volumeIconRatio + volumeIconMoveY,
          size.width * 0.87 * volumeIconRatio + volumeIconMoveX,
          0 * volumeIconRatio + volumeIconMoveY,
          size.width * 0.85 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.01 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.lineTo(
          size.width * 0.71 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.09 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.lineTo(
          size.width * 0.35 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.29 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.lineTo(
          size.width * 0.09 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.29 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.cubicTo(
          size.width * 0.04 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.29 * volumeIconRatio + volumeIconMoveY,
          0 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.32 * volumeIconRatio + volumeIconMoveY,
          0 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.35 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.lineTo(0 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.65 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.cubicTo(
          0 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.68 * volumeIconRatio + volumeIconMoveY,
          size.width * 0.04 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.71 * volumeIconRatio + volumeIconMoveY,
          size.width * 0.09 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.71 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.lineTo(
          size.width * 0.35 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.71 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.lineTo(
          size.width * 0.71 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.91 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.lineTo(
          size.width * 0.85 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.99 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.cubicTo(
          size.width * 0.89 * volumeIconRatio + volumeIconMoveX,
          size.height * 1.01 * volumeIconRatio + volumeIconMoveY,
          size.width * 0.95 * volumeIconRatio + volumeIconMoveX,
          size.height * volumeIconRatio + volumeIconMoveY,
          size.width * 0.98 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.98 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.cubicTo(
          size.width * 0.99 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.96 * volumeIconRatio + volumeIconMoveY,
          size.width * volumeIconRatio + volumeIconMoveX,
          size.height * 0.95 * volumeIconRatio + volumeIconMoveY,
          size.width * volumeIconRatio + volumeIconMoveX,
          size.height * 0.94 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.lineTo(size.width * volumeIconRatio + volumeIconMoveX,
          size.height * 0.06 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.cubicTo(
          size.width * volumeIconRatio + volumeIconMoveX,
          size.height * 0.03 * volumeIconRatio + volumeIconMoveY,
          size.width * 0.96 * volumeIconRatio + volumeIconMoveX,
          0 * volumeIconRatio + volumeIconMoveY,
          size.width * 0.91 * volumeIconRatio + volumeIconMoveX,
          0 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.lineTo(
          size.width * 0.91 * volumeIconRatio + volumeIconMoveX,
          0 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.moveTo(
          size.width * 0.7 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.85 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.lineTo(
          size.width * 0.38 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.67 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.cubicTo(
          size.width * 0.38 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.67 * volumeIconRatio + volumeIconMoveY,
          size.width * 0.37 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.67 * volumeIconRatio + volumeIconMoveY,
          size.width * 0.36 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.67 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.lineTo(
          size.width * 0.09 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.67 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.cubicTo(
          size.width * 0.07 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.67 * volumeIconRatio + volumeIconMoveY,
          size.width * 0.06 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.66 * volumeIconRatio + volumeIconMoveY,
          size.width * 0.06 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.65 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.lineTo(
          size.width * 0.06 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.35 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.cubicTo(
          size.width * 0.06 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.34 * volumeIconRatio + volumeIconMoveY,
          size.width * 0.07 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.33 * volumeIconRatio + volumeIconMoveY,
          size.width * 0.09 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.33 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.lineTo(
          size.width * 0.36 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.33 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.cubicTo(
          size.width * 0.37 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.33 * volumeIconRatio + volumeIconMoveY,
          size.width * 0.38 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.33 * volumeIconRatio + volumeIconMoveY,
          size.width * 0.38 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.33 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.lineTo(
          size.width * 0.7 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.15 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.lineTo(
          size.width * 0.7 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.85 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.lineTo(
          size.width * 0.7 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.85 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.moveTo(
          size.width * 0.94 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.94 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.cubicTo(
          size.width * 0.94 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.95 * volumeIconRatio + volumeIconMoveY,
          size.width * 0.93 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.95 * volumeIconRatio + volumeIconMoveY,
          size.width * 0.92 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.96 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.cubicTo(
          size.width * 0.91 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.96 * volumeIconRatio + volumeIconMoveY,
          size.width * 0.9 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.96 * volumeIconRatio + volumeIconMoveY,
          size.width * 0.89 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.95 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.lineTo(
          size.width * 0.76 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.88 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.lineTo(
          size.width * 0.76 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.12 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.lineTo(
          size.width * 0.89 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.05 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.cubicTo(
          size.width * 0.9 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.04 * volumeIconRatio + volumeIconMoveY,
          size.width * 0.92 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.04 * volumeIconRatio + volumeIconMoveY,
          size.width * 0.93 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.05 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.cubicTo(
          size.width * 0.94 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.05 * volumeIconRatio + volumeIconMoveY,
          size.width * 0.94 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.06 * volumeIconRatio + volumeIconMoveY,
          size.width * 0.94 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.06 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.lineTo(
          size.width * 0.94 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.94 * volumeIconRatio + volumeIconMoveY);
      volumeIconPath.lineTo(
          size.width * 0.94 * volumeIconRatio + volumeIconMoveX,
          size.height * 0.94 * volumeIconRatio + volumeIconMoveY);
      canvas.drawPath(volumeIconPath, volumeIconPaint);

      TextStyle volumeTextStyle =
          TextStyle(color: Colors.white, fontSize: size.width * 0.15);
      TextSpan volumeTextSpan = TextSpan(
          text: playerStateController.getVolumeData(), style: volumeTextStyle);
      TextPainter volumeTextPainter =
          TextPainter(text: volumeTextSpan, textDirection: TextDirection.ltr);
      volumeTextPainter.layout(minWidth: 0, maxWidth: size.width);
      Offset volumeTextOffset = Offset(volumeTextX, volumeTextY);
      volumeTextPainter.paint(canvas, volumeTextOffset);
    }
  }
}
