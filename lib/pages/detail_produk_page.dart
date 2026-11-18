
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/detail_produk_controller.dart';
import 'package:get/get.dart';
import '../produk/produk_model.dart';
import 'package:flutter_application_1/product_model.dart';

// StatelessWidget digunakan untuk membuat halaman
// yang tidak mengelola perubahan state sendiri.
class DetailProdukPage extends StatelessWidget {

  // Constructor untuk membuat halaman DetailProdukPage.
  // super.key digunakan untuk meneruskan key ke class induk.
  const DetailProdukPage({super.key});

  // @override digunakan untuk menimpa method build dari StatelessWidget.
  // build() berfungsi untuk menyusun tampilan halaman.
  @override
  Widget build(BuildContext context) {

    // Get.put() digunakan untuk membuat dan mendaftarkan Controller.
    // DetailProdukController bertugas menerima data produk
    // yang dikirim dari halaman sebelumnya melalui Get.arguments.
    final controller = Get.put(DetailProdukController());

    // Scaffold merupakan kerangka dasar halaman Flutter.
    return Scaffold(

      // PreferredSize digunakan untuk mengatur ukuran AppBar.
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),

        // Container digunakan sebagai wadah untuk membuat desain AppBar.
        child: Container(

          // BoxDecoration digunakan untuk mengatur dekorasi Container.
          decoration: BoxDecoration(

            // LinearGradient digunakan untuk membuat gradasi warna.
            gradient: LinearGradient(
              colors: [
                Colors.cyanAccent.withOpacity(0.8),
                Colors.blue.withOpacity(0.6),
                Colors.cyan.withOpacity(0.9),
              ],
            ),

            // BoxShadow digunakan untuk memberikan efek bayangan.
            boxShadow: [
              BoxShadow(
                color: Colors.cyanAccent.withOpacity(0.5),
                blurRadius: 10.0, // Mengatur kelembutan bayangan.
                spreadRadius: 2.0, // Mengatur penyebaran bayangan.
              ),
            ],
          ),

          // AppBar digunakan untuk membuat bagian atas halaman.
          child: AppBar(

            // Menampilkan nama produk sebagai judul AppBar.
            // controller.produk.name mengambil nama produk dari Controller.
            title: Text(
              controller.produk.name,
              style: const TextStyle(color: Colors.white),
            ),

            // Membuat latar belakang AppBar transparan.
            backgroundColor: Colors.transparent,

            // Menghilangkan bayangan bawaan AppBar.
            elevation: 0,

            // Mengatur warna teks dan ikon AppBar.
            foregroundColor: Colors.white,
          ),
        ),
      ),

      // SingleChildScrollView digunakan agar isi halaman
      // bisa digulir ke atas dan ke bawah jika terlalu panjang.
      body: SingleChildScrollView(

        // Memberikan jarak 16 pada semua sisi.
        padding: const EdgeInsets.all(16.0),

        // Card digunakan sebagai kartu pembungkus informasi produk.
        child: Card(

          // Mengatur warna latar belakang Card.
          color: Colors.cyan[50],

          // Mengatur tingkat bayangan Card.
          elevation: 6,

          // Mengatur bentuk dan garis tepi Card.
          shape: RoundedRectangleBorder(

            // Membuat sudut Card menjadi membulat.
            borderRadius: BorderRadius.circular(16),

            // BorderSide digunakan untuk membuat garis tepi Card.
            side: const BorderSide(
              color: Colors.cyan,
              width: 1.5,
            ),
          ),

          // Padding digunakan untuk memberikan jarak di dalam Card.
          child: Padding(
            padding: const EdgeInsets.all(20.0),

            // Column digunakan untuk menyusun isi halaman secara vertikal.
            child: Column(

              // Mengatur posisi isi agar rata kiri.
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                // Center digunakan untuk membuat gambar berada di tengah.
                Center(

                  // ClipRRect digunakan untuk membuat sudut gambar membulat.
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),

                    // Image.network digunakan untuk menampilkan gambar
                    // dari alamat URL internet.
                    child: Image.network(

                      // Mengambil URL gambar dari data produk.
                      controller.produk.image,

                      height: 120, // Mengatur tinggi gambar.
                      width: 120, // Mengatur lebar gambar.

                      // BoxFit.cover membuat gambar memenuhi area yang tersedia.
                      fit: BoxFit.cover,

                      // errorBuilder digunakan untuk menampilkan widget
                      // pengganti jika gambar gagal dimuat.
                      errorBuilder: (context, error, stackTrace) {

                        // Container digunakan sebagai tampilan pengganti gambar.
                        return Container(
                          height: 120,
                          width: 120,

                          // Mengatur dekorasi Container pengganti.
                          decoration: BoxDecoration(
                            color: Colors.cyan[100],
                            borderRadius: BorderRadius.circular(12),
                          ),

                          // Icon broken_image digunakan untuk menunjukkan
                          // bahwa gambar tidak berhasil dimuat.
                          child: const Icon(
                            Icons.broken_image,
                            size: 60,
                            color: Colors.cyan,
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // Menampilkan nama produk.
                // ${} digunakan untuk memasukkan nilai variabel ke dalam String.
                // TextStyle digunakan untuk mengatur ukuran dan ketebalan tulisan.
                Text(
                  controller.produk.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Memberikan jarak kosong sebesar 8.
                const SizedBox(height: 8),

                // Menampilkan harga produk.
                // controller.produk.price mengambil data harga dari Controller.
                Text(
                  "Harga: ${controller.produk.price}",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Divider digunakan untuk membuat garis pemisah.
                // height mengatur tinggi ruang yang disediakan Divider.
                const Divider(
                  height: 24,
                  color: Colors.cyan,
                ),

                // Menampilkan nama toko produk.
                Text(
                  "Nama Toko: ${controller.produk.storeName}",
                  style: const TextStyle(fontSize: 15),
                ),

                // Memberikan jarak kosong sebesar 8.
                const SizedBox(height: 8),

                // Menampilkan rating atau penilaian produk.
                Text(
                  "Rating: ${controller.produk.rating}",
                  style: const TextStyle(fontSize: 15),
                ),

                // Memberikan jarak kosong sebesar 12.
                const SizedBox(height: 12),

                // Menampilkan judul bagian deskripsi.
                // FontWeight.bold digunakan untuk membuat tulisan tebal.
                const Text(
                  "Deskripsi:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                // Memberikan jarak kosong sebesar 4.
                const SizedBox(height: 4),

                // Menampilkan deskripsi produk dari Controller.
                Text(
                  controller.produk.description,
                  style: const TextStyle(color: Colors.black87),
                ),

                // Memberikan jarak kosong sebesar 24.
                const SizedBox(height: 24),

                // SizedBox digunakan untuk mengatur ukuran tombol.
                SizedBox(

                  // double.infinity membuat lebar tombol memenuhi ruang tersedia.
                  width: double.infinity,

                  // Mengatur tinggi tombol menjadi 45.
                  height: 45,

                  // ElevatedButton digunakan untuk membuat tombol.
                  child: ElevatedButton(

                    // styleFrom digunakan untuk mengatur tampilan tombol.
                    style: ElevatedButton.styleFrom(

                      // Mengatur warna latar belakang tombol.
                      backgroundColor: Colors.cyan[700],

                      // Mengatur warna teks tombol.
                      foregroundColor: Colors.white,
                    ),

                    // onPressed dijalankan ketika tombol ditekan.
                    // Get.back() digunakan untuk kembali ke halaman sebelumnya.
                    onPressed: () => Get.back(),

                    // Text digunakan untuk menampilkan tulisan pada tombol.
                    child: const Text("Kembali"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
