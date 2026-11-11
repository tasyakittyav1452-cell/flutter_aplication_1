import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controller/list_produk_controller.dart';
import 'package:flutter_application_1/produk/produk_model.dart';
import 'package:flutter_application_1/product_model.dart';

class ListProdukPages extends StatelessWidget {
  ListProdukPages({super.key});

  final controller = Get.put(ListProdukController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Catatan: AppBar atas dengan gradasi cyan-biru yang sudah ada sebelumnya
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
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
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
            title: const Text(
              "My Products",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.white,
          ),
        ),
      ),

      // Catatan: Latar belakang body menggunakan nuansa gelap/hitam sinematik
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.grey.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Obx(
              () => ListView.builder(
            itemCount: controller.listproduk.length,
            itemBuilder: (context, index) {
              final ProductModel produk = controller.listproduk[index];

              // Catatan: Mengatur warna gradasi khusus untuk masing-masing card produk
              // sesuai dengan ide warna yang kamu minta sebelumnya.
              List<Color> cardColors;
              Color textColor;
              Color subTextColor;

              if (produk.name.contains("Samsung")) {
                cardColors = [Colors.black, Colors.grey.shade700, Colors.white70];
                textColor = Colors.white;
                subTextColor = Colors.white70;
              } else if (produk.name.contains("Iphone")) {
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

              return InkWell(
                onTap: () {
                  // Catatan: Berpindah ke halaman detail produk saat card ditekan
                  Get.toNamed(
                      Routes.detailProduk,
                      arguments: produk
                  );
                },
                // Catatan: Mengubah card panjang bawaan menjadi Container dengan gradasi warna khusus
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: cardColors,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: cardColors.first.withOpacity(0.5),
                        blurRadius: 8.0,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    border: Border.all(color: Colors.white24, width: 1),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    title: Text(
                      produk.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: textColor, // Warna teks disesuaikan agar kontras
                      ),
                    ),
                    subtitle: Text(
                      produk.price,
                      style: TextStyle(color: subTextColor),
                    ),
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