class Category {
  final String name;

  Category({
    required this.name,
  });

  factory Category.fromJson(dynamic json) {
    return Category(name: json);
  }

  @override
  String toString() {
    return name;
  }

  static List<Category> categoriesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Category.fromJson(data);
    }).toList();
  }
}
