import 'package:flutter_application_1/produk/produk_model.dart';
import 'package:get/get.dart';

import '../product_model.dart';

// FUNGSI : Menerima "arguments" (produk yang diklik) dari halaman list.
// Pengambilan arguments dilakukan DI SINI, bukan di halaman (page).
class DetailProdukController extends GetxController{
  // ini yang keterima lewat Get.toNamed yang ada di list produk page
  final ProductModel produk = Get.arguments as ProductModel;
}