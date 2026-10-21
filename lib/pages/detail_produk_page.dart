import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/detail_produk_controller.dart';
import 'package:get/get.dart';
import '../produk/produk_model.dart';

// PERHATIKAN: TIDAK ada "final ProdukModel produk" dan tidak ada constructor
// yang meminta produk. Data diambil dari controller
class DetailProdukPage extends StatelessWidget {
  const DetailProdukPage({super.key});

  @override
  Widget build(BuildContext context) {
    //FUNGSI: Get.put membuat controller -> onInit() membaca Get.arguments
    final controller = Get.put(DetailProdukController());


    return Scaffold(
      // ==== STYLE: AppBar gradasi ====
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.cyanAccent.withOpacity(0.8),
                Colors.blue.withOpacity(0.6),
                Colors.cyan.withOpacity(0.9),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.cyanAccent.withOpacity(0.5),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: AppBar(
            title: Text(controller.produk.namaproduk, style: const TextStyle(color: Colors.white)),
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      // FUNGSI: SingleChildScrollView = isi bisa di scroll kalau panjang
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        // ==== STYLE: Card pembungkus ====
        child: Card(
          color: Colors.cyan[50],
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Colors.cyan, width: 1.5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // FUNGSI: Image.network = tampilkan gambar dari URL
                Center(
                  child: ClipRRect( //STYLE: Sudut gambar membulat
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      controller.produk.image,
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                      //FUNGSI: Tampil ikon cadangan jika gambar gagal dimuat
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.cyan[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.broken_image, size: 60, color: Colors.cyan),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20), // FUNGSI: jarak kosong
                Text(controller.produk.namaproduk, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), //STYLE
                const SizedBox(height: 8),
                Text("Harga: ${controller.produk.harga}", style: const TextStyle(fontSize: 18, color: Colors.blueAccent, fontWeight: FontWeight.bold)), //STYLE
                const Divider(height: 24, color: Colors.cyan), // FUNGSI: garis pemisah
                Text("Nama Toko: ${controller.produk.namaToko}", style: const TextStyle(fontSize: 15)),
                const SizedBox(height: 8),
                Text("Rating: ${controller.produk.rating} (${controller.produk.reviews})", style: const TextStyle(fontSize: 15)),
                const SizedBox(height: 12),
                const Text("Deskripsi:", style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(controller.produk.description, style: const TextStyle(color: Colors.black87)),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom( // STYLE: warna tombol
                      backgroundColor: Colors.cyan[700],
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => Get.back(), // FUNGSI: kembali ke halaman sebelumnya
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