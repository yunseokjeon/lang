import 'package:get/get.dart';

class PlayerSateController extends GetxController {
  String test = "Hello World";
  double playPointerXRatio = 0.3;

  double getPlayPointerXRatio() {
    return playPointerXRatio;
  }

  void setPlayPointerXRatio(double newValue) {
    if (0.0 <= newValue && newValue <= 1.0) {
      playPointerXRatio = newValue;
    }
  }
}
