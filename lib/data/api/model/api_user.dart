import 'package:myapp/domain/models/user.dart';

class ApiUser extends User {
  ApiUser({
    required login,
    required password,
  }) : super(
    login: login,
    password: password,
  );

  factory ApiUser.fromJson(Map<String, dynamic> json) {
    return ApiUser(
      login: json['id'] as String,
      password: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() =>
  {
     "login": login,
     "password": password,
  };
}