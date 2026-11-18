// misal kalau uang pembeli kurang,
// program akan menampilkan pesan bahwa uang tidak cukup.


void main() {
  double harga = 150000;
  double diskon = 10;
  double uangPembeli = 100000;

  // Menghitung diskon
  double potongan = harga * diskon / 100;

  // Menghitung total pembayaran
  double totalBayar = harga - potongan;

  print("Total bayar: Rp$totalBayar");

  // Mengecek apakah uang cukup
  if (uangPembeli >= totalBayar) {
    double kembalian = uangPembeli - totalBayar;

    print("Pembayaran berhasil");
    print("Kembalian: Rp$kembalian");
  } else {
    double kekurangan = totalBayar - uangPembeli;

    print("Uang tidak cukup");
    print("Kekurangan: Rp$kekurangan");
  }
}
