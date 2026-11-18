import 'dart:convert';
//Mengimpor library dart:convert
//Fungsinya untuk mengola data JSON menjadi objek Dart
// dan sebaliknya

// Fungsi untuk mengubah JSON berbentuk String menjadi List ProductModel
List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str));

// class digunakan untuk membuat cetakan atau blueprint objek ProductModel
// setiap produk nantinya memiliki data seperti id,nama,harga,dan lainnya
class ProductModel {

  //final digunakan agar nilai variabel tidak bisa diubah
  //setelah diberikan nilai
  final int id;             // menyimpan ID produk ( berupa angka )
  final String name;        // menyimpan nama produk
  final String price;       // menyimpan harga produk
  final String image;       // menyimpan alamat atau URL gambar produk
  final String storeName;   // menyimpan nama toko
  final String rating;      // menyimpan nilai rating produk
  final String description; // menyimpan deskripsi produk

  // constructor digunakan untuk membuat objek ProductModel
  // required berarti semua data wajib diisi ketika objek dibuat
  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.storeName,
    required this.rating,
    required this.description,
  });

}