import 'package:flutter/material.dart';
import 'package:flutter_application_1/produk/produk_model.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/product_model.dart';

// FUNGSI : Tempat menyimpan DATA daftar produk (otak/logika)
// Halaman list tinggal mengambil data dari sini
class ListProdukController extends GetxController {
  // buat menyimpan teks yang diketik di kolom pencarian
  // TextEditingController digunakan untuk mengontrol teks yang diketik pengguna dalam kolom pencarian
  final TextEditingController searchController = TextEditingController();

  //RxList digunakan untuk menyimpan daftar produk secara reaktif
  // <ProductModel> berarti daftar ini berisi objek ProductModel
  // .obs membuat data dapat diamati oleh Getx
  // jika data berubah, tampilan yang menggunakan obx dapat diperbarui
  final RxList<ProductModel> listproduk = <ProductModel>[].obs;

  // variabel untuk mengetahui apakah proses loading sedang berlangsung
  // false = tidak loading
  // true = sedang loading
  // .obs membuat variabel bersifat reaktif
  var isloading = false.obs;

  get listpas => null;

  @override
  void onInit() {
    // memanggil onInit() milik GetxController digunakan untuk menjalankan proses awal dari controller
    super.onInit();
    // memanggil fungsi untuk mengambil atau memuat data produk
    loadProdukDariJson();
  }

  // Fungsi; memuat data produk dari JSON
  void loadProdukDariJson() {
    // mengubah status loading menjadi true
    // artinya proses memuat data sedang berlangsung
    isloading.value = true;

    // string digunakan untuk menyimpan teks JSON
    // tanda ''' digunakan untuk menulis teks beberapa baris
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

    // mengubah data JSON menjadi daftar objek productModel hasilnya dimasukkan ke dalam listproduk
    // .value digunakan untuk mengganti isi RxList
    listproduk.value = productModelFromJson(jsonString);
    // mengubah status loading menjadi false
    // artinya proses memuat data sudah selesai
    isloading.value = false;
  }

  // Fungsi : memperbarui atau memuat ulang data produk
  // Future<void> digunakan untuk fungsi asynchronous yang tidak mengembalikan nilai
  Future<void> refreshProduk() async{
    // memberikan jeda selama 1 detik
    // digunakan untuk simulasi proses refresh
    await Future.delayed(const Duration(seconds: 1));
    // memanggil kembali fungsi untuk memuat data produk
   loadProdukDariJson();
  }

  //Fungsi : menghapus produk dari daftar
  // parameter ProductModel produk berisi objek produk yang ingin dihapus
  void hapusProduk(ProductModel produk) {
    // menghapus produk yang dipilih dari listproduk
    listproduk.remove(produk);
  }
}