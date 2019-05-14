import 'package:flutter/material.dart';
import 'package:flame/flame.dart';

import 'galaxy.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static Size dimensions;
  getDimension()async{
    dimensions = await Flame.util.initialDimensions();
  }

var game = new Galaxy(dimensions);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Welcome to MeoxyVaders',
        home: Scaffold(
            body: Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: GameWrapper(game),
        )));
  }
}

class GameWrapper extends StatelessWidget {
  final Galaxy game;

  GameWrapper(this.game);

  @override
  Widget build(BuildContext context) {
    return game.widget;
  }
}
