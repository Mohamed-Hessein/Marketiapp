import 'package:dio/dio.dart';
import 'package:app/core/network/cachehelper.dart';
import 'package:app/core/network/endpoints.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = CacheHelper().getDataString(key: ApiKeys.token);
    options.headers['Content-Type'] = 'application/json';
    options.headers[ApiKeys.token] = token != null ? 'Bearer $token' : null;
    // "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4NDJmM2M2ZGZiNDAwNjRmMmNhZGRkMiIsImlhdCI6MTc0OTI5NDQyOH0.dB3U4izjI_kdNqPzv_A86OdRAgI29WM4nmJIqGQdE9k";
    super.onRequest(options, handler);
  }
}






// class ApiInterceptros extends Interceptor {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     // TODO: implement onRequest
//     options.headers[ApiKeys.token] =
//         CacheHelper().getData(key: ApiKeys.token) != null
//         ? "${CacheHelper().getData(key: ApiKeys.token)}"
//         : null;
//     super.onRequest(options, handler);
//   }
// }