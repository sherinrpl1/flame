import 'dart:async'; // Mengimpor library untuk mendukung penggunaan Future dan async-await.

import 'package:dasar3_flame/component/ship.dart'; // Mengimpor kelas 'Ship' dari project lokal.
import 'package:flame/components.dart'; // Mengimpor komponen-komponen dasar dari Flame.
import 'package:flame/game.dart'; // Mengimpor API terkait game dari Flame.
import 'package:flame/parallax.dart'; // Mengimpor komponen untuk membuat efek parallax.
import 'package:flutter/painting.dart'; // Mengimpor ImageRepeat untuk opsi pengulangan gambar.

/// Kelas Bgparallaxcomponent adalah komponen parallax yang akan digunakan sebagai background game.
/// Background ini dapat bergerak dengan kecepatan berbeda mengikuti pergerakan pemain.
class Bgparallaxcomponent extends ParallaxComponent with HasGameRef {
  
  // List yang berisi gambar-gambar yang akan digunakan dalam parallax.
  final List<ParallaxImageData> _parallelImage = [
    ParallaxImageData("parallax/bkgd_0.png"), // Layer terjauh (belakang).
    ParallaxImageData("parallax/bkgd_1.png"),
    ParallaxImageData("parallax/bkgd_2.png"),
    ParallaxImageData("parallax/bkgd_3.png"),
    ParallaxImageData("parallax/bkgd_4.png"),
    ParallaxImageData("parallax/bkgd_5.png"),
    ParallaxImageData("parallax/bkgd_6.png"), // Layer paling depan.
  ];

  /// Fungsi yang dipanggil saat komponen ini dimuat ke dalam game.
  /// Memuat parallax dengan konfigurasi awal, seperti kecepatan dan opsi pengulangan.
  @override
  Future<void> onLoad() async {
    parallax = await gameRef.loadParallax(
      _parallelImage, // Gambar-gambar untuk parallax, dari paling jauh ke paling dekat.
      baseVelocity: Vector2(-10, 0), // Kecepatan dasar parallax bergerak ke kiri.
      velocityMultiplierDelta: Vector2(1, 1), // Faktor perubahan kecepatan tiap layer.
      repeat: ImageRepeat.repeat, // Membuat gambar diulang secara horizontal.
    );
  }

  /// Fungsi untuk mengubah kecepatan parallax berdasarkan arah gerakan pemain.
  /// Semakin cepat kapal bergerak, semakin cepat background mengikuti.
  void changeSpeedBasedShip(Ship player) {
    // Memastikan parallax tidak null sebelum mengubah kecepatannya.
    if (parallax != null) {
      // Mengatur kecepatan background mengikuti arah kapal pemain.
      parallax!.baseVelocity = player.arah * 10;
      // 'player.arah' adalah vektor arah dari kapal pemain yang dikalikan 10 untuk menambah efek.
    }
  }
}