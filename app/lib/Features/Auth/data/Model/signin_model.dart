import 'package:app/core/network/endpoints.dart';

class User {
  final String name;
  final String phone;
  final String email;
  final String role;
  final String image;

  User({
    required this.name,
    required this.phone,
    required this.email,
    required this.role,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'role': role,
      'image': image,
    };
  }
}

class LoginResponse {
  final String message;
  final String token;
  final User user;

  LoginResponse({
    required this.message,
    required this.token,
    required this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json['message'] ?? '',
      token: json[ApiKeys.token] ?? '',
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'token': token, 'user': user.toJson()};
  }
}

class Signinmodel {
  final String email;
  final String password;

  Signinmodel({required this.email, required this.password});
  factory Signinmodel.fromJson(Map<String, dynamic> json) {
    return Signinmodel(
      email: json[ApiKeys.email] ?? '',
      password: json[ApiKeys.password] ?? '',
    );
  }
}
