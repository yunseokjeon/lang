import '../states/player_state_controller.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class PacmanPainter extends CustomPainter {
  final PlayerSateController playerSateController;
  final Animation listenable;

  PacmanPainter({required this.playerSateController, required this.listenable});

  @override
  void paint(Canvas canvas, Size size) {
    var pacmanPaint = Paint()..color = Colors.yellow;
    double sweepAngle = (360.0 - listenable.value) * pi / 180; // 입 벌리는 정도
    double startAngle = (listenable.value / 2) * pi / 180; // 회전;

    var pacmanPath = Path()
      ..moveTo(
          size.width / 2, size.height / 2) // 중심각의 위치, 주어진 영역의 절반 위치를 중심각으로 지정
      ..arcTo(
          Rect.fromCircle(
            radius: size.height / 2, //반지름, 객체의 크기를 결정한다.
            center: Offset(size.width / 2, size.height / 2), // 객체 자체의 위치
          ),
          startAngle,
          sweepAngle,
          false)
      ..close();

    canvas.drawPath(pacmanPath, pacmanPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
