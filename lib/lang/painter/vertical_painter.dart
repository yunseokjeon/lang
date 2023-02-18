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

    canvas.drawRRect(
        RRect.fromRectAndCorners(
            Rect.fromLTWH(size.width * 0.05797101, 0, size.width * 0.8840580,
                size.height),
            bottomRight: Radius.circular(size.width * 0.1449275),
            bottomLeft: Radius.circular(size.width * 0.1449275),
            topLeft: Radius.circular(size.width * 0.1449275),
            topRight: Radius.circular(size.width * 0.1449275)),
        paint_0_fill);

    if (category == VerticalCatogory.volume) {
      double yr = playerStateController.volumeYRatio;

      Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
      paint_1_fill.color = Color(0xff466593).withOpacity(1.0);

      canvas.drawRRect(
          RRect.fromRectAndCorners(
              Rect.fromLTWH(size.width * 0.05797101, (1 - yr) * size.height,
                  size.width * 0.8840580, size.height * yr),
              bottomRight: Radius.circular(size.width * 0.1449275),
              bottomLeft: Radius.circular(size.width * 0.1449275),
              topLeft: Radius.circular(size.width * 0.1449275),
              topRight: Radius.circular(size.width * 0.1449275)),
          paint_1_fill);
    }
  }
}
