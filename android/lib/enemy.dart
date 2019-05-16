import 'dart:math';
import 'dart:ui';
import 'package:flame/components/component.dart';
import 'package:flutter/material.dart';

import 'main.dart';


const ENEMY_SIZE = 40.0;
class Enemy extends SpriteComponent {
  double SPEED;
  Size dimensions;
  bool explode = false;
  Enemy(this.dimensions) : super.square(ENEMY_SIZE, 'enemy.png');
  double maxY;
  @override
  void update(double t) {
    this.levelUP();
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
    if(points == 0){
      SPEED = 120.0;
    }else{
      SPEED = 120.0 * (1+0.5*(points~/5));
    }
    if(points%5 == 0 && points != 0){
      SPEED = SPEED * 1.05;
      print(points%5);
    }
  }
}