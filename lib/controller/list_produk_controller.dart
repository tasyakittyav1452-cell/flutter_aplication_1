import 'package:flutter/material.dart';
import 'package:flutter_application_1/produk/produk_model.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/product_model.dart';

// FUNGSI : Tempat menyimpan DATA daftar produk (otak/logika)
// Halaman list tinggal mengambil data dari sini
class ListProdukController extends GetxController {
  // buat menyimpan teks yang diketik di kolom pencarian
  final TextEditingController searchController = TextEditingController();

  final RxList<ProductModel> listproduk = <ProductModel>[].obs;
  var isloading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadProdukDariJson();
  }

  void loadProdukDariJson() {
    isloading.value = true;

    String jsonString = '''
    [
      {
        "id": 1,
        "name": "Samsung Galaxy",
        "price": "10 juta",
        "image": "https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=500",
        "storeName": "Samsung Official Store",
        "rating": "4.8",
        "description": "Smartphone canggih dengan layar AMOLED dan performa ngebut."
      },
      {
        "id": 2,
        "name": "Iphone 20",
        "price": "25 juta",
        "image": "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=500",
        "storeName": "Apple Store Indo",
        "rating": "4.9",
        "description": "Generasi terbaru iPhone dengan chipset super cepat."
      },
      {
        "id": 3,
        "name": "Laptop ROG",
        "price": "30 juta",
        "image": "https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=500",
        "storeName": "ROG Gamers Zone",
        "rating": "5.0",
        "description": "Laptop gaming gahar libas semua game AAA rata kanan."
      }
    ]
    ''';

    listproduk.value = productModelFromJson(jsonString);
    isloading.value = false;
  }

  Future<void> refreshProduk() async{
    await Future.delayed(const Duration(seconds: 1));
   loadProdukDariJson();
  }

  void hapusProduk(ProductModel produk) {
    listproduk.remove(produk);
  }
}