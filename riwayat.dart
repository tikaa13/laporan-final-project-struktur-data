import 'pupuk.dart';

//membuat class riwayat
class Riwayat {
  Produk produk;
  JenisTransaksi jenis_transaksi;
  int jumlah;
  DateTime tanggal;

  Riwayat(this.produk, this.jenis_transaksi, this.jumlah, this.tanggal);

//menambahkan method untuk menampilkan detail riwayat nya
  void ambilDetail() {
    this.produk.ambilDetail();
    if (jenis_transaksi == JenisTransaksi.pemasukan) {
      print("jenis : pemasukan");
    } else {
      print("jenis : pengeluaran");
    }
    print("jumlah : $jumlah");
    print("Tanggal : ${tanggal.toString()}");
  }
}
