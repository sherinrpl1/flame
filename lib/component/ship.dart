import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';

class Ship extends SpriteComponent {
  late Vector2 tujuan; // untuk menyimpan koordinat tujuan dari ship
  late Vector2 arah; 
  double speed = 3.0;

  Ship() {
    arah = Vector2(0, 0);
    tujuan = position; // Inisialisasi tujuan ke posisi awal
  }

  @override 
  FutureOr<void> onLoad() async {
    sprite = Sprite(await Flame.images.load("ships/spaceShips_001.png"));
    position = Vector2(100, 100);
    angle = -pi / 2; // Mengatur sudut awal ke arah atas
    anchor = Anchor.center; // Menetapkan anchor ke tengah
  }

  @override
  void onMount() {
    super.onMount();
    // Tidak perlu menginisialisasi arah dan tujuan di sini karena sudah diatur di constructor
  }

  @override
  void update(double dt) {
    // Memperbarui posisi ship berdasarkan arah dan kecepatan
    if ((tujuan - position).length > speed) {
      position += arah * speed; // Memindahkan ship sesuai arah dan kecepatan
    } else {
      position = tujuan; // Jika sudah dekat dengan tujuan, langsung atur ke tujuan
      arah = Vector2(0, 0); // Reset arah
    }
    super.update(dt);
  }

  void setTujuan(DragUpdateInfo info) {
    tujuan = info.eventPosition.global; // Menyimpan koordinat tujuan
    lookAt(tujuan); // Mengubah arah ship ke tujuan
    arah = tujuan - position; // Hitung arah ke tujuan
    arah = arah.normalized(); // Normalisasi arah untuk kecepatan yang konsisten
  }
}
