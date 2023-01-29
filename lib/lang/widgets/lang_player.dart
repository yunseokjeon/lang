import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lang/lang/gestures/plain_gesture_recognizer.dart';
import 'package:lang/lang/painter/pacman_painter.dart';
import 'package:lang/lang/painter/plain_painter.dart';
import 'package:lang/lang/states/player_state_controller.dart';

import '../lang_main.dart';

class LangPlayerOverlay extends StatefulWidget {
  const LangPlayerOverlay(this.game, {super.key});

  final Game game;

  @override
  State createState() {
    return _LangPlayerOverlayState();
  }
}

class _LangPlayerOverlayState extends State<LangPlayerOverlay>
    with TickerProviderStateMixin {
  double screenWidth = 0.0;
  double screenHeight = 0.0;
  late AnimationController _pacmanAnimationController;
  late Animation<double> _pacmanAnimation;
  final double pacmacSize = 100.0; // px
  late PlayerSateController playerSateController;

  @override
  void initState() {
    _pacmanAnimationController =
        AnimationStorage.getPacmanAnimationController(this);
    _pacmanAnimation =
        AnimationStorage.getPacmanAnimation(_pacmanAnimationController);
    _pacmanAnimationController.repeat(reverse: true);

    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      setState(() {
        screenWidth = MediaQuery.of(context).size.width;
        screenHeight = MediaQuery.of(context).size.height;
      });
    });
  }

  void _onPanDown(Offset details) {
    // Offset(142.0, 206.0)
    double ratio = details.dx / screenWidth;
    playerSateController.setPlayPointerXRatio(ratio);
  }

  void _onPanUpdate(Offset details) {}

  void _onPanEnd(Offset details) {}

  @override
  Widget build(BuildContext context) {
    LangMain game = widget.game as LangMain;
    this.playerSateController = Get.find<PlayerSateController>();

    return Scaffold(
      body: Container(
        width: screenWidth,
        margin: EdgeInsets.fromLTRB(
            screenWidth * 0.05, screenHeight * 0.05, screenWidth * 0.05, 0),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.add_box_outlined),
                  Icon(Icons.account_balance_wallet)
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text("파일명"), Text("재생시간")],
              ),
            ),
            Container(
              height: screenHeight * 0.05,
              margin: EdgeInsets.fromLTRB(screenWidth * 0.05,
                  screenHeight * 0.1, screenWidth * 0.05, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GetBuilder<PlayerSateController>(
                    builder: (playerSateController) {
                      return RawGestureDetector(
                          gestures: <Type, GestureRecognizerFactory>{
                            PlainGestureRecognizer:
                                GestureRecognizerFactoryWithHandlers<
                                    PlainGestureRecognizer>(
                              () => PlainGestureRecognizer(
                                onPanDown: _onPanDown,
                                onPanUpdate: _onPanUpdate,
                                onPanEnd: _onPanEnd,
                              ),
                              (PlainGestureRecognizer instance) {},
                            )
                          },
                          child: Stack(
                            clipBehavior: Clip.antiAlias,
                            children: <Widget>[
                              Positioned(
                                  child: CustomPaint(
                                painter: PlainPainter(
                                  playerStateController: playerSateController,
                                ),
                                size: Size(screenWidth * 0.75, screenHeight * 0.2),
                              )),
                              Positioned(
                                  top: 0,
                                  right: 0,
                                  child: CustomPaint(
                                    painter: PacmanPainter(
                                        playerSateController:
                                            playerSateController,
                                        listenable: _pacmanAnimation),
                                    size: Size(
                                        screenWidth * 0.1, screenWidth * 0.1),
                                  ))
                            ],
                          ));
                    },
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("버튼1"),
                  Text("버튼2"),
                  Text("버튼3"),
                  Text("버튼4"),
                  Text("버튼5")
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    flex: 1,
                    child: Text("볼륨"),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text("배속"),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text("5배속과 ALL"),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text("10배속"),
                  ),
                  Flexible(
                    flex: 1,
                    child: Text("무한대"),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("1"),
                  Text("2"),
                  Text("3"),
                  Text("4"),
                  Text("5")
                ],
              ),
            ),
            Container(
              child: Text("패드"),
            )
          ],
        ),
      ),
    );
  }
}

class AnimationStorage {
  static AnimationController getPacmanAnimationController(
      TickerProvider vsyncParam) {
    return AnimationController(
        vsync: vsyncParam, duration: const Duration(milliseconds: 300));
  }

  static Animation<double> getPacmanAnimation(AnimationController controller) {
    return Tween<double>(begin: 90, end: 0).animate(controller);
  }
}
