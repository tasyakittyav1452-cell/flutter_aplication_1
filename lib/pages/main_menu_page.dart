import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/main_menu_controller.dart';
import 'package:get/get.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key});

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> with SingleTickerProviderStateMixin {
  // Mengambil MainMenuController dari GetX.
  // Controller ini bertugas mengatur perpindahan halaman.
  final menucontroller = Get.put(MainMenuController());

  // Variabel untuk mengontrol animasi gradasi warna.
  // late berarti nilainya akan diisi sebelum digunakan.
  // Catatan: Penggerak animasi warna gradasi di AppBar dan Header Drawer
  late AnimationController _drawerAnimController;

  @override
  void initState() {
    super.initState();
    _drawerAnimController = AnimationController( // Membuat pengatur animasi dengan durasi 4 detik.
      vsync: this,
      duration: const Duration(seconds: 4), // Kecepatan animasi pergeseran warna
    )..repeat(reverse: true); // Animasi berjalan berulang dan bolak-balik.
  }

  @override // Fungsi untuk membersihkan animasi ketika halaman ditutup.
  void dispose() {
    _drawerAnimController.dispose();
    super.dispose();
  }

  @override // Fungsi untuk membangun tampilan halaman.
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(  // Obx membuat tampilan diperbarui ketika nilai Rx berubah.
      // ==== APPBAR ATAS ====
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight), // Mengatur tinggi AppBar sesuai tinggi toolbar standar Flutter.
        child: AnimatedBuilder( // Membuat tampilan AppBar dapat mengikuti perubahan animasi.
          animation: _drawerAnimController,
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient( // Membuat gradasi warna pada bagian AppBar.
                  colors: [Colors.black, Colors.purple.shade900, Colors.cyan.shade700, Colors.black],
                  stops: [0.0, _drawerAnimController.value, 0.8, 1.0],  // Mengatur posisi perubahan warna gradasi.
                  begin: Alignment.topLeft, // Mengatur arah gradasi.
                  end: Alignment.bottomRight,
                ),
              ),
              child: AppBar( // Membuat AppBar dengan latar belakang transparan.
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
      drawer: Drawer( // Drawer adalah menu samping yang bisa dibuka dari AppBar.
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Catatan: Header Drawer dibuat ukurannya lebih ringkas (tinggi 130)
            // supaya daftar pilihan menu di bawahnya otomatis tertarik lebih naik ke atas.
            SizedBox( // Membuat bagian header atau kepala Drawer.
              height: 130,
              child: AnimatedBuilder( // Membuat animasi gradasi warna pada header Drawer.
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
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20), // Mengatur jarak isi dari tepi Container.
                    alignment: Alignment.bottomLeft, // Mengatur posisi tulisan ke kiri bawah.
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
              onTap: () { // Fungsi ketika menu Home ditekan.
                Get.back(); // Menutup Drawer.
                menucontroller.changePage(0); // Membuka halaman Home.
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text("History"),
              onTap: () {
                Get.back(); // Menutup Drawer.
                menucontroller.changePage(1); // Membuka halaman History.
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {
                Get.back(); // Menutup Drawer.
                menucontroller.changePage(2); // Membuka halaman Profile.
              },
            ),
            const Divider(), // Membuat garis pembatas antar menu.
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.red),
              title: const Text("Exit App", style: TextStyle(color: Colors.red)),
              onTap: () {
                menucontroller.exitApp(); // Keluar dari aplikasi.
              },
            ),
          ],
        ),
      ),

      // Catatan: Menampilkan halaman sesuai dengan menu yang di-klik di Controller
      body: IndexedStack( // Menampilkan halaman berdasarkan index yang dipilih.
        index: menucontroller.selectedIndex.value,
        children: menucontroller.listPages,
      ),
    ));
  }
}