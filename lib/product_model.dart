import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str));

class ProductModel {
  final int id;
  final String name;
  final String price;
  final String image;
  final String storeName;
  final String rating;
  final String description;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.storeName,
    required this.rating,
    required this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    image: json["image"],
    storeName: json["store_name"],
    rating: json["rating"],
    description: json["description"],
  );

}