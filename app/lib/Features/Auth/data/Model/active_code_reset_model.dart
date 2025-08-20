import 'package:app/core/network/endpoints.dart';

class ChangePasss {
  final String email;
  final String password;
  final String confrimpassword;
  ChangePasss({
    required this.email,
    required this.password,
    required this.confrimpassword,
  });
  factory ChangePasss.fromJson(Map<String, dynamic> json) {
    return ChangePasss(
      email: json[ApiKeys.email],
      password: json[ApiKeys.password],
      confrimpassword: json[ApiKeys.confrimPawword],
    );
  }
}
