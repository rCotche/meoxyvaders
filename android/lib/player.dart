import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flutter/material.dart';

const SPEED = 120.0;
const ComponentSize = 80.0;
class Player extends SpriteComponent {
  Size dimensions;
  Player(this.dimensions) : super.square(ComponentSize, 'player.png');
  double maxY, maxX;
  bool remove = false;

  @override
  void update(double t) {
    //this.x = t*SPEED;
  }

  @override
  bool destroy() {
    return remove;
  }

  void move(Offset position){
    if(this.x + (position.dx-this.x) <maxX){
      this.x += position.dx-this.x;
    }
  }

  @override
  void resize(Size size) {
    this.x = size.width / 2;
    this.y = size.height - 100;
    this.maxY = size.height;
    this.maxX = size.width * 0.9;
  }

}