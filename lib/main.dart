import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lang/lang/lang_main.dart';
import 'package:flame/game.dart';
import 'package:lang/lang/widgets/lang_intro.dart';
import 'package:get/get.dart';
import 'package:lang/lang/widgets/lang_player.dart';

void main() {
  runApp(const GetMaterialApp(home: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LANG',
      home: const MyHomePage(title: 'LANG'),
    );
  }
}

final Game game = LangMain();

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: LayoutBuilder(builder: (context, constraints){
          return Container(
            constraints: const BoxConstraints(
              maxWidth: 800,
              minWidth: 550
            ),
            child: GameWidget(
              game: game,
              overlayBuilderMap: <String, Widget Function(BuildContext, Game)>{
                'langIntroOverlay': (context, game) => LangIntroOverlay(game),
                'langPlayerOverlay': (context, game) => LangPlayerOverlay(game),
              }
            ),
          );
        }),
      ),
    );
  }
}