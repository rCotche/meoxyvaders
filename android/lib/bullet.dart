import 'dart:ui';

import 'package:audioplayers/audio_cache.dart';
import 'package:flame/components/component.dart';
import 'enemy.dart';
import 'explosion.dart';
import 'main.dart';
import 'galaxy.dart';

const SPEED = 120.0;

class Bullet extends SpriteComponent {
  bool explode = false;
  double maxY;
  var game;
  List<Enemy> enemyList = <Enemy>[];
  List<Bullet> bulletList = <Bullet>[];

  Bullet(this.enemyList, this.bulletList, this.game)
      : super.square(BULLET_SIZE, 'bullet.png');

  @override
  void update(double t) {
    y -= gameOver ? 0 : t * SPEED;

    if (enemyList.isNotEmpty)
      enemyList.forEach((item) {
        bool remove = this.toRect().contains(item.toRect().bottomCenter) ||
            this.toRect().contains(item.toRect().bottomLeft) ||
            this.toRect().contains(item.toRect().bottomRight);
        if (remove) {
          points += 1;
          item.explode = true;
          bullet.explode = true;
          enemyList.remove(item);
          AudioCache player = new AudioCache(prefix: 'audio/');
          player.play('explosion.mp3');
          game.add(new Explosion(item));
        }
      });
  }

  @override
  bool destroy() {
    if (explode) {
      return true;
    }
    if (y == null || maxY == null) {
      return false;
    }
    bool destroy = y >= maxY;

    return destroy;
  }

  @override
  void resize(Size size) {
    this.x = bulletPositionDx;
    this.y = bulletPositionDy;
    this.maxY = size.height;
  }
}
