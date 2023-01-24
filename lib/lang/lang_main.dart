import 'package:flame/game.dart';

class LangMain extends FlameGame {
  LangMain({super.children});

  @override
  Future<void> onLoad() async {
    // overlays.add('langIntroOverlay');
    // overlays.remove('langIntroOverlay');
    overlays.add('langPlayerOverlay');
  }

  @override
  void update(double dt) {
    super.update(dt);

  }
}
