import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'bullet.dart';
import 'main.dart';
import 'enemy.dart';
import 'player.dart';

Enemy enemy;
Player player;
double creationBulletTimer = 0.0;
class Galaxy extends BaseGame {
  Size dimensions;

  List<Enemy> enemyList = <Enemy>[];
  List<Bullet> bulletList = <Bullet>[];
  Galaxy(this.dimensions){
    player = new Player(dimensions);
    add(player);
  }

  Canvas myCanvas;

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    String text = points.toString();
    TextPainter p = Flame.util
        .text(text, color: Colors.white, fontSize: 48.0, fontFamily: 'Halo');
    String over = "Game over";
    TextPainter overGame = Flame.util
        .text(over, color: Colors.white, fontSize: 48.0, fontFamily: 'Halo');
    gameOver
        ? overGame.paint(canvas, Offset(size.width / 5, size.height / 2))
        : p.paint(canvas,
        new Offset(size.width - p.width - 10, size.height - p.height - 10));
  }


  double creationTimer = 0.0;

  @override
  void update(double t) {
    creationTimer += t;
    if (creationTimer >= 4) {
      creationTimer = 0.0;
      enemy = new Enemy(dimensions);
      enemyList.add(enemy);
      add(enemy);
    }
    shot(t);
    super.update(t);
  }

  void shot(double t){
    creationBulletTimer += t;
    if (creationBulletTimer >= 1) {
      creationBulletTimer = 0.0;
      bulletList.add(bullet);
      bullet = new Bullet(enemyList, bulletList);
      add(bullet);
    }
  }

  void gonDragStart(BuildContext context, DragStartDetails start) {
    print("Print start #1 "+start.globalPosition.toString());
    RenderBox getBox = context.findRenderObject();
    var local = getBox.globalToLocal(start.globalPosition);
    print("Print start #2 "+local.dx.toString() + "|" + local.dy.toString());
  }

  void gonDragUpdate(BuildContext context, DragUpdateDetails update) {
    //print("Print update #1 "+update.globalPosition.toString());
    RenderBox getBox = context.findRenderObject();
    var local = getBox.globalToLocal(update.globalPosition);
    //print("Print update #2 "+local.dx.toString() + "|" + local.dy.toString());

    player.move(update.globalPosition);

    bulletPositionDx = player.x +29;
    bulletPositionDy = player.y;
  }
}