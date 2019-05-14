import 'package:flame/flame.dart';
import 'package:flame/components/component.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'enemy.dart';

Enemy component;
class Galaxy extends BaseGame {
  Size dimensions;
  Galaxy(this.dimensions);

  @override
  void render(Canvas canvas) {

  }

  double creationTimer = 0.0;

  @override
  void update(double t) {
    creationTimer += t;
    if (creationTimer >= 4) {
      creationTimer = 0.0;
      component = new Enemy(dimensions);
      add(component);
    }
    super.update(t);
  }
}