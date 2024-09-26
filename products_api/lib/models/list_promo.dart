import 'promo.dart';

class ListPromo {
  List<Promo> listPromo;
  ListPromo({required this.listPromo});

  factory ListPromo.fromJson(Map<String, dynamic> json) {
    return ListPromo(
        listPromo: List<Promo>.from(
      json['list_promo'].map(
        (x) => Promo.fromJson(x),
      ),
    ));
  }

  static Map<String, dynamic> getJsonData() {
    return {
      "list_promo": [
        {"id": 1, "code": "SUMMER20", "discount": 20.0},
        {"id": 2, "code": "FALL15", "discount": 15.0},
        {"id": 3, "code": "WINTER30", "discount": 30.0},
        {"id": 4, "code": "SPRING25", "discount": 25.0},
        {"id": 5, "code": "WELCOME10", "discount": 10.0}
      ]
    };
  }
}
