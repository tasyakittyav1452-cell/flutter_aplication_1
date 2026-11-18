
void main() {
  double harga = 300000;
  double diskon = 20;
  double pajak = 10;
  double uangPembeli = 300000;

  // Menghitung potongan diskon
  double potongan = harga * diskon / 100;

  // Harga setelah diskon
  double hargaDiskon = harga - potongan;

  // Menghitung pajak
  double jumlahPajak = hargaDiskon * pajak / 100;

  // Total pembayaran
  double totalBayar = hargaDiskon + jumlahPajak;

  print("Harga awal: Rp$harga");
  print("Potongan diskon: Rp$potongan");
  print("Pajak: Rp$jumlahPajak");
  print("Total bayar: Rp$totalBayar");

  // Mengecek uang pembeli
  if (uangPembeli >= totalBayar) {
    double kembalian = uangPembeli - totalBayar;
    print("Kembalian: Rp$kembalian");
  } else {
    double kurang = totalBayar - uangPembeli;
    print("Uang kurang: Rp$kurang");
  }
}
