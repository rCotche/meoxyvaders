import 'dart:math';

import 'package:flame/components/component.dart';
import 'package:flutter/material.dart';

import 'main.dart';

const SPEED = 120.0;
const ENEMY_SIZE = 40.0;
class Enemy extends SpriteComponent {
  Size dimensions;
  bool explode = false;
  Enemy(this.dimensions) : super.square(ENEMY_SIZE, 'enemy.png');
  double maxY;
  @override
  void update(double t) {
    y += gameOver ? 0
        : t * SPEED;

  }
  @override
  bool destroy() {

    if (explode) {
      return true;
    }
    if (y == null || maxY == null) {
      return false;
    }
    bool destroy = y >= maxY + ENEMY_SIZE / 2;
    if (destroy) {
      gameOver = true;

      print("Game over");
      return true;
    }
    return destroy;
  }
  @override
  void resize(Size size) {
    this.y = 0;
    this.maxY = size.height;
    Random r = new Random();
    this.x = r.nextDouble()*(size.width*0.9);
  }

  void levelUP(){
    if(points >= 5){
      
    }
  }
}