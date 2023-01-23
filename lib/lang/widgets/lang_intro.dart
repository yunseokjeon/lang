import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:lang/lang/lang_main.dart';

class LangIntroOverlay extends StatefulWidget {
  const LangIntroOverlay(this.game, {super.key});

  final Game game;

  @override
  State createState() {
    return _LangIntroOverlayState();
  }
}

class _LangIntroOverlayState extends State<LangIntroOverlay> {
  @override
  Widget build(BuildContext context) {
    LangMain game = widget.game as LangMain;

    return LayoutBuilder(builder: (context, constraints) {
      final TextStyle titleStyle = (constraints.maxWidth > 1830)
          ? Theme.of(context).textTheme.displayLarge!
          : Theme.of(context).textTheme.displaySmall!;


      return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff435F8C), Color(0xff379CB0)])),
        child: const Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: EdgeInsets.all(24.0),
              child: Center(
                child: Text(
                  'L A N G',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w100
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )),
      );
    });
  }
}
