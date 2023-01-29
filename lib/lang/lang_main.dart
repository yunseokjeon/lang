import 'dart:async';

import 'package:flame/game.dart';
import 'package:get/get.dart';
import 'package:lang/lang/states/player_state_controller.dart';

class LangMain extends FlameGame {
  LangMain({super.children});

  PlayerSateController playerStateController = Get.put(PlayerSateController());

  @override
  Future<void> onLoad() async {
    playerStateController.setPlayPointerXRatio(0.0);
    overlays.add('langIntroOverlay');
    Timer(Duration(seconds: 2), () {
      overlays.remove('langIntroOverlay');
      overlays.add('langPlayerOverlay');
    });
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}
