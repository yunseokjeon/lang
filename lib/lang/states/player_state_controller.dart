import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PlayerSateController extends GetxController {
  double playPointerXRatio = 0.3;
  double crossbeamYRatio = 0.8;
  double playPointerYMiddlePoint = 0.0;
  double playPointerYStartRatio = 0.0;
  double playPointerYEndRatio = 0.0;

  double pointerAXRatio = 0.0;
  double pointerAYRatio = 0.8;
  double pointerAYMiddlePoint = 0.0;

  double pointerBXRatio = 1.0;
  double pointerBYRatio = 0.8;
  double pointerBYMiddlePoint = 0.0;

  double volumeYRatio = 1.0;

  void setPlayPointerYStart(double start) {
    playPointerYStartRatio = start;
    update();
  }

  void setPlayPointerYEnd(double end) {
    playPointerYEndRatio = end;
    update();
  }

  double getPlayPointerYStart() {
    return playPointerYStartRatio;
  }

  double getPlayPointerYEnd() {
    return playPointerYEndRatio;
  }

  double getPlayPointerXRatio() {
    return playPointerXRatio;
  }

  double getPointerAXRatio() {
    return pointerAXRatio;
  }

  void setPlayPointerXRatio(double newValue) {
    if (0.0 <= newValue && newValue <= 1.0) {
      playPointerXRatio = newValue;
      update();
    }
  }

  void setPointerAXRatio(double newValue) {
    if (0.0 <= newValue && newValue <= 1.0) {
      pointerAXRatio = newValue;
      update();
    }
  }

  void setPointerBXRatio(double newValue) {
    if (0.0 <= newValue && newValue <= 1.0) {
      pointerBXRatio = newValue;
      update();
    }
  }

  setPlayPointerYMiddlePoint(double newValue) {
    playPointerYMiddlePoint = newValue;
    update();
  }

  void setPointerAYMiddlePoint(double newValue) {
    pointerAYMiddlePoint = newValue;
    update();
  }

  void setPointerBYMiddlePoint(double newValue) {
    pointerBYMiddlePoint = newValue;
    update();
  }

  void setVolumeYRatio(double newValue) {
    if (0.0 <= newValue && newValue <= 1.0) {
      volumeYRatio = newValue;
      update();
    }
  }

  double getPlayPointerX(double leftResidual, double plainPainterWidth) {
    return (playPointerXRatio * plainPainterWidth) + leftResidual;
  }

  double getPointerAX(double leftResidual, double plainPainterWidth) {
    return (pointerAXRatio * plainPainterWidth) + leftResidual;
  }

  double getPointerBX(double leftResidual, double plainPainterWidth) {
    return (pointerBXRatio * plainPainterWidth) + leftResidual;
  }

  bool isTouchPlayPointer(
      Offset point, double pointerX, double painterHeight, double base) {
    return (point.dx - pointerX).abs() < base &&
        (point.dy - playPointerYMiddlePoint).abs() < base;
  }

  bool isTouchPointerA(
      Offset point, double pointerX, double painterHeight, double base) {
    return (point.dx - pointerX).abs() < base &&
        (point.dy - pointerAYMiddlePoint).abs() < base;
  }

  bool isTouchPointerB(
      Offset point, double pointerX, double painterHeight, double base) {
    return (point.dx - pointerX).abs() < base &&
        (point.dy - pointerBYMiddlePoint).abs() < base;
  }

  bool isTouchVolume(
      Offset point, double volumePointerY, Offset volumePosition) {
    return point.dy > (volumePosition.dy + volumePointerY);
  }

  String getVolumeData(){
    return ((volumeYRatio*100).toInt()).toString();
  }
}

