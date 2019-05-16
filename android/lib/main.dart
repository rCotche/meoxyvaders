import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flutter/gestures.dart';
import 'bullet.dart';
import 'enemy.dart';

import 'galaxy.dart';

void main() => runApp(MyApp());

bool gameOver = false;
const BULLET_SIZE = 20.0;

Bullet bullet;
Enemy enemy;

int points = 0;

double bulletPositionDx = 0.0;
double bulletPositionDy = 0.0;

class MyApp extends StatelessWidget {
  //BuildContext context;

  static Size dimensions;
  getDimension()async{
    dimensions = await Flame.util.initialDimensions();
  }
  Galaxy game = new Galaxy(dimensions);

  @override
  Widget build(BuildContext context) {

    Flame.util.addGestureRecognizer(new HorizontalDragGestureRecognizer()
      ..onUpdate = (DragUpdateDetails update) => game.gonDragUpdate(context, update));

    Flame.util.addGestureRecognizer(new HorizontalDragGestureRecognizer()
      ..onStart = (DragStartDetails start) => game.gonDragStart(context, start));

    return MaterialApp(
        title: 'Welcome to MeoxyVaders',
        debugShowCheckedModeBanner: false,
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
