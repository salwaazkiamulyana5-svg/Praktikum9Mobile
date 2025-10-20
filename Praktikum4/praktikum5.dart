import 'dart:io';

class Pohon {
  int tinggi;
  Pohon(this.tinggi);
}

class TebasTebang {
  List<Pohon> daftarPohon = [];

  void tambahPohon(List<int> tinggiPohon) {
    for (var t in tinggiPohon) {
      daftarPohon.add(Pohon(t));
    }
  }

  int hitungKayu(int batas) {
    int total = 0;
    for (var pohon in daftarPohon) {
      if (pohon.tinggi > batas) {
        total += (pohon.tinggi - batas);
      }
    }
    return total;
  }

  int cariBatasTebang(int kebutuhanKayu) {
    int left = 0;
    int right = daftarPohon.map((p) => p.tinggi).reduce((a, b) => a > b ? a : b);
    int hasil = -1;

    while (left <= right) {
      int mid = (left + right) ~/ 2;
      int totalKayu = hitungKayu(mid);

      if (totalKayu >= kebutuhanKayu) {
        hasil = mid;
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }

    return hasil;
  }
}

void main() {
  var input = stdin.readLineSync()!.split(' ');
  int n = int.parse(input[0]);
  int m = int.parse(input[1]);
  var tinggi = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  var proses = TebasTebang();
  proses.tambahPohon(tinggi);
  print(proses.cariBatasTebang(m));
}
