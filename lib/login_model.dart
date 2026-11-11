import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

class LoginModel {
  final bool status;
  final String message;
  final String token;

LoginModel({
  required this.status,
  required this.message,
  required this.token,
});

factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
  status: json["status"],
  message: json["message"],
  token: json["token"],
  );
}