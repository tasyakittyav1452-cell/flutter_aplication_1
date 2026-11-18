import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/pas_model.dart';

// FUNGSI : Tempat menyimpan DATA daftar produk (otak/logika)
// Halaman list tinggal mengambil data dari sini
class ListPasController extends GetxController {
  // buat menyimpan teks yang diketik di kolom pencarian
  // TextEditingController digunakan untuk mengontrol teks yang diketik pengguna dalam kolom pencarian
  final TextEditingController searchController = TextEditingController();

  //RxList digunakan untuk menyimpan daftar produk secara reaktif
  // <ProductModel> berarti daftar ini berisi objek ProductModel
  // .obs membuat data dapat diamati oleh Getx
  // jika data berubah, tampilan yang menggunakan obx dapat diperbarui
  final RxList<PasModel> listpas = <PasModel>[].obs;

  // variabel untuk mengetahui apakah proses loading sedang berlangsung
  // false = tidak loading
  // true = sedang loading
  // .obs membuat variabel bersifat reaktif
  var isloading = false.obs;

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
        "name": "Nasi Goreng Spesial",
        "price": "Rp25.000",
        "description": "Nasi goreng bumbu rempah dengan telur mata sapi,
        ayam suwir, dan kerupuk"
      },
      {
        "id": 2,
        "name": "Ayam Bakar Madu",
        "price": "Rp30.000 ",
        "description": "Ayam bakar olesan madu murni lengkap dengan sambal
        terasi dan lalapan."
      },
      {
        "id": 3,
        "name": "Sate Ayam Madura",
        "price": "Rp28.000 ",
        "description": "10 tusuk sate ayam daging pilihan dengan siraman
        bumbu kacang kental"
      },
      {
        "id": 4,
        "name": "Mie Ayam Bakso ",
        "price": "Rp20.000 ",
        "description": "Mie kenyal dengan topping ayam kecap, sawi hijau, dan
        2 butir bakso sapi."
      },
      {
        "id": 4,
        "name": "Es Teh Manis Jumbo",
        "price": "Rp8.000 ",
        "description": "Minuman teh melati segar dengan gula asli dan es batu
        kristal"
      },
    ]
    ''';

    // mengubah data JSON menjadi daftar objek productModel hasilnya dimasukkan ke dalam listproduk
    // .value digunakan untuk mengganti isi RxList
    listpas.value = pasModelFromJson(jsonString) as List<PasModel>;
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
  void hapusProduk(PasModel produk) {
    // menghapus produk yang dipilih dari listproduk
    listpas.remove(produk);
  }
}