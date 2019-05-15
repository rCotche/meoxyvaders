import 'package:flame/components/component.dart';
import 'package:flutter/material.dart';

const SPEED = 120.0;
const ComponentSize = 40.0;
class Enemy extends SpriteComponent {
  Size dimensions;
  Enemy(this.dimensions) : super.square(ComponentSize, 'enemy.png');
  double maxY;
  bool remove = false;
  @override
  void update(double t) {
    this.y += t * SPEED;
  }
  @override
  bool destroy() {
    return remove;
  }
  @override
  void resize(Size size) {
    this.x = size.width / 2;
    this.y = 0;
    this.maxY = size.height;
  }
}