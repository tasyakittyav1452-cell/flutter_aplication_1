import 'dart:convert';
import 'package:flutter_application_1/login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var isloading = false.obs;

  var loginModel = Rxn<LoginModel>();

  //ubah tipe dungsi agar bisa memberikan laporan status ke page
  void login() async{
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar("error", "username dan password harus terisi");
    } else {
      try {
        isloading.value = true;

        final url = Uri.parse("https://mediadwi.com/api/latihan/login");
        final response = await http.post(
          url,
          body: {
            'username': emailController.text,
            'password': passwordController.text,
          },
        );
        isloading.value = false;

        if (response.statusCode == 200) {
          loginModel.value = loginModelFromJson ( response.body);

          if (loginModel.value?.status == true) {
            Get.snackbar("berhasil", loginModel.value!.message.toString());
          } else {
            Get.snackbar("gagal", loginModel.value!.message.toString());
          }
        }else {
          Get.snackbar("gagal", "cek internet connection");
        }
      }catch (e) {
        isloading.value = false;
        Get.snackbar("gagal", e.toString());
        print("error nya " + e.toString());
      }
    }
  }
}