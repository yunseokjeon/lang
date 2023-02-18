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
  double plainPainterWidth = 0.0;
  double plainPainterHeight = 0.0;
  bool isPlayPointerDragging = false;
  bool isPointerADragging = false;
  bool isPointerBDragging = false;

  late PlayerSateController playerSateController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      setState(() {
        screenWidth = MediaQuery.of(context).size.width;
        screenHeight = MediaQuery.of(context).size.height;
        plainPainterWidth = screenWidth * 0.75;
        plainPainterHeight = screenHeight * 0.2;

        playerSateController.setPlayPointerYStart(plainPainterHeight * 0.15);
        playerSateController.setPlayPointerYEnd(plainPainterHeight * 0.5);

        double playPointerYMiddlePoint =
            plainPainterHeight * playerSateController.crossbeamYRatio;

        playerSateController
            .setPlayPointerYMiddlePoint(playPointerYMiddlePoint);

        playerSateController.setPointerAYMiddlePoint(
            plainPainterHeight * playerSateController.pointerAYRatio);

        playerSateController.setPointerBYMiddlePoint(
            plainPainterHeight * playerSateController.pointerBYRatio);
      });
    });
  }

  void _onPanDown(Offset details) {
    double leftResidual = (screenWidth - plainPainterWidth) / 2;
    double playPointerX =
        playerSateController.getPlayPointerX(leftResidual, plainPainterWidth);
    double pointerAX =
        playerSateController.getPointerAX(leftResidual, plainPainterWidth);
    double pointerBX =
        playerSateController.getPointerBX(leftResidual, plainPainterWidth);

    final box = context.findRenderObject()! as RenderBox;
    final localOffset = box.globalToLocal(details);
    double ratio = (details.dx - leftResidual) / plainPainterWidth;

    if (!playerSateController.isTouchPointerA(
            localOffset, pointerAX, plainPainterHeight, 80) &&
        !playerSateController.isTouchPointerB(
            localOffset, pointerBX, plainPainterHeight, 80)) {
      playerSateController.setPlayPointerXRatio(ratio);
    }

    if (playerSateController.isTouchPlayPointer(
        localOffset, playPointerX, plainPainterHeight, 100)) {
      isPlayPointerDragging = true;
    } else if (playerSateController.isTouchPointerA(
        localOffset, pointerAX, plainPainterHeight, 100)) {
      isPointerADragging = true;
    } else if (playerSateController.isTouchPointerB(
        localOffset, pointerBX, plainPainterHeight, 100)) {
      isPointerBDragging = true;
    }
  }

  void _onPanUpdate(Offset details) {
    double leftResidual = (screenWidth - plainPainterWidth) / 2;
    double ratio = (details.dx - leftResidual) / plainPainterWidth;

    if (isPlayPointerDragging) {
      playerSateController.setPlayPointerXRatio(ratio);
    } else if (isPointerADragging) {
      playerSateController.setPointerAXRatio(ratio);
    } else if (isPointerBDragging) {
      playerSateController.setPointerBXRatio(ratio);
    }
  }

  void _onPanEnd(Offset details) {
    if (isPlayPointerDragging) {
      isPlayPointerDragging = false;
    } else if (isPointerADragging) {
      isPointerADragging = false;
    } else if (isPointerBDragging) {
      isPointerBDragging = false;
    }
  }

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
                            clipBehavior: Clip.none,
                            children: <Widget>[
                              Positioned(
                                  child: CustomPaint(
                                painter: PlainPainter(
                                  playerStateController: playerSateController,
                                ),
                                size:
                                    Size(plainPainterWidth, plainPainterHeight),
                              )),
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
