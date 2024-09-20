class Promo {
  final int id;
  final String code;
  final double discount;

  Promo({
    required this.id,
    required this.code,
    required this.discount
  });

  factory Promo.fromJson(Map<String, dynamic> json) {
    return Promo(
      id: json['id'],
      code: json['code'],
      discount: json['discount'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'discount': discount,
    };
  }

  static String getJsonData() {
    return '''
    [
      {"id": 1, "code": "SUMMER20", "discount": 20.0},
      {"id": 2, "code": "FALL15", "discount": 15.0},
      {"id": 3, "code": "WINTER30", "discount": 30.0},
      {"id": 4, "code": "SPRING25", "discount": 25.0},
      {"id": 5, "code": "WELCOME10", "discount": 10.0}
    ]
    ''';
  }
}
