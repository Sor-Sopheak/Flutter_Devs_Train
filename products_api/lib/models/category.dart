class Category {
  final String name;

  Category({
    required this.name,
  });

  factory Category.fromString(String name) {
    return Category(name: name);
  }

  @override
  String toString() {
    return name;
  }

  static List<Category> categoriesFromList(List<String> names) {
    return names.map((name) => Category.fromString(name)).toList();
  }

  static List<String> categoriesToList(List<Category> categories) {
    return categories.map((category) => category.name).toList();
  }
}
