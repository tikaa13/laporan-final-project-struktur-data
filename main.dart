import 'dart:io';
import 'pupuk.dart';
import 'obat_tanaman.dart';
import 'koperasi_tani.dart';

void main() {
  KoperasiTani koperasi = KoperasiTani();
  while (true) {
    print("\n=== Sistem Pencatatan Pemasukan dan Pengeluaran Pupuk dan Obat Tanaman ===");
    print("1. Tambah Pupuk");
    print("2. Tampilkan Semua Pupuk");
    print("3. Edit Pupuk");
    print("4. Hapus Pupuk");
    print("5. Cari Pupuk");
    print("6. Tambah Obat Tanaman");
    print("7. Tampilkan Semua Obat Tanaman");
    print("8. Edit Obat Tanaman");
    print("9. Hapus Obat Tanaman");
    print("10. Cari Obat Tanaman");
    print("11. Tambah Pemasukan");
    print("12. Tambah Pengeluaran");
    print("13. Lihat Riwayat Pemasukan");
    print("14. Lihat Riwayat Pengeluaran");
    print("15. Keluar");
    stdout.write("Pilih opsi (1-15): ");
    String? input = stdin.readLineSync();

    if (input == '15') {
      print("Terima kasih telah menggunakan sistem koperasi tani ini<33");
      break;
    }

    try {
      switch (input) {
        case '1':
          print("Masukkan ID Pupuk: ");
          int id = int.parse(stdin.readLineSync()!);
          print("Masukkan Nama Pupuk: ");
          String nama = stdin.readLineSync()!;
          print("Masukkan Stock Pupuk: ");
          int stock = int.parse(stdin.readLineSync()!);
          koperasi.tambahPupuk(id, nama, stock);
          break;

        case '2':
          koperasi.ambilSemuaPupuk();
          break;

        case '3':
          print("Masukkan ID Pupuk yang akan diedit: ");
          int id = int.parse(stdin.readLineSync()!);
          print("Masukkan Nama Baru: ");
          String nama = stdin.readLineSync()!;
          print("Masukkan Stock Baru: ");
          int stock = int.parse(stdin.readLineSync()!);
          koperasi.editPupuk(id, nama, stock);
          break;

        case '4':
          print("Masukkan ID Pupuk yang akan dihapus: ");
          int id = int.parse(stdin.readLineSync()!);
          koperasi.hapusPupuk(id);
          break;

        case '5':
          print("Masukkan Nama Pupuk yang ingin dicari: ");
          String nama = stdin.readLineSync()!;
          koperasi.cariPupuk(nama);
          break;

        case '6':
          print("Masukkan ID Obat: ");
          int id = int.parse(stdin.readLineSync()!);
          print("Masukkan Nama Obat: ");
          String nama = stdin.readLineSync()!;
          print("Masukkan Stock Obat: ");
          int stock = int.parse(stdin.readLineSync()!);
          koperasi.tambahObat(id, nama, stock);
          break;

        case '7':
          koperasi.ambilSemuaObat();
          break;

        case '8':
          print("Masukkan ID Obat yang akan diedit: ");
          int id = int.parse(stdin.readLineSync()!);
          print("Masukkan Nama Baru: ");
          String nama = stdin.readLineSync()!;
          print("Masukkan Stock Baru: ");
          int stock = int.parse(stdin.readLineSync()!);
          koperasi.editObat(id, nama, stock);
          break;

        case '9':
          print("Masukkan ID Obat yang akan dihapus: ");
          int id = int.parse(stdin.readLineSync()!);
          koperasi.hapusObat(id);
          break;

        case '10':
          print("Masukkan Nama Obat Tanaman yang ingin dicari: ");
          String nama = stdin.readLineSync()!;
          koperasi.cariObat(nama);
          break;

        case '11':
          print("Pilih jenis produk (1: Pupuk, 2: Obat Tanaman): ");
          String jenis = stdin.readLineSync()!;
          print("Masukkan ID Produk: ");
          int id = int.parse(stdin.readLineSync()!);
          print("Masukkan Jumlah: ");
          int jumlah = int.parse(stdin.readLineSync()!);
          if (jumlah <= 0) {
            print("Jumlah harus lebih dari 0.");
            break;
          }
          if (jenis == '1') {
            Pupuk pupuk = koperasi.listPupuk.firstWhere((p) => p.idPupuk == id, orElse: () => throw Exception("Pupuk tidak ditemukan"));
            koperasi.tambahRiwayatPemasukan(pupuk, jumlah);
          } else if (jenis == '2') {
            ObatTanaman obat = koperasi.listObat.firstWhere((o) => o.idObat == id, orElse: () => throw Exception("Obat tidak ditemukan"));
            koperasi.tambahRiwayatPemasukan(obat, jumlah);
          } else {
            print("Jenis produk tidak valid.");
          }
          break;

        case '12':
          print("Pilih jenis produk (1: Pupuk, 2: Obat Tanaman): ");
          String jenis = stdin.readLineSync()!;
          print("Masukkan ID Produk: ");
          int id = int.parse(stdin.readLineSync()!);
          print("Masukkan Jumlah: ");
          int jumlah = int.parse(stdin.readLineSync()!);
          if (jumlah <= 0) {
            print("Jumlah harus lebih dari 0.");
            break;
          }
          if (jenis == '1') {
            Pupuk pupuk = koperasi.listPupuk.firstWhere((p) => p.idPupuk == id, orElse: () => throw Exception("Pupuk tidak ditemukan"));
            koperasi.tambahRiwayatPengeluaran(pupuk, jumlah);
          } else if (jenis == '2') {
            ObatTanaman obat = koperasi.listObat.firstWhere((o) => o.idObat == id, orElse: () => throw Exception("Obat tidak ditemukan"));
            koperasi.tambahRiwayatPengeluaran(obat, jumlah);
          } else {
            print("Jenis produk tidak valid.");
          }
          break;

        case '13':
          koperasi.lihatRiwayatPemasukan();
          break;

        case '14':
          koperasi.lihatRiwayatPengeluaran();
          break;

        default:
          print("Opsi tidak valid. Silakan pilih antara 1-17.");
      }
    } catch (e) {
      print("Error: ${e.toString()}");
    }
  }
}
