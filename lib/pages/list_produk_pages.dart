import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controller/list_produk_controller.dart';
import 'package:flutter_application_1/produk/produk_model.dart';

class ListProdukPages extends StatelessWidget {
  ListProdukPages({super.key});

  final controller = Get.put(ListProdukController());

  @override
  Widget build(BuildContext context) {
    return Scaffold( // FUNGSI: Kerangka halaman (appBar + body)
    // ==== STYLE: AppBar gradasi cyan-biru + bayangan ====
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient( // STYLE: warna gradasi
                  colors: [
                    Colors.cyanAccent.withOpacity(0.8),
                    Colors.blue.withOpacity(0.6),
                    Colors.cyan.withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              ),
              boxShadow: [ // STYLE: bayangan glow
                BoxShadow(
                  color: Colors.cyanAccent.withOpacity(0.5),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ),
              ],
              border: Border( // STYLE: garis putih tipis di bawah
                bottom: BorderSide(
                  color: Colors.white.withOpacity(0.5),
                  width: 1.5,
                ),
              ),
            ),
            child: AppBar(
              title: const Text(
                "My Products",
                style: TextStyle( // STYLE: teks judul
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              backgroundColor: Colors.transparent, // STYLE: transparant agar gradasi terlihat
                elevation: 0,
              foregroundColor: Colors.white,
            ),
          ),
        ),
      // ==== STYLE: latar body gradasi tipis ====
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.cyan.withOpacity(0.05), Colors.blue.withOpacity(0.1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        // FUNGSI: ListView.builder = membuat daftar otomatis sesuai jumlah data
        child: ListView.builder(
          itemCount: controller.listproduk.length, //jumlah data
          itemBuilder: (context, index) {
            // ambil 1 produk sesuai urutan index
            final ProdukModel produk = controller.listproduk[index];

            // FUNGSI: InkWell = membuat widget bisa diklik (ada efek ripple(efek visual berupa animasi gelombang
            // dari titik sentuhan pengguna saat mereka menekan sebuah elemen interaktif)).
            return InkWell(
              onTap: (){
                // FUNGSI: pindah ke halaman detail + KIRIM produk lewat arguments
                Get.toNamed( // Awal mula nya dari sini untuk mengirim data
                  Routes.detailProduk,
                  arguments: produk
                );
              },
          // ==== STYLE: Card ( efek timbul ) ====
            child: Card( // FUNGSI: Card = efek timbul
              color: Colors.cyan[50],
              elevation: 4,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.cyan.withOpacity(0.4), width: 1),
              ),
              // FUNGSI: ListTile = baris siap pakai ( judul, subjudul, ikon )
              child: ListTile(
                title: Text(produk.namaproduk,
                style: const TextStyle(fontWeight: FontWeight.bold), // STYLE
              ),
                subtitle: Text(produk.harga),
                // KODE BARU (SUDAH BENAR):
                trailing: const Icon(Icons.arrow_forward, color: Colors.cyan), // STYLE
              ),
             ),
            );
          },
        ),
      ),
    );
  }
}