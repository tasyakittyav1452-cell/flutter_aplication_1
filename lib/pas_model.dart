import 'dart:convert';

PasModel pasModelFromJson(String str) => PasModel.fromJson(json.decode(str));
class PasModel {
  final bool status;
  final String message;

  PasModel({
    required this.status,
    required this.message,
  });

  factory PasModel.fromJson(Map<String, dynamic> json) => PasModel(
    status: json["status"],
    message: json["message"],
  );
}