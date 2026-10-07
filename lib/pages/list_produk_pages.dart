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
              border: Border(
                bottom: BorderSide(
                  color: Colors.white.withOpacity(0.5),
                  width: 1.5,
                ),
              ),
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.cyan.withOpacity(0.05), Colors.blue.withOpacity(0.1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: controller.listproduk.length,
        itemBuilder: (context, index) {
            final ProdukModel produk = controller.listproduk[index];

            return Card(
              color: Colors.cyan[50],
              elevation: 4,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.cyan.withOpacity(0.4), width: 1),
              ),
              child: ListTile(
                title: Text(produk.namaproduk,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
                subtitle: Text(produk.harga),
                // KODE BARU (SUDAH BENAR):
                leading: IconButton(
                  icon: const Icon(Icons.arrow_forward, color: Colors.cyan),
                  onPressed: () {
                    Get.toNamed(Routes.detailProduk, arguments: produk); // ✅ Menggunakan variabel dari Routes
                  },
                ),
              ),
            );
        },
        ),
      ),
    );
  }
}