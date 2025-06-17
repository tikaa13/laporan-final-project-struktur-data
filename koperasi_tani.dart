import 'pupuk.dart';
import 'obat_tanaman.dart';
import 'riwayat.dart';
import 'stack.dart';

//membuat class koperasi tani
class KoperasiTani {
  List<Pupuk> listPupuk = [];
  List<ObatTanaman> listObat = [];
  Stack<Riwayat> listPemasukan = Stack<Riwayat>();
  Stack<Riwayat> listPengeluaran = Stack<Riwayat>();

//menambahkan method untuk menambah pupuk
  void tambahPupuk(int id, String nama, int stock) {
    Pupuk newPupuk = Pupuk(id, nama, stock);
    listPupuk.add(newPupuk);
    print("Pupuk $nama berhasil ditambahkan.");
  }

//menambahkan method untuk mengambil semua pupuk
  void ambilSemuaPupuk() {
    if (listPupuk.isEmpty) {
      print("tidak ada pupuk tersedia");
      return;
    }
    for (Pupuk pupuk in listPupuk) {
      print("--------------------");
      pupuk.ambilDetail();
    }
  }

//menambahkan method untuk mengedit pupuk
  void editPupuk(int id, String newNama, int newStock) {
    for (Pupuk pupuk in listPupuk) {
      if (pupuk.idPupuk == id) {
        pupuk.editNama(newNama);
        pupuk.editStock(newStock);
        print("Pupuk dengan ID $id berhasil diedit.");
        return;
      }
    }
    print("Pupuk dengan ID $id tidak ditemukan.");
  }

//menambahkan method untuk menghapus pupuk
  void hapusPupuk(int id) {
    listPupuk.removeWhere((pupuk) => pupuk.idPupuk == id);
    print("Pupuk dengan ID $id berhasil dihapus.");
  }

//menambahkan method untuk mencari pupuk
  void cariPupuk(String nama) {
    List<Pupuk> hasilPencarian = listPupuk.where((pupuk) => pupuk.namaPupuk.toLowerCase().contains(nama.toLowerCase())).toList();
    if (hasilPencarian.isNotEmpty) {
      for (Pupuk pupuk in hasilPencarian) {
        print("--------------------");
        pupuk.ambilDetail();
      }
    } else {
      print("pupuk tidak ditemukan");
    }
  }

//menambahkan method untuk menambah obat tanaman
  void tambahObat(int id, String nama, int stock) {
    ObatTanaman newObat = ObatTanaman(id, nama, stock);
    listObat.add(newObat);
    print("Obat $nama berhasil ditambahkan.");
  }

//menambahkan method untuk mengambil semua obat tanaman
  void ambilSemuaObat() {
    if (listObat.isEmpty) {
      print("tidak ada obat tersedia");
      return;
    }
    for (ObatTanaman obat in listObat) {
      print("--------------------");
      obat.ambilDetail();
    }
  }

//menambahkan method untuk mengedit obat tanaman
  void editObat(int id, String newNama, int newStock) {
    for (ObatTanaman obat in listObat) {
      if (obat.idObat == id) {
        obat.editNama(newNama);
        obat.editStock(newStock);
        print("Obat dengan ID $id berhasil diedit.");
        return;
      }
    }
    print("Obat dengan ID $id tidak ditemukan.");
  }

//menambahkan method untuk menghapus obat tanaman
  void hapusObat(int id) {
    listObat.removeWhere((obat) => obat.idObat == id);
    print("Obat dengan ID $id berhasil dihapus.");
  }

  //menambahkan method untuk mencari obat tanaman
  void cariObat(String nama) {
    List<ObatTanaman> hasilPencarian = listObat.where((obat) => obat.namaObat.toLowerCase().contains(nama.toLowerCase())).toList();
    if (hasilPencarian.isNotEmpty) {
      for (ObatTanaman obat in hasilPencarian) {
        print("--------------------");
        obat.ambilDetail();
      }
    } else {
      print("Obat tidak ditemukan.");
    }
  }

//menambahkan method untuk menambah riwayat pemasukan
  void tambahRiwayatPemasukan(Produk produk, int jumlah) {
    produk.tambahStock(jumlah);
    Riwayat riwayat = Riwayat(produk, JenisTransaksi.pemasukan, jumlah, DateTime.now());
    listPemasukan.tambahData(riwayat);
    print("Riwayat pemasukan berhasil ditambahkan.");
  }

//menambahkan method untuk menambah riwayat pengeluaran
  void tambahRiwayatPengeluaran(Produk produk, int jumlah) {
    produk.kurangStock(jumlah);
    Riwayat riwayat = Riwayat(produk, JenisTransaksi.pengeluaran, jumlah, DateTime.now());
    listPengeluaran.tambahData(riwayat);
    print("Riwayat pengeluaran berhasil ditambahkan.");
  }

//menambahkan method untuk melihat riwayat pemasukan
  void lihatRiwayatPemasukan() {
    print("Riwayat Pemasukan:");
    listPemasukan.ambilSemua();
  }

//menambahkan method untuk melihat riwayat pengeluaran
  void lihatRiwayatPengeluaran() {
    print("Riwayat Pengeluaran:");
    listPengeluaran.ambilSemua();
  }
}
