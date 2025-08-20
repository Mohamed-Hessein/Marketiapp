import 'package:app/core/network/endpoints.dart';

class Resetcodemode {
  final String email;

  Resetcodemode({required this.email});
  factory Resetcodemode.fromJson(Map<String, dynamic> json) {
    return Resetcodemode(email: json[ApiKeys.email]);
  }
}
