// diskon

// Menentukan harga barang
double harga = 100000;

// Menentukan diskon 10%
double diskon = 10;

// Menghitung nominal potongan diskon
double potongan = harga * diskon / 100;

// Menghitung harga setelah diskon
double hargaAkhir = harga - potongan;

// pajak

// Menentukan harga barang
double harga1 = 100000;

// Menentukan pajak 11%
double pajak = 11;

// Menghitung nominal pajak
double nominalPajak = harga * pajak / 100;

// Menghitung harga ditambah pajak
double total = harga + nominalPajak;

// kembalian

// Menentukan total pembayaran
double totalBayar = 75000;

// Menentukan uang pembeli
double uangPembeli = 100000;

// Menghitung kembalian
double kembalian = uangPembeli - totalBayar;

// kekurangan uang

void main() {
  // Menentukan total pembayaran
  double totalBayar1 = 150000;

// Menentukan uang pembeli
  double uangPembeli1 = 100000;

// Mengecek apakah uang pembeli cukup
  if (uangPembeli >= totalBayar) {

// Menghitung kembalian
    double kembalian = uangPembeli - totalBayar;

    print("Kembalian: Rp $kembalian");

  } else {

// Menghitung kekurangan uang
    double kekurangan = totalBayar - uangPembeli;

    print("Uang kurang: Rp $kekurangan");
  }
}

// diskon + pajak + kembalian

void main1() {
// Menentukan harga barang
  double harga = 100000;

// Menentukan diskon dan pajak
  double diskon = 10;
  double pajak = 11;

// Menghitung potongan diskon
  double potongan = harga * diskon / 100;

// Menghitung harga setelah diskon
  double hargaDiskon = harga - potongan;

// Menghitung nominal pajak
  double nominalPajak = hargaDiskon * pajak / 100;

// Menghitung total pembayaran
  double totalBayar = hargaDiskon + nominalPajak;

// Menentukan uang pembeli
  double uangPembeli = 120000;

// Menghitung kembalian atau kekurangan
  if (uangPembeli >= totalBayar) {
    double kembalian = uangPembeli - totalBayar;
    print("Kembalian: Rp $kembalian");
  } else {
    double kekurangan = totalBayar - uangPembeli;
    print("Uang kurang: Rp $kekurangan");
  }
}

