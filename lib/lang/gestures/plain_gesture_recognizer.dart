import 'package:flutter/gestures.dart';

class PlainGestureRecognizer extends OneSequenceGestureRecognizer {
  final Function onPanDown;
  final Function onPanUpdate;
  final Function onPanEnd;

  PlainGestureRecognizer(
      {required this.onPanDown,
      required this.onPanUpdate,
      required this.onPanEnd});

  @override
  void addPointer(PointerDownEvent event) {

  }

  @override
  void handleEvent(PointerEvent event) {

  }

  @override
  String get debugDescription {
    return "plain gesture pan";
  }

  @override
  void didStopTrackingLastPointer(int pointer) {

  }
}
