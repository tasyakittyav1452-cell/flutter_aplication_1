import 'package:flutter/services.dart';
import 'package:flutter_application_1/menu/history_page.dart';
import 'package:flutter_application_1/menu/home_page.dart';
import 'package:flutter_application_1/menu/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMenuController extends GetxController{

  // Mengatur perpindahan halaman pada menu utama.
  // RxInt digunakan agar perubahan nilai bisa terdeteksi oleh GetX.
  final RxInt selectedIndex = 0.obs; // digunakan di UI tidak boleh hanya int index ke berapa dan menu yang mana

  // Fungsi untuk mengganti halaman berdasarkan index yang dipilih.
  void changePage(int index) {
    // Mengubah index halaman yang sedang dipilih.
    // Contoh: 0 = Home, 1 = History, 2 = Profile.
    selectedIndex.value = index; // sebagai tanda di main menunya seperti itu ada di menu apa gitu

  }
// Menyimpan daftar halaman yang akan ditampilkan pada menu utama.
  List<Widget> listPages = [HomePage(), HistoryPage(), ProfilePage()];
  // Fungsi untuk keluar dari aplikasi.
  void exitApp() {
    SystemNavigator.pop();
  }
}