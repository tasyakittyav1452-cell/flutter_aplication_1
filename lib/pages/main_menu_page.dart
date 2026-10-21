import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/main_menu_controller.dart';
import 'package:flutter_application_1/menu/history_page.dart';
import 'package:flutter_application_1/menu/home_page.dart';
import 'package:flutter_application_1/menu/profile_page.dart';
import 'package:get/get.dart';

class MainMenuPage extends StatelessWidget {
  MainMenuPage({super.key});

  final menucontroller = Get.put(MainMenuController());
  //halaman menu menu apa aja
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: IndexedStack(index: menucontroller.selectedIndex.value,
        children: menucontroller.listPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: menucontroller.selectedIndex.value,
          onTap: menucontroller.changePage,
          items: [BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.history),
          label: "history",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile")
          ],
      ),
    ),
    );
  }
}
