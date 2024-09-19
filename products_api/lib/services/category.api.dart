import 'dart:convert';

import 'package:products_api/models/category.dart';
import 'package:http/http.dart' as http;

class CategoryAPI {
  static Future<List<Category>> fetchCategory() async {
    final categoryResponse = await http
        .get(Uri.parse('https://fakestoreapi.com/products/categories'));
    try {
      if (categoryResponse.statusCode == 200) {
        List data = jsonDecode(categoryResponse.body);
        return Category.categoriesFromSnapshot(data);
      } else {
        throw Exception('Faied to load categories');
      }
    } catch (e) {
      throw Exception('Error fetching categories: $e');
    }
  }
}
