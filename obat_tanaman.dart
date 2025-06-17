import 'pupuk.dart';

//membuat class Obat Tanaman
class ObatTanaman implements Produk {
  int _idObat;
  String _namaObat;
  int _stock;

  ObatTanaman(this._idObat, this._namaObat, this._stock);

  int get idObat => _idObat;
  String get namaObat => _namaObat;

  //menambahkan method untuk menampilkan semua detail Obat Tanaman
  @override
  void ambilDetail() {
    print("ID: $_idObat");
    print("Nama: $_namaObat");
    print("Stock: $_stock");
  }

  //menambahkan method untuk menambahkan stock Obat Tanaman
  @override
  void tambahStock(int jumlah) {
    print("stock sebelum ditambahkan: $_stock");
    _stock += jumlah;
    print("stock sesudah ditambahkan: $_stock");
  }

//menambahkan method untuk mengurangi stock Obat Tanaman
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

//menambahkan method untuk mengedit nama Obat Tanaman
  @override
  void editNama(String nama_baru) {
    _namaObat = nama_baru;
  }

//menambahkan method untuk mengedit stock Obat Tanaman
  @override
  void editStock(int stock_baru) {
    _stock = stock_baru;
  }
}
