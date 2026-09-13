class AuthLoginModel {
  final String email;
  final String password;

  AuthLoginModel({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}

class VerifyLoginModel {
  final int userId;
  final int code;

  VerifyLoginModel({required this.userId, required this.code});

  Map<String, dynamic> toJson() {
    return {'user_id': userId, 'code': code};
  }
}

class AuthTokenModel {
  final String access;
  final String refresh;

  AuthTokenModel({required this.access, required this.refresh});

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) {
    return AuthTokenModel(access: json['access'], refresh: json['refresh']);
  }
}
