import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/components/my_textfield.dart';
import 'package:flutter_application_1/components/my_buttonClone.dart';
import '../components/main_textview.dart';
import '../controller/login_controller.dart';

class LoginCloneFixPage extends StatelessWidget {
  const LoginCloneFixPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Panggil LoginController menggunakan Get.put
    final controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: Colors.black,
      // AppBar transparan ditaruh dengan benar di properti appBar Scaffold
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
      ),
      // Body dibungkus Container dengan gradasi gothic cinematic (hitam-merah)
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color(0xFF3B0A0A), Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // LOGO & JUDUL (Nuansa merah/gothic cinematic)
              const Center(
                child: Icon(
                  Icons.local_fire_department,
                  size: 60,
                  color: Colors.redAccent,
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Gothic Cinematic Login.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // INPUT EMAIL
              const MainTextview(text: 'Email atau nama pengguna'),
              const SizedBox(height: 8),
              MyTextfield(
                myHint: "Email atau nama pengguna",
                txtController: controller.emailController,
                radius: 8.0,
              ),

              const SizedBox(height: 20),

              // INPUT PASSWORD
              const MainTextview(text: 'Kata sandi'),
              const SizedBox(height: 8),
              MyTextfield(
                myHint: "Kata sandi",
                txtController: controller.passwordController,
                radius: 8.0,
              ),

              const SizedBox(height: 30),

              // TOMBOL MASUK DENGAN KONDISI LOADING (OBX)
              Obx(() {
                if (controller.isloading.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.redAccent,
                    ),
                  );
                } else {
                  return SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.login();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade900,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'Masuk',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }
              }),

              const SizedBox(height: 20),

              // TOMBOL OPSIONAL
              Center(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.redAccent),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                  ),
                  child: const Text(
                    'Masuk tanpa kata sandi',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}