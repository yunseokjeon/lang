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
    final result = onPanDown(event.position);
    if (result == null) {
      startTrackingPointer(event.pointer);
      resolve(GestureDisposition.accepted);
    } else {
      stopTrackingPointer(event.pointer);
    }
  }

  @override
  void handleEvent(PointerEvent event) {
    if (event is PointerMoveEvent) {
      onPanUpdate(event.position);
    }
    if (event is PointerUpEvent) {
      onPanEnd(event.position);
      stopTrackingPointer(event.pointer);
    }
  }

  @override
  String get debugDescription => "plain gesture pan";

  @override
  void didStopTrackingLastPointer(int pointer) {}
}
