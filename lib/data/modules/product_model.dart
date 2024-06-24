import 'package:task2/domain/entites/product.dart';

class ProductModel extends Product {
  ProductModel(
      {required super.description,
      required super.image,
      required super.id,
      required super.price,
      required super.title});
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      image: json['image']);
}
