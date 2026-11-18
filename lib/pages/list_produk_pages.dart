import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controller/list_produk_controller.dart';
import 'package:flutter_application_1/produk/produk_model.dart';
import 'package:flutter_application_1/product_model.dart';

class ListProdukPages extends StatelessWidget {
  // Constructor untuk membuat objek ListProdukPages.
  // super.key digunakan untuk meneruskan key ke class induk.
  ListProdukPages({super.key});

  // Get.put() digunakan untuk membuat dan mendaftarkan Controller.
  // Controller digunakan untuk mengambil dan mengatur data produk.
  final controller = Get.put(ListProdukController());

  @override
  Widget build(BuildContext context) { // build() berfungsi untuk menyusun tampilan halaman.
    return Scaffold(  // Scaffold merupakan kerangka dasar halaman Flutter.
      // Catatan: AppBar atas dengan gradasi cyan-biru yang sudah ada sebelumnya
      // PreferredSize digunakan untuk menentukan ukuran AppBar.
      // preferredSize mengatur tinggi AppBar.
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(  // Container digunakan sebagai wadah untuk membuat desain AppBar.
          decoration: BoxDecoration( // BoxDecoration digunakan untuk mengatur dekorasi Container.
            gradient: LinearGradient( // LinearGradient digunakan untuk membuat gradasi warna.
              colors: [ // colors berisi kumpulan warna gradasi.
                Colors.cyanAccent.withOpacity(0.8),
                Colors.blue.withOpacity(0.6),
                Colors.cyan.withOpacity(0.9),
              ],
              begin: Alignment.topLeft, // Menentukan arah awal gradasi dari kiri atas.
              end: Alignment.bottomRight,  // Menentukan arah akhir gradasi ke kanan bawah.
            ),
            boxShadow: [ // boxShadow digunakan untuk memberikan efek bayangan.
              BoxShadow(
                color: Colors.cyanAccent.withOpacity(0.5),
                blurRadius: 10.0, // Mengatur tingkat blur atau kelembutan bayangan.
                spreadRadius: 2.0, // Mengatur ukuran penyebaran bayangan.
              ),
            ],
          ),
          child: AppBar(  // AppBar digunakan untuk membuat bagian atas halaman.
            title: const Text( // title digunakan untuk menampilkan judul halaman.
              "My Products",
              style: TextStyle( // TextStyle digunakan untuk mengatur tampilan tulisan.
                color: Colors.white, // Mengatur warna tulisan.
                fontWeight: FontWeight.bold, // Membuat tulisan tebal.
                letterSpacing: 1.2, // Mengatur jarak antarhuruf.
              ),
            ),
            // Membuat latar belakang AppBar transparan
            // agar gradasi Container terlihat.
            backgroundColor: Colors.transparent,
            elevation: 0, // elevation 0 berarti menghilangkan bayangan bawaan AppBar.
            foregroundColor: Colors.white, // Mengatur warna ikon dan teks pada AppBar.
          ),
        ),
      ),

      // Catatan: Latar belakang body menggunakan nuansa gelap/hitam sinematik
      body: Container( // Container digunakan sebagai latar belakang halaman.
        decoration: BoxDecoration( // BoxDecoration digunakan untuk memberikan dekorasi.
          gradient: LinearGradient( // Membuat gradasi warna hitam dan abu-abu gelap.
            colors: [Colors.black, Colors.grey.shade900],
            begin: Alignment.topCenter, // Arah gradasi dimulai dari atas tengah.
            end: Alignment.bottomCenter, // Arah gradasi berakhir di bawah tengah.
          ),
        ),
        // Obx digunakan untuk mengamati perubahan data RxList.
        // Jika data produk berubah, tampilan akan diperbarui.
        child: Obx(
              () => ListView.builder( // Fungsi singkat untuk menampilkan ListView.builder.
            itemCount: controller.listproduk.length, // Menentukan jumlah item sesuai jumlah produk.
                // itemBuilder digunakan untuk membuat setiap item produk.
                // index merupakan urutan posisi produk.
            itemBuilder: (context, index) {
              // Mengambil data produk berdasarkan nomor index.
              // Data disimpan ke variabel produk.
              final ProductModel produk = controller.listproduk[index];

              // Catatan: Mengatur warna gradasi khusus untuk masing-masing card produk
              // sesuai dengan ide warna yang kamu minta sebelumnya.
              List<Color> cardColors; // Membuat variabel untuk menyimpan kumpulan warna gradasi.
              Color textColor;  // Variabel untuk menyimpan warna tulisan utama.
              Color subTextColor; // Variabel untuk menyimpan warna tulisan tambahan.

              // contains() digunakan untuk memeriksa apakah nama produk
              // mengandung kata "Samsung".
              if (produk.name.contains("Samsung")) {
                // Mengatur warna gradasi khusus untuk produk Samsung.
                cardColors = [Colors.black, Colors.grey.shade700, Colors.white70];
                textColor = Colors.white;
                subTextColor = Colors.white70;
              } else if (produk.name.contains("Iphone")) { // Jika bukan Samsung, periksa apakah nama mengandung Iphone.
                cardColors = [const Color(0xFF2A2A2A), const Color(0xFF0D47A1), Colors.cyanAccent];
                textColor = Colors.white;
                subTextColor = Colors.cyan.shade100;
              } else if (produk.name.contains("ROG")) {
                cardColors = [Colors.black, const Color(0xFF8B0000), Colors.redAccent];
                textColor = Colors.white;
                subTextColor = Colors.red.shade100;
              } else if (produk.name.contains("PS")) {
                cardColors = [Colors.black, Colors.grey.shade400, Colors.white];
                textColor = Colors.white;
                subTextColor = Colors.grey.shade200;
              } else {
                cardColors = [const Color(0xFF0A192F), Colors.blueAccent, Colors.white];
                textColor = Colors.white;
                subTextColor = Colors.white70;
              }

              return InkWell( // InkWell digunakan agar kartu produk bisa ditekan.
                onTap: () { // onTap dijalankan ketika kartu produk diklik.
                  // Catatan: Berpindah ke halaman detail produk saat card ditekan
                  // Get.toNamed digunakan untuk berpindah halaman
                  // berdasarkan nama route.
                  // arguments digunakan untuk mengirim data produk
                  // yang dipilih menuju halaman detail.
                  Get.toNamed(
                      Routes.detailProduk,
                      arguments: produk
                  );
                },
                // Catatan: Mengubah card panjang bawaan menjadi Container dengan gradasi warna khusus
                child: Container(  // Container digunakan sebagai kartu produk.
                  decoration: BoxDecoration( // BoxDecoration digunakan untuk mengatur tampilan kartu.
                    gradient: LinearGradient( // Membuat warna gradasi pada kartu produk
                      colors: cardColors,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),  // Membuat sudut kartu menjadi membulat.
                    boxShadow: [ // Memberikan efek bayangan pada kartu.
                      BoxShadow(
                        color: cardColors.first.withOpacity(0.5), // Menggunakan warna pertama dari cardColors.
                        blurRadius: 8.0, // Mengatur tingkat blur bayangan.
                        // Mengatur posisi bayangan.
                        // dx = 0 (tidak bergeser ke samping).
                        // dy = 4 (bergeser ke bawah).
                        offset: const Offset(0, 4),
                      ),
                    ],
                    border: Border.all(color: Colors.white24, width: 1), // Border.all digunakan untuk membuat garis tepi kartu.
                  ),
                  // Mengatur jarak luar kartu.
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  // ListTile digunakan untuk menyusun informasi produk
                  // dalam bentuk baris.
                  child: ListTile(
                    title: Text( // title digunakan untuk menampilkan nama produk.
                      produk.name,
                      style: TextStyle( // Mengatur tampilan nama produk.
                        fontWeight: FontWeight.bold,
                        color: textColor, // Menggunakan warna tulisan yang sudah ditentukan.
                      ),
                    ),
                    // subtitle digunakan untuk menampilkan informasi tambahan,
                    // yaitu harga produk.
                    subtitle: Text(
                      produk.price,
                      style: TextStyle(color: subTextColor), // Mengatur warna tulisan harga.
                    ),
                    // trailing digunakan untuk menampilkan widget
                    // pada bagian kanan ListTile.
                    // Icon arrow_forward menunjukkan arah ke halaman berikutnya.
                    trailing: const Icon(Icons.arrow_forward, color: Colors.white70),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}