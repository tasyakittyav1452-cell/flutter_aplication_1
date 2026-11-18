// Membuat halaman Kasir
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    {'nama': 'Nasi Goreng Spesial', 'harga': 25000},
    {'nama': 'Ayam Bakar Madu', 'harga': 30000},
    {'nama': 'Sate Ayam Madura', 'harga': 28000},
    {'nama': 'Mie Ayam Bakso', 'harga': 20000},
    {'nama': 'Es Teh Manis Jumbo', 'harga': 8000},
  ];

  // Menentukan PPN
  double PPN = 0.05;

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

    // // Menghitung nominal diskon
    // // Rumus: Total Belanja x Diskon / 100
    // potongan = totalBelanja * diskon / 100;

    // // Menghitung harga setelah diskon
    // hargaDiskon = totalBelanja - potongan;

    // Menghitung nominal PPN
    // Rumus: Harga Setelah Diskon x Pajak / 100
    jumlahPajak = totalBelanja * PPN ;

    // // Menghitung total pembayaran
    // totalBayar = hargaDiskon + jumlahPajak;

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

              // // Menampilkan informasi diskon
              // Text('Diskon: $diskon%'),

              // Menampilkan informasi pajak
              Text('PPN: $PPN%'),

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

                // // Menampilkan nominal diskon
                // Text('Potongan Diskon: Rp $potongan'),

                // // Menampilkan harga setelah diskon
                // Text('Harga Setelah Diskon: Rp $hargaDiskon'),

                // Menampilkan nominal pajak
                Text('Jumlah PPN: Rp $PPN'),

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