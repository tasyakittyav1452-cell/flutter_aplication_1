import 'package:flutter_application_1/produk/produk_model.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/team_model.dart';
// import '../product_model.dart';

// FUNGSI : Menerima "arguments" (produk yang diklik) dari halaman list.
// data produk dikirim menggunakan Get.toNamed().
// Pengambilan arguments dilakukan DI SINI, bukan di halaman (page).
// sehingga halaman detail cukup menggunakan data dari controller
class DetailListPasController extends GetxController{
  // ini yang keterima lewat Get.toNamed yang ada di list produk page
  // final digunakan agar cariabel produk tidak biasa idisi ulang
  // ProductModel merupakan tipe data objek produk
  // Get.arguments digunakan untuk menerima data yang dikirim dari halaman sebelumnya
  // as ProductModel digunakan untuk mengubah tipe arguments
  // menjadi ProductModel agar sesuai dengan tipe variabel produk
  final PremierLeagueModel produk = Get.arguments as PremierLeagueModel;
}