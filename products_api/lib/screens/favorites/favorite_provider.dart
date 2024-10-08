import 'package:flutter/material.dart';
import 'package:products_api/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProvider extends ChangeNotifier {
  List<int> _favoriteProductIds = [];

  FavoriteProvider() {
    _loadFavorites(); //Load favorites when the provider is created
  }

  void _loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _favoriteProductIds = prefs
      .getStringList('favoriteProductIds')
      ?.map((id) => int.parse(id))
      .toList() ?? [];

    notifyListeners();
  }

  //save favorite prodict ids to share prefrences
  void _saveFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('favoriteProductIds',
        _favoriteProductIds.map((id) => id.toString()).toList());
  }

  // adding or removing
  void toggleFav(int productId) {
    if (_favoriteProductIds.contains(productId)) {
      _favoriteProductIds.remove(productId); //remove from the favorite
    } else {
      _favoriteProductIds.add(productId);
    }
    _saveFavorites();
    notifyListeners();
  }

  bool isFavorite(int productId) {
    return _favoriteProductIds.contains(productId);
  }

  List<int> getListFavorite() {
    return _favoriteProductIds;
  }

  List<Product> getFavoriteProducts(List<Product> allProducts) {
    return allProducts
        .where((product) => _favoriteProductIds
        .contains(product.id))
        .toList();
  }

  void removeAFavorite(int productId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _favoriteProductIds
        .removeWhere((id) => id == productId); // remove from the list

    //save after remove
    prefs.setStringList('favoriteProductIds',
        _favoriteProductIds.map((id) => id.toString()).toList());

    //notify listeners that the favorite list has changed
    notifyListeners();
  }

  void clearFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('favoriteProductIds');
    _favoriteProductIds.clear();
    notifyListeners();
  }
}
