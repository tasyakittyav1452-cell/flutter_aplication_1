// To parse this JSON data, do
// final premierLeagueModel = premierLeagueModelFromJson(jsonString);
import 'dart:convert';
PremierLeagueModel premierLeagueModelFromJson(String str) =>
    PremierLeagueModel.fromJson(json.decode(str));
String premierLeagueModelToJson(PremierLeagueModel data) =>
    json.encode(data.toJson());
class PremierLeagueModel {
  List<Team> teams;
  PremierLeagueModel({
    required this.teams,
  });
  factory PremierLeagueModel.fromJson(Map<String, dynamic> json) =>
      PremierLeagueModel(
        teams: List<Team>.from(json["teams"].map((x) => Team.fromJson(x))),
      );
  Map<String, dynamic> toJson() => {
    "teams": List<dynamic>.from(teams.map((x) => x.toJson())),
  };
}
class Team {
  String idTeam;
  String strTeam;
  String strStadium;
  String strBadge;
  String strDescriptionEn;
  Team({
    required this.idTeam,
    required this.strTeam,
    required this.strStadium,
    required this.strBadge,
    required this.strDescriptionEn,
  });
  factory Team.fromJson(Map<String, dynamic> json) => Team(
    idTeam: json["idTeam"] ?? "",
    strTeam: json["strTeam"] ?? "",
    strStadium: json["strStadium"] ?? "",
    strBadge: json["strBadge"] ?? "",
    strDescriptionEn: json["strDescriptionEn"] ?? "",
  );
  Map<String, dynamic> toJson() => {
    "idTeam": idTeam,
    "strTeam": strTeam,
    "strStadium": strStadium,
    "strBadge": strBadge,
    "strDescriptionEn": strDescriptionEn,
  };
}