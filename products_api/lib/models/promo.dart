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
}
