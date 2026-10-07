import 'package:flutter_application_1/pages/confirm_registration.dart';
import 'package:flutter_application_1/pages/registration_page.dart';
import 'package:flutter_application_1/pages/list_produk_pages.dart';
import 'package:flutter_application_1/pages/detail_produk_page.dart';
import 'package:get/get.dart';

class Routes {
  static const String registration = "/registration";
  static const String confirmRegistration = "/confirmRegistration";
  static const String listProduk = "/listProduk";
  static const String detailProduk = "/detailProduk";

  static final myPages = [
    GetPage(name: registration, page: () => const RegistrationPage()),
    GetPage(name: confirmRegistration, page: () => const ConfirmRegistrationPage()),
    GetPage(name: listProduk, page: () => ListProdukPages()),
    GetPage(name: detailProduk, page: () => const DetailProdukPage())
  ];
}