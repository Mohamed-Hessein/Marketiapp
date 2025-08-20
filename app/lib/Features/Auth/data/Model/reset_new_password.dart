import 'package:app/core/network/endpoints.dart';

class ActiveCodeResetModel {
  final String email;
  final int code;
  ActiveCodeResetModel({required this.email, required this.code});
  factory ActiveCodeResetModel.fromJson(Map<String, dynamic> json) {
    return ActiveCodeResetModel(
      email: json[ApiKeys.email] ?? '',
      code: json[ApiKeys.code],
    );
  }
}
