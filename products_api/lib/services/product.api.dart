import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/product.dart';

class ProductAPI {
  static Future<List<Product>> fetchProduct() async {
    final productResponse =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    try {
      if (productResponse.statusCode == 200) {
        List data = jsonDecode(productResponse.body);
        return Product.productsFromSnapshot(data);
      } else {
        throw Exception('Failed to load all products');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }

  static Future<List<Product>> getProductsByCategory(String category) async {
    final productResponse = await http
        .get(Uri.parse('https://fakestoreapi.com/products/category/$category'));
    try {
      if (productResponse.statusCode == 200) {
        List data = jsonDecode(productResponse.body);
        return Product.productsFromSnapshot(data);
      } else {
        throw Exception('Failed to load all product by category');
      }
    } catch (e) {
      throw Exception('Error fetching product by category: $e');
    }
  }

  static Future<Product> getOneProduct(int id) async {
    final productResponse =
        await http.get(Uri.parse('https://fakestoreapi.com/products/1'));
    try {
      if (productResponse.statusCode == 200) {
        dynamic data = jsonDecode(productResponse.body);
        return Product.fromJson(data);
      } else {
        throw Exception('Failed to load a product');
      }
    } catch (e) {
      throw Exception('Error fetching a product: $e');
    }
  }

  static Future<List<Product>> getLimitProduct(int limit) async {
    final productResponse =
        await http.get(Uri.parse('https://fakestoreapi.com/products?limit=$limit'));
    try {
      if (productResponse.statusCode == 200) {
        List data = jsonDecode(productResponse.body);
        return Product.productsFromSnapshot(data);
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error fetching product by category: $e');
    }
  }
  
}
