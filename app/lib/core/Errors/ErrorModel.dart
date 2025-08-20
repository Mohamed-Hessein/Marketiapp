import 'package:app/core/network/endpoints.dart';

class ErrorModel {
  final dynamic status;
  final String errMessage;

  ErrorModel({required this.status, required this.errMessage});
  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModel(
      status: jsonData[ApiKeys.status] ?? '',
      errMessage: jsonData[ApiKeys.ErrorMessage] ?? '',
    );
  }
}

class ErrorModelProduct {
  final bool sucesss;
  final dynamic status;
  final String errMessage;

  ErrorModelProduct({
    required this.sucesss,
    required this.status,
    required this.errMessage,
  });
  factory ErrorModelProduct.fromJson(Map<String, dynamic> jsonData) {
    return ErrorModelProduct(
      sucesss: jsonData['success'] ?? '',
      status: jsonData[ApiKeys.status] ?? '',
      errMessage: jsonData[ApiKeys.ErrorMessage] ?? '',
    );
  }
}
