class LoginResponse {
  final String token;
  final String error;

  LoginResponse({required this.token, required this.error});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json["token"] ?? "",
      error: json["error"] != null ? json['error'] : ""
    );
  }
}

class LoginRequest {
  String? username;
  String? password;

  LoginRequest({this.username, this.password});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'username': username?.trim(),
      'password': password?.trim()
    };

    return map;
  }
}
