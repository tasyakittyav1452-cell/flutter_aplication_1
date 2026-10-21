import 'package:flutter/material.dart';
import 'package:flutter_application_1/produk/produk_model.dart';
import 'package:get/get.dart';

// FUNGSI : Tempat menyimpan DATA daftar produk (otak/logika)
// Halaman list tinggal mengambil data dari sini
class ListProdukController extends GetxController {
  // buat menyimpan teks yang diketik di kolom pencarian
  final TextEditingController searchController = TextEditingController();

  final List<ProdukModel> _dataawal = [
      ProdukModel(
        namaproduk: "Samsung Galaxy",
        harga: "10 juta",
        description: "Smartphone canggih dengan layar AMOLED dan performa ngebut.",
        image: "https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=500",
        reviews: "120 Ulasan",
        rating: "4.8",
        namaToko: "Samsung Official Store",
      ),
      ProdukModel(
        namaproduk: "Iphone 20",
        harga: "25 juta",
        description: "Generasi terbaru iPhone dengan chipset super cepat dan kamera profesional.",
        image: "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=500",
        reviews: "95 Ulasan",
        rating: "4.9",
        namaToko: "Apple Store Indo",
      ),
      ProdukModel(
        namaproduk: "Laptop ROG",
        harga: "30 juta",
        description: "Laptop gaming gahar libas semua game AAA rata kanan.",
        image: "https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=500",
        reviews: "210 Ulasan",
        rating: "5.0",
        namaToko: "ROG Gamers Zone",
      ),
      ProdukModel(
        namaproduk: "PS 5",
        harga: "8 juta",
        description: "Konsol game next-gen pengalaman bermain tanpa batas dengan grafik 4K.",
        image: "https://images.unsplash.com/photo-1606813907291-d86efa9b94db?w=500",
        reviews: "340 Ulasan",
        rating: "4.9",
        namaToko: "Sony Center Kudus",
      ),
      ProdukModel(
        namaproduk: "Smart TV Android",
        harga: "10 juta",
        description: "Televisi pintar jernih beresolusi 4K Ultra HD dengan sistem Android TV.",
        image: "https://images.unsplash.com/photo-1593784991095-a205069470b6?w=500",
        reviews: "88 Ulasan",
        rating: "4.7",
        namaToko: "Elektronik Jaya",
      ),
  ];

  final RxList<ProdukModel> listproduk = <ProdukModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    listproduk.assignAll(_dataawal);
  }

  Future<void> refreshProduk() async{
    await Future.delayed(const Duration(seconds: 1));
    listproduk.assignAll(_dataawal);
  }

  void hapusProduk(ProdukModel produk) {
    listproduk.remove(produk);
  }
}