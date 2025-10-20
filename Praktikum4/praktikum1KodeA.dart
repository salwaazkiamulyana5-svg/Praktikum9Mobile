// Class induk
class Kendaraan {
  void jalan() {
    print("Kendaraan sedang berjalan");
  }
}

// Class turunan pertama
class Mobil extends Kendaraan {
  void klakson() {
    print("Mobil membunyikan klakson: Tin tin!");
  }
}

// Tambahan class turunan kedua (sesuai nomor 1c)
class Pesawat extends Kendaraan {
  // Override method jalan agar lebih spesifik
  @override
  void jalan() {
    print("Pesawat bergerak di landasan");
  }

  // Method baru khusus Pesawat
  void terbang() {
    print("Pesawat terbang tinggi di langit");
  }
}

// Fungsi utama program
void main() {
  // Objek dari class Kendaraan
  var k = Kendaraan();
  k.jalan();

  // Objek dari class Mobil
  var m = Mobil();
  m.jalan();
  m.klakson();

  // Objek dari class Pesawat (tambahan)
  var p = Pesawat();
  p.jalan();
  p.terbang();
}
