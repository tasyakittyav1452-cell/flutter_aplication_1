import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Catatan: Ini ibarat tombol utama halaman profil yang siap dipajang di aplikasi.
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  // Catatan: Controller ini bertindak sebagai "mesin penggerak" animasi
  // supaya warna latarnya bisa bergeser dan bernapas otomatis pelan-pelan.
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4), // Kecepatan pergeseran warnanya (4 detik)
    )..repeat(reverse: true); // Biar animasinya bolak-balik mulus terus
  }

  @override
  void dispose() {
    _controller.dispose(); // Membersihkan memori saat halamannya ditutup
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              // Catatan: RadialGradient ini berfungsi menciptakan efek cahaya merah sinematik
              // yang menyala di tengah latar hitam pekat ala video gothic gelap.
              gradient: RadialGradient(
                center: Alignment(_controller.value * 0.5 - 0.25, -0.5),
                radius: 1.2,
                colors: [
                  const Color(0xFF616161), // Warna abu cerah menyala
                  Colors.black,            // Warna hitam pekat sinematik
                  Colors.black87,
                ],
                stops: const [0.0, 0.6, 1.0],
              ),
            ),
            child: child,
          );
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Catatan: Kotak pembungkus foto profil untuk memberi garis pinggir
                // dan efek bayangan/cahaya neon abu di sekeliling fotonya.
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey, width: 4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.5),
                        blurRadius: 25, // Ukuran lembutnya kilauan cahaya merah
                        spreadRadius: 5, // Seberapa jauh cahaya merahnya menyebar
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    radius: 65,
                    // Catatan: Baris ini berfungsi mengambil dan menampilkan foto lokal
                    // (Gothic Café Girl) yang sudah kamu simpan di folder assets/images/ project.
                    backgroundImage: AssetImage('assets/images/gothic_girl.png'),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Filzah Zhaafirah",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "11R PPLG 3 - SMK Raden Umar Said Kudus",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 30),
                // Catatan: Tombol khusus untuk keluar atau menutup aplikasi secara instan.
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade700,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  onPressed: () {
                    SystemNavigator.pop(); // Perintah untuk menutup aplikasi
                  },
                  icon: const Icon(Icons.exit_to_app),
                  label: const Text("Keluar Aplikasi (Exit App)"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}