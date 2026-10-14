// FUNGSI: "Cetakan" data satu produk. semua produk dibuar dari class ini,
// jadi struktur datanya seragam ( nama, harga, dst ).

class ProdukModel {
  String namaproduk;
  String harga;
  String description;
  String image; //URL GAMBAR
  String reviews;
  String rating;
  String namaToko;

  // "required" = wajib diisi saat membuat ProdukModel
  ProdukModel({
    required this.namaproduk,
    required this.harga,
    required this.description,
    required this.image,
    required this.reviews,
    required this.rating,
    required this.namaToko,
  });
}