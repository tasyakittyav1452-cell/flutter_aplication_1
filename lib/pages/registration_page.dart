import 'package:flutter/services.dart';
import 'package:flutter_application_1/components/my_textfield.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController txtNama = TextEditingController();
  final TextEditingController txtAlamat = TextEditingController();
  final TextEditingController txtNoWa = TextEditingController();
  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtHobi = TextEditingController();

  String? selectedJenisKelamin;
  final List<String> listJenisKelamin = ['Laki-laki', 'Perempuan'];

  @override
  Widget build(BuildContext context) {
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
            title: const Text("Registration",
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
              "Lengkapi Data Diri Anda",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            MyTextfield(myHint: "Input Nama", txtController: txtNama, radius: 10),
            const SizedBox(height: 12),

            // Styled Dropdown untuk Jenis Kelamin
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedJenisKelamin,
                  hint: const Text("Pilih Jenis Kelamin"),
                  isExpanded: true,
                  items: listJenisKelamin.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedJenisKelamin = newValue;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 12),
            MyTextfield(myHint: "Input Alamat", txtController: txtAlamat, radius: 10),
            const SizedBox(height: 12),
            MyTextfield(myHint: "Input No WA", txtController: txtNoWa, radius: 10, keyboardType: TextInputType.number, inputFormatters: [FilteringTextInputFormatter.digitsOnly],),
            const SizedBox(height: 12),
            MyTextfield(myHint: "Input Email", txtController: txtEmail, radius: 10),
            const SizedBox(height: 12),
            MyTextfield(myHint: "Input Hobi", txtController: txtHobi, radius: 10),
            const SizedBox(height: 24),

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
                onPressed: () {
                  // Pindah tampilan dan mengirim semua data ke halaman konfirmasi
                  Get.toNamed(
                    Routes.confirmRegistration,
                    arguments: {
                      'nama': txtNama.text.toString(),
                      'jenis_kelamin': selectedJenisKelamin ?? '-',
                      'alamat': txtAlamat.text.toString(),
                      'no_wa': txtNoWa.text.toString(),
                      'email': txtEmail.text.toString(),
                      'hobi': txtHobi.text.toString(),
                    },
                  );
                },
                child: const Text("Send", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}