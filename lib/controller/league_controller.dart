import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/team_model.dart'; // Sesuaikan dengan nama project kamu

class LeagueController extends GetxController {
  // FUNGSI: Variabel reaktif untuk menampung daftar klub sepak bola
  var teamList = <Team>[].obs;

  // FUNGSI: Indikator status loading saat mengambil data dari internet
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTeams(); // Langsung ambil data saat controller dipanggil
  }

  // FUNGSI: Melakukan HTTP GET Request ke Public API TheSportsDB
  void fetchTeams() async {
    try {
      isLoading.value = true;
      final url = Uri.parse(
          "https://www.thesportsdb.com/api/v1/json/123/search_all_teams.php?l=English%20Premier%20League");

      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Parsing data JSON menggunakan model yang sudah disediakan soal
        var result = premierLeagueModelFromJson(response.body);
        teamList.value = result.teams;
      } else {
        Get.snackbar("Gagal", "Gagal memuat data dari server");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false; // Matikan loading baik berhasil maupun gagal
    }
  }
}