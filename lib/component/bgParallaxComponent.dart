import 'package:dasar3_flame/component/ship.dart';
import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flame/game.dart';
import 'package:flutter/painting.dart';

class BgParallaxComponent extends ParallaxComponent with HasGameRef<FlameGame> {
  final _parallaxImages = [
    ParallaxImageData("parallax/bkgd_0.png"),
    ParallaxImageData("parallax/bkgd_1.png"),
    ParallaxImageData("parallax/bkgd_2.png"),
    ParallaxImageData("parallax/bkgd_3.png"),
    ParallaxImageData("parallax/bkgd_4.png"),
    ParallaxImageData("parallax/bkgd_5.png"),
    ParallaxImageData("parallax/bkgd_6.png"),
  ];

  @override
  Future<void> onLoad() async {
    parallax = await gameRef.loadParallax(
      _parallaxImages,
      baseVelocity: Vector2(0, -10),
      velocityMultiplierDelta: Vector2(1, 1),
      repeat: ImageRepeat.repeat,
    );
  }

  void changeSpeedBasedOnShip(Ship player) {
    if (parallax != null) {
      parallax!.baseVelocity = player.arah * 10;
    }
  }
}
