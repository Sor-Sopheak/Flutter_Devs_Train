import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  void addToFav(int index, List<Map<String, dynamic>> data) {
    data[index]['isFavorite'] = true;
    final result =
        data.where((element) => element['isFavorite'] == true).toList();
    // state = [...result];
  }
}
