import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var isloading = false.obs;

  //ubah tipe dungsi agar bisa memberikan laporan status ke page
  void login(Function(bool success, String message) onResult) async{
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      onResult(false, "Username dan Password harus diisi");
    }

    try {
      isloading.value =true;

      var url = Uri.parse("https://mediadwi.com/api/latihan/login");
      var response = await http.post(
          url,
      body: {
            'username': emailController,
            'password': passwordController,
      },
      );

      isloading.value = false;

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        bool status = data['status'] ?? false;
        String message = data['message'] ?? "Login Gagal";

        onResult(status, message);
      } else {
        onResult(false, "terjadi kesalahan pada server");
      }
    } catch (e) {
      isloading.value = false;
      onResult(false, e.toString());
    }
  }
}