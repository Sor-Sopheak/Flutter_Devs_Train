import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:products_api/models/product.dart';

final listFavoriteProvider = StateNotifierProvider<FavoriteController, List<Product>>((ref) {
  return FavoriteController();
});

class FavoriteController extends StateNotifier<List<Product>> {
  FavoriteController() : super([]);

  void addToFavorite(int index, List<Product> data) {
    data[index] = Product(
      id: data[index].id,
      title: data[index].title,
      price: data[index].price,
      description: data[index].description,
      category: data[index].category,
      image: data[index].image,
      rating: data[index].rating,
      isFavorite: true, // Mark as favorite
    );

    if (!state.contains(data[index])) {
      state = [...state, data[index]]; // Add to favorites
    }
  }

  void removeFromFavorite(int id) {
    state = state.where((item) => item.id != id).toList(); // Remove from favorites
  }
}
