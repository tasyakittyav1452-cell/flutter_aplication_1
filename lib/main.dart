import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // FUNGSI: GetMaterialApp = MaterialApp versi GetX, wajib agar
    // Get.toNamed / Get.back / getPages bisa dipakai
    return GetMaterialApp(
        title: "BelajarFlutter PPLG 3",
      initialRoute: Routes.listProduk, // halaman pertama yang dibuka
      getPages: Routes.myPages, // daftar semua rute
    );
  }
}