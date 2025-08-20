import 'package:dio/dio.dart';
import 'package:app/core/Errors/ErrorModel.dart';

abstract class AppException implements Exception {
  final ErrorModel errModel;
  const AppException(this.errModel);
}

class ServerException extends AppException {
  ServerException(super.errModel);
}

class NetworkException extends AppException {
  NetworkException(super.errModel);
}

class CacheException extends AppException {
  CacheException(super.errModel);
}

class NotFoundException extends CacheException {
  NotFoundException(super.errModel);
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw ServerException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ServerException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw ServerException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.cancel:
      throw ServerException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      throw ServerException(ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      throw ServerException(ErrorModel.fromJson(e.response!.data));

    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400:
          throw ServerException(ErrorModel.fromJson(e.response!.data));
        case 401:
          throw ServerException(ErrorModel.fromJson(e.response!.data));
        case 403:
          throw ServerException(ErrorModel.fromJson(e.response!.data));
        case 404:
          throw ServerException(ErrorModel.fromJson(e.response!.data));
        case 409:
          throw ServerException(ErrorModel.fromJson(e.response!.data));
        case 422:
          throw ServerException(ErrorModel.fromJson(e.response!.data));
        case 504:
          throw ServerException(ErrorModel.fromJson(e.response!.data));
      }
  }
}

// class Execption2 implements Exception {
//   final ErrorModelProduct errorModel;

//   Execption2({required this.errorModel});
// }

// void HandelErrorProduct(DioException e) {
//   switch (e.type) {
//     case DioExceptionType.connectionTimeout:
//       // TODO: Handle this case.

//       throw Execption1(
//         errorModel: ErrorModel.fromJson(e.message as Map<String, dynamic>),
//       );

//     // TODO: Handle this case.

//     case DioExceptionType.receiveTimeout:
//       // TODO: Handle this case.
//       throw Execption2(
//         errorModel: ErrorModelProduct.fromJson(e.response!.data),
//       );
//     case DioExceptionType.badCertificate:
//       // TODO: Handle this case.
//       throw Execption2(
//         errorModel: ErrorModelProduct.fromJson(e.response!.data),
//       );
//     case DioExceptionType.cancel:
//       // TODO: Handle this case.
//       throw Execption2(
//         errorModel: ErrorModelProduct.fromJson(e.response!.data),
//       );
//     case DioExceptionType.connectionError:
//       // TODO: Handle this case.
//       throw Execption2(
//         errorModel: ErrorModelProduct.fromJson(e.response!.data),
//       );

//     case DioExceptionType.unknown:
//       // TODO: Handle this case.
//       throw Execption2(
//         errorModel: ErrorModelProduct.fromJson(e.response!.data),
//       );

//     case DioExceptionType.sendTimeout:
//       throw Execption2(
//         errorModel: ErrorModelProduct.fromJson(e.response!.data),
//       );
//     case DioExceptionType.badResponse:
//       switch (e.response!.statusCode) {
//         case 400:
//           throw Execption2(
//             errorModel: ErrorModelProduct.fromJson(e.response!.data),
//           );
//         case 401:
//           throw Execption2(
//             errorModel: ErrorModelProduct.fromJson(e.response!.data),
//           );
//         case 403:
//           throw Execption2(
//             errorModel: ErrorModelProduct.fromJson(e.response!.data),
//           );
//         case 404:
//           throw Execption2(
//             errorModel: ErrorModelProduct.fromJson(e.response!.data),
//           );
//         case 409:
//           throw Execption2(
//             errorModel: ErrorModelProduct.fromJson(e.response!.data),
//           );
//         case 422:
//           throw Execption2(
//             errorModel: ErrorModelProduct.fromJson(e.response!.data),
//           );
//         case 504:
//           throw Execption2(
//             errorModel: ErrorModelProduct.fromJson(e.response!.data),
//           );
//       }
//   }
// }
