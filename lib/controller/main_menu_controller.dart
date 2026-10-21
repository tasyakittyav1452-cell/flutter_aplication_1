import 'package:flutter_application_1/menu/history_page.dart';
import 'package:flutter_application_1/menu/home_page.dart';
import 'package:flutter_application_1/menu/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMenuController extends GetxController{

  // mengatur perpindahan menu nya
  final RxInt selectedIndex = 0.obs; // digunakan di UI tidak boleh hanya int index ke berapa dan menu yang mana

  void changePage(int index) {
    selectedIndex.value = index; // sebagai tanda di main menunya seperti itu ada di menu apa gitu

  }

  List<Widget> listPages = [HomePage(), HistoryPage(), ProfilePage()];
}