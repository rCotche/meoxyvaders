import 'package:flame/components/animation_component.dart';
import 'enemy.dart';

class Explosion extends AnimationComponent {
  static const TIME = 0.75;

  Explosion(Enemy enemy)
      : super.sequenced(ENEMY_SIZE, ENEMY_SIZE, 'explosion-4.png', 7,
            textureWidth: 31.0, textureHeight: 31.0) {
    this.x = enemy.x;
    this.y = enemy.y;
    this.animation.stepTime = TIME / 7;
  }

  bool destroy() {
    return this.animation.isLastFrame;
  }
}
