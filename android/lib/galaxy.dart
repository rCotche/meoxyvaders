import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'enemy.dart';
import 'player.dart';

Enemy enemy;
Player player;
class Galaxy extends BaseGame {
  Size dimensions;
  Galaxy(this.dimensions);

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    player = new Player(dimensions);
    add(player);
  }

  double creationTimer = 0.0;

  @override
  void update(double t) {
    creationTimer += t;
    if (creationTimer >= 4) {
      creationTimer = 0.0;
      enemy = new Enemy(dimensions);
      add(enemy);

    }

    super.update(t);
  }

  void gonDragStart(BuildContext context, DragStartDetails start) {
    print("Print start #1 "+start.globalPosition.toString());
    RenderBox getBox = context.findRenderObject();
    var local = getBox.globalToLocal(start.globalPosition);
    print("Print start #2 "+local.dx.toString() + "|" + local.dy.toString());
  }

  void gonDragUpdate(BuildContext context, DragUpdateDetails update) {
    print("Print update #1 "+update.globalPosition.toString());
    RenderBox getBox = context.findRenderObject();
    var local = getBox.globalToLocal(update.globalPosition);
    print("Print update #2 "+local.dx.toString() + "|" + local.dy.toString());

    player.move(update.globalPosition);
  }
}