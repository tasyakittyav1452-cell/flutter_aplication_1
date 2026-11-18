import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login_pas_page.dart';
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
      debugShowCheckedModeBanner: false,

      // FUNGSI: Menentukan halaman mana yang pertama kali muncul saat aplikasi dibuka.
      home: const LoginPasPage(),
    );
  }
}