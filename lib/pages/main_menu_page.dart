import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/main_menu_controller.dart';
import 'package:get/get.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key});

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> with SingleTickerProviderStateMixin {
  // Catatan: Mengambil controller GetX yang bertugas mengatur alur halaman & menu
  final menucontroller = Get.put(MainMenuController());

  // Catatan: Penggerak animasi warna gradasi di AppBar dan Header Drawer
  late AnimationController _drawerAnimController;

  @override
  void initState() {
    super.initState();
    _drawerAnimController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4), // Kecepatan animasi pergeseran warna
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _drawerAnimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      // ==== APPBAR ATAS ====
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AnimatedBuilder(
          animation: _drawerAnimController,
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.purple.shade900, Colors.cyan.shade700, Colors.black],
                  stops: [0.0, _drawerAnimController.value, 0.8, 1.0],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: AppBar(
                title: const Text("Aplikasi Utama", style: TextStyle(color: Colors.white)),
                backgroundColor: Colors.transparent, // Biar gradasi di belakangnya kelihatan
                foregroundColor: Colors.white,
                elevation: 0,
              ),
            );
          },
        ),
      ),

      // ==== MENU DRAWER (POSISI MENU LEBIH NAIK & NEAT) ====
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Catatan: Header Drawer dibuat ukurannya lebih ringkas (tinggi 130)
            // supaya daftar pilihan menu di bawahnya otomatis tertarik lebih naik ke atas.
            SizedBox(
              height: 130,
              child: AnimatedBuilder(
                animation: _drawerAnimController,
                builder: (context, child) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black, Colors.purple.shade900, Colors.cyan.shade700],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      "Menu Drawer",
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
            ),

            // Catatan: Tombol-tombol navigasi di dalam Drawer yang terhubung ke Controller GetX
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Get.back(); // Tutup drawer
                menucontroller.changePage(0); // Pindah ke halaman Home
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text("History"),
              onTap: () {
                Get.back();
                menucontroller.changePage(1); // Pindah ke halaman History
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {
                Get.back();
                menucontroller.changePage(2); // Pindah ke halaman Profile
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.red),
              title: const Text("Exit App", style: TextStyle(color: Colors.red)),
              onTap: () {
                menucontroller.exitApp(); // Keluar aplikasi
              },
            ),
          ],
        ),
      ),

      // Catatan: Menampilkan halaman sesuai dengan menu yang di-klik di Controller
      body: IndexedStack(
        index: menucontroller.selectedIndex.value,
        children: menucontroller.listPages,
      ),
    ));
  }
}