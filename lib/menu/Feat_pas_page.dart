import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/controller/league_controller.dart'; // Sesuaikan path controller

class FeatPasPage extends StatelessWidget {
  const FeatPasPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi LeagueController menggunakan Get.put
    final LeagueController controller = Get.put(LeagueController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Premier League Teams", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue.shade800,
      ),
      body: Obx(() {
        // Menampilkan indikator loading (CircularProgressIndicator) selama data diambil
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // Jika data kosong setelah loading selesai
        if (controller.teamList.isEmpty) {
          return const Center(child: Text("Tidak ada data klub tersedia."));
        }

        // Menampilkan daftar klub menggunakan ListView.builder
        return ListView.builder(
          itemCount: controller.teamList.length,
          itemBuilder: (context, index) {
            final team = controller.teamList[index];

            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                // Menampilkan Logo Klub (strBadge) menggunakan Image.network
                leading: team.strBadge.isNotEmpty
                    ? Image.network(
                  team.strBadge,
                  width: 50,
                  height: 50,
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.sports_soccer, size: 40),
                )
                    : const Icon(Icons.sports_soccer, size: 40),

                // Menampilkan Nama Klub (strTeam)
                title: Text(
                  team.strTeam,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),

                // Menampilkan Nama Stadion (strStadium)
                subtitle: Text("Stadion: ${team.strStadium}"),
              ),
            );
          },
        );
      }),
    );
  }
}