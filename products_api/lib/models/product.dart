import 'dart:async';

import 'package:products_api/models/rating.dart';

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;
  final bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    this.isFavorite = false
    });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      title: json['title'] as String,
      price: (json['price'] is int)
          ? (json['price'] as int).toDouble()
          : json['price'] as double,
      description: json['description'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
      rating: Rating.fromJson(json['rating'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating.toJson(),
    };
  }

  static List<Product> productsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Product.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Product {id: $id, title: $title, price: $price, description: $description, category: $category, image: $image, rating: $rating}';
  }
}
