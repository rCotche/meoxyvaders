import 'package:flutter/material.dart';
import 'package:flame/flame.dart';

main() async {
  Flame.audio.disableLog();
  Flame.images.loadAll(['fire.png', 'dragon.png', 'gun.png', 'bullet.png']);

  var dimensions = await Flame.util.initialDimensions();

  //game = new Galaxy(dimensions);

  runApp(MaterialApp(
      home: Scaffold(
          body: Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/images/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            //child: GameWrapper(game),
          ))));
}