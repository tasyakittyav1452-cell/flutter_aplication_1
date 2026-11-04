import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController{

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // buat variabel reaktif untuk loading state
  var isloading = false.obs;

  void login() async {
    //validasi sederhana jika kosong
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("Error",
          "Username dan password harus terisi",
      backgroundColor: Colors.red,
          colorText: Colors.white);
      return;
    }
    
    try {
      // nyalakan status loading menjadi true
      isloading.value = true;
      
      // URL endpoint API login (sesuaikan dengan URL dari server/backend)
      var url = Uri.parse("https://mediadwi.com/api/latihan/login");

      var response = await http.post(
        url,
        body: {
          'username': emailController.text,
          'password': passwordController.text,
        },
      );

      //matikan loading karena proses sudah selesai
      isloading.value = false;

      //cek apakah status code sukses (200)
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        //ambil status dan message dari respon JSON
        bool status = data['status'] ?? false;
        String message = data['message'] ?? "Login gaga;";

        if (status == true) {
          Get.snackbar("Berhasil", message,
          backgroundColor: Colors.green, colorText: Colors.white);

          //jika sukses, pindah ke halaman main menu dan tutup halaman login (Get.off)
          Get.offNamed('/mainmenupage');
        } else {
          Get.snackbar("Gagal", message,
              backgroundColor: Colors.orange, colorText: Colors.white);
        }
      } else {
        Get.snackbar("Error", "Terjadi kesalahan pada server",
        backgroundColor: Colors.red, colorText: Colors.white);
      }
    } catch (e) {
      // Tangkap error jika koneksi terputus atau error lainnya
      isloading.value = false;
      Get.snackbar("Error", e.toString(),
      backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}