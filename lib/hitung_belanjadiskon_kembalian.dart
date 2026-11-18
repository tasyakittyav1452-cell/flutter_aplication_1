// - Harga barang: Rp200.000
// - Diskon: 20%
// - Uang pembeli: Rp200.000
// - Hitung total belanja dan uang kembalian.


void main() {
  // Data belanja
  double harga = 200000;
  double diskon = 20;
  double uangPembeli = 200000;

  // Menghitung jumlah diskon
  double potongan = harga * diskon / 100;

  // Menghitung harga setelah diskon
  double totalBayar = harga - potongan;

  // Menghitung uang kembalian
  double kembalian = uangPembeli - totalBayar;

  print("Harga barang: Rp$harga");
  print("Diskon: $diskon%");
  print("Potongan: Rp$potongan");
  print("Total bayar: Rp$totalBayar");
  print("Uang pembeli: Rp$uangPembeli");
  print("Kembalian: Rp$kembalian");
}
