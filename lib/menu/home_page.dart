import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/list_produk_controller.dart';
import 'package:flutter_application_1/produk/produk_model.dart';
import 'package:flutter_application_1/routes.dart'; // <- yang kurang
import 'package:get/get.dart';
import 'package:flutter_application_1/product_model.dart';

class HomePage extends StatelessWidget {
  // membuat constructor homepage
  // super.key digunakan untuk meneruskan key ke class induk
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // mengambil atau membuat controller menggunakan Getx
    // Get.put() digunakan untuk mendaftarkan controller agar bisa digunakan
    final controller = Get.put(ListProdukController());
    // Scaffold merupakan kerangka dasar tampilan halaman flutter
    return Scaffold(
      body: SafeArea( // supaya isi halaman tidak tertutup status bar atau bagian tertentu
          child: Column( // untuk menyusun widget secara vertical atau dari atas ke bawah
            crossAxisAlignment: CrossAxisAlignment.start, // mengatur posisi anak widget agar rata kiri
            children: [
              const Padding( // untuk memberikan jarak di sekeliling widget
                padding: EdgeInsets.all(16),
              child: Text("Rekomendasi produk", // menampilkan tulisan
                style: TextStyle(
                    fontSize: 20, // mengatur ukuran tulisan menjadi 20
                    fontWeight: FontWeight.bold // membuat tulisan tebal
                )
              ),
              ),

              Container( // wadah widget

                // mengatur tinggi container sebesar 1/3 tinggi layar
                // MediaQuery.of(context) untuk mengambil informasi layar
                height: MediaQuery.of(context).size.height / 3,
                  // Obx digunakan untuk mengamati perubahan data Rx dari GetX.
                  // Jika listproduk berubah, tampilan akan diperbarui.
                child: Obx(
                  // () => digunakan untuk menuliskan fungsi singkat.
                  // ListView.builder digunakan untuk membuat daftar widget
                  // secara dinamis berdasarkan jumlah data.
                    () => ListView.builder(
                        scrollDirection: Axis.horizontal, // Mengatur arah scroll menjadi horizontal (ke samping).
                        itemCount: controller.listproduk.length, // Menentukan jumlah item berdasarkan jumlah produk.
                        // itemBuilder digunakan untuk membuat setiap item produk.
                        // index merupakan nomor urutan item yang sedang dibuat.
                        itemBuilder: (context, index) {
                          // Mengambil data produk berdasarkan posisi index.
                          // Data disimpan ke variabel produk.
                          final ProductModel produk = controller.listproduk[index];
                          // InkWell digunakan untuk memberikan efek interaksi
                          // ketika item produk ditekan.
                          return InkWell( // onTap dijalankan ketika produk diklik.
                            onTap: () {
                              // Get.toNamed digunakan untuk berpindah halaman
                              // berdasarkan nama route.
                              // Routes.detailProduk merupakan alamat halaman detail.
                              // arguments digunakan untuk mengirim data produk
                              // yang diklik ke halaman detail.
                              Get.toNamed(Routes.detailProduk, arguments: produk);
                            },
                            child: SizedBox( // SizedBox digunakan untuk mengatur ukuran widget.
                              width: 160, // Mengatur lebar setiap kartu produk menjadi 160.
                              child:  Card( // Card digunakan untuk membuat tampilan kartu produk.
                                color: Colors.cyan[50], // Mengatur warna latar belakang kartu menjadi cyan muda.
                                elevation: 4, // Mengatur tingkat bayangan kartu.
                                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6), // Mengatur jarak luar kartu.
                                shape: RoundedRectangleBorder( // shape digunakan untuk mengatur bentuk kartu.
                                  borderRadius: BorderRadius.circular(12), // Membuat sudut kartu menjadi membulat.
                                  side: BorderSide(color: Colors.cyan.withOpacity(0.4), width: 1), // BorderSide digunakan untuk mengatur garis tepi kartu.
                                ),
                                child: Padding(padding: const EdgeInsets.all(10), // Padding memberikan jarak di dalam kartu.
                                child: Column( // Column menyusun isi kartu secara vertikal.
                                  crossAxisAlignment: CrossAxisAlignment.start, // Mengatur isi kartu agar rata kiri.
                                  children: [
                                    // mengisi sisa gambar tinggi kartu nya
                                    // Expanded digunakan agar gambar mengisi
                                    // sisa ruang yang tersedia di dalam Column.
                                    Expanded(child: Center(
                                      child: ClipRRect( // ClipRRect digunakan untuk memotong widget
                                        // agar sudut gambar menjadi membulat.
                                        borderRadius: BorderRadius.circular(12),  // Mengatur tingkat lengkungan sudut gambar.
                                        // Image.network digunakan untuk menampilkan
                                        // gambar yang berasal dari URL internet.
                                        child: Image.network(produk.image,
                                            // BoxFit.cover membuat gambar memenuhi
                                            // area tanpa mengubah perbandingan ukurannya.
                                        fit: BoxFit.cover,
                                        width: double.infinity, // Membuat lebar gambar memenuhi ruang tersedia.
                                        // untuk membuat cadangan jika gambar tersebut gagal untuk dimuat
                                        errorBuilder: (context, error, stackTrace) =>
                                            const Icon(Icons.broken_image, size: 50, color: Colors.cyan,)
                                        ),
                                      ),
                                    ),
                                    ),
                                    // SizedBox digunakan untuk memberikan jarak kosong
                                    // sebesar 8 antara gambar dan nama produk.
                                    const SizedBox(height: 8), //jarak kosong
                                    Text(produk.name, // Text digunakan untuk menampilkan nama produk.
                                    maxLines: 1, // Membatasi nama produk maksimal satu baris.
                                      // Jika teks terlalu panjang, bagian akhirnya
                                      // akan diganti dengan tanda titik-titik (...).
                                    overflow: TextOverflow.ellipsis, // teks panjang jadi ".."
                                    style: const TextStyle(fontWeight: FontWeight.bold),  // Mengatur tulisan menjadi tebal.
                                    ),
                                    Text(produk.price),  // Mengatur tulisan menjadi tebal.
                                  ],
                                ),
                                ),
                              ),
                            ),
                          );
                        }
                ),
              )
              )
            ],
          )
    ),
    );
  }
}
