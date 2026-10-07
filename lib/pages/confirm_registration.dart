import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import controller kamu di sini jika pakai GetxController

class ConfirmRegistrationPage extends StatelessWidget {
  const ConfirmRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil data arguments yang dikirim dari halaman registrasi
    final Map<String, dynamic> data = Get.arguments ?? {};

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.cyanAccent.withOpacity(0.8),
              Colors.blue.withOpacity(0.6),
              Colors.cyan.withOpacity(0.9),
            ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.cyanAccent.withOpacity(0.5),
                  blurRadius: 10.0,
                  spreadRadius: 2.0
              ),
            ],
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withOpacity(0.5),
                width: 1.5,
              ),
            ),
          ),
          child: AppBar(
            title: const Text("Confirm Registration",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Data Konfirmasi Pendaftaran:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Bungkus menggunakan Card agar berbentuk kotak rapi
            Card(
              color: Colors.cyan[100],
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: Colors.cyan, width: 1.5)
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nama : ${data['nama'] ?? '-'}", style: const TextStyle(fontSize: 16)),
                    const Divider(height: 20),
                    Text("Jenis Kelamin : ${data['jenis_kelamin'] ?? '-'}", style: const TextStyle(fontSize: 16)),
                    const Divider(height: 20),
                    Text("Alamat : ${data['alamat'] ?? '-'}", style: const TextStyle(fontSize: 16)),
                    const Divider(height: 20),
                    Text("No WA : ${data['no_wa'] ?? '-'}", style: const TextStyle(fontSize: 16)),
                    const Divider(height: 20),
                    Text("Email : ${data['email'] ?? '-'}", style: const TextStyle(fontSize: 16)),
                    const Divider(height: 20),
                    Text("Hobi : ${data['hobi'] ?? '-'}", style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Tombol Kembali / Oke
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () => Get.back(),
                child: const Text("Kembali / Oke", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}