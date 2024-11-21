import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';

class Ship extends SpriteComponent with TapCallbacks {
  late Vector2 tujuan; // Untuk menyimpan koordinat ketika kita mengklik/tap bagian dari layar, yang akan menjadi tujuan akhir dari ship
  late Vector2 arah;
  double speed = 3.0;

  @override
  Ship() {
    arah = Vector2(0, 0); // Memberikan nilai awal arah, jika tidak diberi maka akan muncul error
    tujuan = position;
  }

  void setTujuan(DragUpdateInfo info) {
    tujuan = info.eventPosition.global; // Proses penyimpanan koordinat
    lookAt(tujuan); // Pastikan metode ini sudah terdefinisi atau diimpor jika berasal dari pustaka
    angle += pi;
    arah = tujuan - position;
    arah = arah.normalized(); // Membuat pergerakannya per satuan
  }

 @override
Future<void> onLoad() async {
  // Memuat gambar sprite yang benar
  sprite = Sprite(await Flame.images.load("ships/spaceShip_001.png"));
  
  // Mengatur posisi, sudut, dan titik jangkar
  position = Vector2(100, 100);
  angle = -pi / 2; // Mengatur sudut ke atas
  anchor = Anchor.center; // Mengatur titik jangkar di tengah
}


  @override
  void update(double dt) {
    if ((tujuan - position).length < speed) { // Menggunakan 'length' yang benar
      position = tujuan;
      arah = Vector2(0, 0);
    }
    position.add(arah * speed);
    super.update(dt);
  }
}
