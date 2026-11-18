import 'package:flutter/material.dart';
// seorang pembeli membeli barang
// buku 15.000
// pensil 5.000
// penghapus 3.000
// tas 75.0000

// hitung total seluruh belanja

void main() {

  // ===== SOAL 1: TOTAL BELANJA =====

  // Daftar harga barang.
  double buku = 15000;
  double pensil = 5000;
  double penghapus = 3000;
  double tas = 75000;

  // Menghitung seluruh harga barang.
  double totalBelanja =
      buku + pensil + penghapus + tas;

  // Menampilkan hasil.
  print("===== DAFTAR BELANJA =====");
  print("Buku: Rp$buku");
  print("Pensil: Rp$pensil");
  print("Penghapus: Rp$penghapus");
  print("Tas: Rp$tas");

  print("-------------------------");
  print("Total belanja: Rp$totalBelanja");
}

// seseorang membeli
// baju 80.000
// celana 100.000
// topi 30.000
// sepatu 150.000
// dan pemebeli membawa uang sebesar 400.000
void main1() {

  // ===== SOAL 2: BELANJA DAN KEMBALIAN =====

  // Daftar harga barang.
  double baju = 80000;
  double celana = 100000;
  double topi = 30000;
  double sepatu = 150000;

  // Uang yang dimiliki pembeli.
  double uangPembeli = 400000;

  // Menghitung total belanja.
  double totalBelanja =
      baju + celana + topi + sepatu;

  // Mengecek apakah uang cukup.
  if (uangPembeli >= totalBelanja) {

    // Menghitung kembalian.
    double kembalian = uangPembeli - totalBelanja;

    print("Total belanja: Rp$totalBelanja");
    print("Uang pembeli: Rp$uangPembeli");
    print("Kembalian: Rp$kembalian");
    print("Pembayaran berhasil");

  } else {

    // Menghitung kekurangan uang.
    double kekurangan = totalBelanja - uangPembeli;

    print("Total belanja: Rp$totalBelanja");
    print("Uang pembeli: Rp$uangPembeli");
    print("Uang kurang: Rp$kekurangan");
  }
}

// seorang pembeli membeli
// handphone 2.000.000
// headset 150.000
// casing 50.000
// charger 100.000
// pembeli mendapatkan diskon 15% dan membayar menggunakan uang 2.500.000


void main2() {

  // ===== SOAL 3: BELANJA + DISKON =====

  // Daftar harga barang.
  double handphone = 2000000;
  double headset = 150000;
  double casing = 50000;
  double charger = 100000;

  // Diskon yang diberikan.
  double diskon = 15;

  // Uang pembeli.
  double uangPembeli = 2500000;

  // 1. Menghitung total belanja.
  double totalBelanja =
      handphone + headset + casing + charger;

  // 2. Menghitung jumlah diskon.
  double potongan =
      totalBelanja * diskon / 100;

  // 3. Menghitung harga setelah diskon.
  double totalBayar =
      totalBelanja - potongan;

  print("Total belanja: Rp$totalBelanja");
  print("Diskon: $diskon%");
  print("Potongan: Rp$potongan");
  print("Total setelah diskon: Rp$totalBayar");

  // 4. Mengecek uang pembeli.
  if (uangPembeli >= totalBayar) {

    double kembalian = uangPembeli - totalBayar;

    print("Uang pembeli: Rp$uangPembeli");
    print("Kembalian: Rp$kembalian");
    print("Pembayaran berhasil");

  } else {

    double kurang = totalBayar - uangPembeli;

    print("Uang pembeli: Rp$uangPembeli");
    print("Uang kurang: Rp$kurang");
  }
}

// seorang pembeli membeli barang berikut
// laptop 5.000.000
// mouse 150.000
// keyboard 250.000
// headset 200.000

// ketentuan
// uang pembeli 6.000.000
// diskon = 10%
// pajak 11% dari harga setelah diskon

// Membuat halaman Kasir
class KasirPage extends StatefulWidget {
  const KasirPage({super.key});

  @override
  State<KasirPage> createState() => _KasirPageState();
}

class _KasirPageState extends State<KasirPage> {

  // =====================================
  // 1. DATA BARANG
  // =====================================

  // Menyimpan daftar nama barang dan harganya
  final List<Map<String, dynamic>> daftarBarang = [
    {'nama': 'Laptop', 'harga': 5000000},
    {'nama': 'Mouse', 'harga': 150000},
    {'nama': 'Keyboard', 'harga': 250000},
    {'nama': 'Headset', 'harga': 200000},
  ];

  // Menentukan besar diskon dan pajak
  double diskon = 10;
  double pajak = 11;

  // =====================================
  // 2. INPUT UANG PEMBELI
  // =====================================

  // Mengambil nilai uang yang diketik pengguna
  final TextEditingController uangController =
  TextEditingController();

