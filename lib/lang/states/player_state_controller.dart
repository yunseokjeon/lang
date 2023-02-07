import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PlayerSateController extends GetxController {
  double playPointerXRatio = 0.3;

  double getPlayPointerXRatio() {
    return playPointerXRatio;
  }

  void setPlayPointerXRatio(double newValue) {
    if (0.0 <= newValue && newValue <= 1.0) {
      playPointerXRatio = newValue;
      update();
    }
  }

  double getPlayPointerX(
    double leftResidual,
    double plainPainterWidth,
  ) {
    return (playPointerXRatio * plainPainterWidth) + leftResidual;
  }

  bool isTouchPlayPointer(Offset point, double pointerX, double base) {
    return (point.dx - pointerX).abs() < base;
  }
}
