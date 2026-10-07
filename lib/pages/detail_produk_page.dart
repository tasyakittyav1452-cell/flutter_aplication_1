import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../produk/produk_model.dart';

class DetailProdukPage extends StatelessWidget {
  const DetailProdukPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProdukModel produk = Get.arguments;

    return Scaffold(
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
            title: Text(produk.namaproduk, style: const TextStyle(color: Colors.white)),
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
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
                // 1. Bagian Gambar Produk (HANYA INI YANG DIGANTI)
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      produk.image,
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
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
                const SizedBox(height: 20),
                Text(produk.namaproduk, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text("Harga: ${produk.harga}", style: const TextStyle(fontSize: 18, color: Colors.blueAccent, fontWeight: FontWeight.bold)),
                const Divider(height: 24, color: Colors.cyan),
                Text("Nama Toko: ${produk.namaToko}", style: const TextStyle(fontSize: 15)),
                const SizedBox(height: 8),
                Text("Rating: ${produk.rating} (${produk.reviews})", style: const TextStyle(fontSize: 15)),
                const SizedBox(height: 12),
                const Text("Deskripsi:", style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(produk.description, style: const TextStyle(color: Colors.black87)),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan[700],
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () => Get.back(),
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