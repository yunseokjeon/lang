import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lang/lang/states/player_state_controller.dart';

import '../lang_main.dart';

class LangPlayerOverlay extends StatefulWidget {

  const LangPlayerOverlay(this.game,{super.key});

  final Game game;

  @override
  State createState() {
    return _LangPlayerOverlayState();
  }
}

class _LangPlayerOverlayState extends State<LangPlayerOverlay> {

  // late PlayerSateController playerSateController;

  @override
  Widget build(BuildContext context) {
    LangMain game = widget.game as LangMain;
    Get.put(PlayerSateController());


    /*return Scaffold(
      body: Center(
        child: GetBuilder<PlayerSateController>(
          builder: (playerSateController){
            return Text(
              playerSateController.test,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w100
              ),
            );
          },
        ),
      ),
    );*/
  }
}