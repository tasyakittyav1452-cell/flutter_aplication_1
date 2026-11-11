import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/list_produk_controller.dart';
import 'package:flutter_application_1/produk/produk_model.dart';
import 'package:flutter_application_1/routes.dart'; // <- yang kurang
import 'package:get/get.dart';
import 'package:flutter_application_1/product_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //mengambil data produk dari controller yang sudah dibuat
    final controller = Get.put(ListProdukController());

    return Scaffold(
      body: SafeArea( // supaya isi tidak tertutup status bar
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.all(16),
              child: Text("Rekomendasi produk",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
              ),
              ),

              Container(
                height: MediaQuery.of(context).size.height / 3,
                child: Obx(
                    () => ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.listproduk.length,
                        itemBuilder: (context, index) {
                          final ProductModel produk = controller.listproduk[index];
                          return InkWell(
                            onTap: () {
                              Get.toNamed(Routes.detailProduk, arguments: produk);
                            },
                            child: SizedBox(
                              width: 160,
                              child:  Card(
                                color: Colors.cyan[50],
                                elevation: 4,
                                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(color: Colors.cyan.withOpacity(0.4), width: 1),
                                ),
                                child: Padding(padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // mengisi sisa gambar tinggi kartu nya
                                    Expanded(child: Center(
                                      child: ClipRRect( // membuat sudut gambar itu membulat
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(produk.image,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        // untuk membuat cadangan jika gambar tersebut gagal untuk dimuat
                                        errorBuilder: (context, error, stackTrace) =>
                                            const Icon(Icons.broken_image, size: 50, color: Colors.cyan,)
                                        ),
                                      ),
                                    ),
                                    ),
                                    const SizedBox(height: 8), //jarak kosong
                                    Text(produk.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis, // teks panjang jadi ".."
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Text(produk.price),
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
