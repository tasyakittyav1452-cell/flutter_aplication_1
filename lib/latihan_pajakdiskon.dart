// soal
// Sebuah produk memiliki harga Rp300.000.
// Produk mendapatkan diskon 20%,
// kemudian dikenakan pajak 10% dari harga setelah diskon.
// Berapa total pembayaran?

void main() {
  double harga = 300000;
  double diskon = 20;
  double pajak = 10;

  // Menghitung jumlah diskon.
  double jumlahDiskon = harga * diskon / 100;

  // Menghitung harga setelah diskon.
  double hargaDiskon = harga - jumlahDiskon;

  // Menghitung pajak dari harga setelah diskon.
  double jumlahPajak = hargaDiskon * pajak / 100;

  // Menghitung total pembayaran.
  double total = hargaDiskon + jumlahPajak;

  print("Diskon: $jumlahDiskon");
  print("Harga setelah diskon: $hargaDiskon");
  print("Pajak: $jumlahPajak");
  print("Total pembayaran: $total");
}