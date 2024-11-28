import 'dart:async';
import 'dart:ui';

import 'package:dasar3_flame/component/asteroid_spawner.dart';
import 'package:dasar3_flame/component/bgParallaxComponent.dart';
import 'package:dasar3_flame/component/ship.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

class MyFlameGame extends FlameGame with PanDetector {
  late Ship s;
  late Bgparallaxcomponent bgParallax;
  late AsteroidSpawner asp;

  @override
  Future<void> onLoad() async {
    bgParallax = Bgparallaxcomponent();
    add(bgParallax);

    s = Ship();
    add(s);

    asp = AsteroidSpawner();
    add(asp);
  }

  @override
  Color backgroundColor() {
    return const Color(0xFF000045);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    s.setTujuan(info);
  }
}
