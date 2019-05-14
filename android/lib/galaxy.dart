import 'package:flame/game.dart';
import 'package:flutter/material.dart';
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
}