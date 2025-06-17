import 'riwayat.dart';

// membuat class stack
class Stack<T> {
  final List<T> _data = [];

  //menambahkan method untuk menambahkan data ke dalam stack
  void tambahData(T nilai) {
    _data.add(nilai);
  }

//menambahkan method untuk mengambil dan menghapus data teratas
  T hapusData() {
    if (apakahKosong) {
      print('stack kosong');
    }
    return _data.removeLast();
  }

//menambahkan method untuk melihat data teratas tanpa menghapus
  T lihatTeratas() {
    if (apakahKosong) {
      print('stack kosong');
    }
    return _data.last;
  }

  bool get apakahKosong => _data.isEmpty;
  int get jumlah => _data.length;
  bool cari(T nilai) {
    return _data.contains(nilai);
  }

//menambahkan method untuk menampilkan semua item dari atas ke bawah
  void ambilSemua() {
    print('isi stack dari atas ke bawah:');
    if (apakahKosong) {
      print('stack kosong.');
      return;
    }
    for (var i = _data.length - 1; i >= 0; i--) {
      if (_data[i] is Riwayat) {
        (_data[i] as Riwayat).ambilDetail();
        print('---');
      } else {
        print('- ${_data[i]}');
      }
    }
  }

//menambahkan method untuk menampilkan representasi string dari tumpukan
  @override
  String toString() => _data.toString();
}
