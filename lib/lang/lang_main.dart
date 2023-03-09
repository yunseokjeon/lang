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
    overlays.add('langPlayerOverlay');
    overlays.add('langIntroOverlay');
    // langPlayerOverlay가 렌덩리 되는 시간 벌기
    Timer(Duration(seconds: 2), () {
      overlays.remove('langIntroOverlay');
    });
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}
