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

    double yr = playerStateController.volumeYRatio;

    if (category == VerticalCatogory.volume) {
      Paint volumePaint = Paint()
        ..style = PaintingStyle.fill
        ..color = Color(0xff466593).withOpacity(1.0);

      canvas.drawRect(
          Offset(0, 0 + (1 - yr) * size.height) &
              Size(size.width, size.height * yr),
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
      clipPath2.quadraticBezierTo(0, 0,
          size.width * 0.2, 0);
      clipPath2.lineTo(size.width * 0.8, 0);
      clipPath2.quadraticBezierTo(size.width, 0,
          size.width, size.height * 0.2);
      clipPath2.lineTo(size.width, size.height * 0.8);
      clipPath2.quadraticBezierTo(size.width, size.height,
          size.width * 0.8, size.height);
      clipPath2.lineTo(size.width * 0.2, size.height);
      clipPath2.quadraticBezierTo(0, size.height,
          0, size.height * 0.8);
      clipPath2.lineTo(0, size.height * 0.2);
      clipPath2.close();

      Paint clipPaint = Paint()
        ..style = PaintingStyle.fill
        ..color = Color(0xff3D3D3D).withOpacity(1.0);

      // 가운데 부분을 뚫어준다.
      clipPath1.fillType = PathFillType.evenOdd;
      clipPath1.addPath(clipPath2, Offset(0, 0));

      canvas.drawPath(clipPath1, clipPaint);
    }
  }
}
