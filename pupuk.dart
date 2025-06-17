import 'dart:io';

//membuat enum untuk jenis transaksi
enum JenisTransaksi {
  pemasukan,
  pengeluaran,
}

//membuat class abstrak produk
abstract class Produk {
  void ambilDetail();
  void tambahStock(int jumlah);
  void kurangStock(int jumlah);
  void editNama(String nama_baru);
  void editStock(int stock_baru);
}

//membuat class Pupuk
class Pupuk implements Produk {
  int _idPupuk;
  String _namaPupuk;
  int _stock;

  Pupuk(this._idPupuk, this._namaPupuk, this._stock);

  int get idPupuk => _idPupuk;
  String get namaPupuk => _namaPupuk;

//menambahkan method untuk menampilkan semua detail pupuk
  @override
  void ambilDetail() {
    print("ID: $_idPupuk");
    print("Nama: $_namaPupuk");
    print("Stock: $_stock");
  }

//menambahkan method untuk menambahkan stock Pupuk
  @override
  void tambahStock(int jumlah) {
    print("stock sebelum ditambahkan: $_stock");
    _stock += jumlah;
    print("stock sesudah ditambahkan: $_stock");
  }

//menambahkan method untuk mengurangi stock Pupuk
  @override
  void kurangStock(int jumlah) {
    if (_stock >= jumlah) {
      print("stock saat ini: $_stock");
      _stock -= jumlah;
      print("stock setelah diambil: $_stock");
    } else {
      print("stock tidak cukup");
    }
  }

  //menambahkan method untuk mengedit nama Pupuk
  @override
  void editNama(String nama_baru) {
    _namaPupuk = nama_baru;
  }

//menambahkan method untuk mengedit stock Pupuk
  @override
  void editStock(int stock_baru) {
    _stock = stock_baru;
  }
}
