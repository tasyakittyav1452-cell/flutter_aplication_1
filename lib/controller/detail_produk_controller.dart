import 'package:flutter_application_1/produk/produk_model.dart';
import 'package:get/get.dart';

// FUNGSI : Menerima "arguments" (produk yang diklik) dari halaman list.
// Pengambilan arguments dilakukan DI SINI, bukan di halaman (page).
class DetailProdukController extends GetxController{
  // late = diisi nanti, di onInit()
  late final ProdukModel produk;

  //onInit() otomatis jalan sekali saat controller dibuat
  // Get.arguments = data yang dikirim lewat GET.toNamed(..., arguments: produk)
  @override
  void onInit() {
    super.onInit();
    produk = Get.arguments as ProdukModel; // dan diterima disini
  }
}