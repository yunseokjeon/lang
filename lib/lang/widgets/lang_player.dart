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

    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.05, 0, 0),
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
                children: [
                  Text("파일명"),
                  Text("재생시간")
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("재생바")
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