  // =====================================
  // 3. VARIABEL PERHITUNGAN
  // =====================================

  // Menyimpan hasil perhitungan belanja
  double totalBelanja = 0;
  double potongan = 0;
  double hargaDiskon = 0;
  double jumlahPajak = 0;
  double totalBayar = 0;
  double uangPembeli = 0;
  double kembalian = 0;
  double kekurangan = 0;

  // Menentukan apakah hasil sudah dihitung
  bool sudahDihitung = false;

  // =====================================
  // 4. FUNGSI MENGHITUNG BELANJA
  // =====================================

  void hitungBelanja() {

    // Mengubah input teks menjadi angka
    // Jika input kosong atau tidak valid, nilainya menjadi 0
    uangPembeli = double.tryParse(uangController.text) ?? 0;

    // Menghitung seluruh harga barang
    totalBelanja = 0;

    for (var barang in daftarBarang) {
      totalBelanja += barang['harga'];
    }

    // Menghitung nominal diskon
    // Rumus: Total Belanja x Diskon / 100
    potongan = totalBelanja * diskon / 100;

    // Menghitung harga setelah diskon
    hargaDiskon = totalBelanja - potongan;

    // Menghitung nominal pajak
    // Rumus: Harga Setelah Diskon x Pajak / 100
    jumlahPajak = hargaDiskon * pajak / 100;

    // Menghitung total pembayaran
    totalBayar = hargaDiskon + jumlahPajak;

    // Mengecek apakah uang pembeli mencukupi
    if (uangPembeli >= totalBayar) {

      // Menghitung uang kembalian
      kembalian = uangPembeli - totalBayar;

      // Jika uang cukup, kekurangan menjadi 0
      kekurangan = 0;

    } else {

      // Menghitung jumlah uang yang masih kurang
      kekurangan = totalBayar - uangPembeli;

      // Jika uang kurang, kembalian menjadi 0
      kembalian = 0;
    }

    // Memperbarui tampilan agar hasil perhitungan muncul
    setState(() {
      sudahDihitung = true;
    });
  }

  // =====================================
  // 5. MENGHAPUS CONTROLLER
  // =====================================

  @override
  void dispose() {

    // Membersihkan controller ketika halaman ditutup
    uangController.dispose();

    super.dispose();
  }

  // =====================================
  // 6. TAMPILAN HALAMAN
  // =====================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Judul halaman
      appBar: AppBar(
        title: const Text('Kasir Sederhana'),
      ),

      // Membuat halaman bisa di-scroll
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Menampilkan judul daftar barang
              const Text(
                'Daftar Barang',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              // Menampilkan daftar barang menggunakan ListView
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: daftarBarang.length,

                itemBuilder: (context, index) {

                  // Mengambil data barang berdasarkan index
                  final barang = daftarBarang[index];

                  return ListTile(
                    title: Text(barang['nama']),

                    // Menampilkan harga barang
                    subtitle: Text(
                      'Rp ${barang['harga']}',
                    ),
                  );
                },
              ),

              const Divider(),

              // Menampilkan informasi diskon
              Text('Diskon: $diskon%'),

              // Menampilkan informasi pajak
              Text('Pajak: $pajak%'),

              const SizedBox(height: 20),

              // Input uang yang dibayarkan pembeli
              TextField(
                controller: uangController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Uang Pembeli',
                  hintText: 'Masukkan jumlah uang',
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 15),

              // Tombol untuk menjalankan fungsi hitungBelanja
              ElevatedButton(
                onPressed: hitungBelanja,
                child: const Text('Hitung Pembayaran'),
              ),

              const SizedBox(height: 20),

              // Menampilkan hasil jika sudah dihitung
              if (sudahDihitung) ...[

                const Divider(),

                const Text(
                  'Hasil Perhitungan',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                // Menampilkan total harga barang
                Text('Total Belanja: Rp $totalBelanja'),

                // Menampilkan nominal diskon
                Text('Potongan Diskon: Rp $potongan'),

                // Menampilkan harga setelah diskon
                Text('Harga Setelah Diskon: Rp $hargaDiskon'),

                // Menampilkan nominal pajak
                Text('Jumlah Pajak: Rp $jumlahPajak'),

                // Menampilkan total yang harus dibayar
                Text('Total Bayar: Rp $totalBayar'),

                const SizedBox(height: 10),

                // Mengecek apakah uang pembeli cukup
                if (uangPembeli >= totalBayar) ...[

                  // Jika cukup, tampilkan kembalian
                  Text(
                    'Kembalian: Rp $kembalian',
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Text('Pembayaran berhasil!'),

                ] else ...[

                  // Jika kurang, tampilkan kekurangan uang
                  Text(
                    'Uang Kurang: Rp $kekurangan',
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Text('Uang pembayaran belum cukup.'),
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }
}

