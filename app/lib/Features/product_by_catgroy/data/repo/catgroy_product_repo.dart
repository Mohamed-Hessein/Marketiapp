import 'package:app/Features/product_by_catgroy/data/model/catgroy_product_model.dart';
import 'package:app/core/Errors/ErrorModel.dart';
import 'package:app/core/Errors/execption.dart';
import 'package:app/core/network/APi_consumer.dart';
import 'package:app/core/network/endpoints.dart';
import 'package:dartz/dartz.dart';

class CatgroyProductRepo {
  CatgroyProductRepo(this.api);
  ApiConsumer api;

  Future<Either<ErrorModel, ProductListResponse>> CatgroyProduct({
    required final skip,
    required final limit,
    name,
  }) async {
    try {
      final response = await api.get(
        Endpoints.getNamed(name),
        queryParameters: {ApiKeys.limit: limit, ApiKeys.skip: skip},
      );

      final catgryProduct = ProductListResponse.fromJson(response);

      return Right(catgryProduct);
    } on AppException catch (e) {
      return left(e.errModel);
    }
  }
}
