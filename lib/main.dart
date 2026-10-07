import 'package:flutter/material.dart';
import 'package:flutter_application_1/kalkulator_page2.dart';
import 'package:flutter_application_1/routes.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "BelajarFlutter PPLG 3",
      initialRoute: Routes.listProduk,
      getPages: Routes.myPages,
    );
  }
}