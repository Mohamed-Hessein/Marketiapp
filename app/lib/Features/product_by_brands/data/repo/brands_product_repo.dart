import 'package:app/Features/Home/data/models/brand_product_model.dart';
import 'package:app/core/Errors/ErrorModel.dart';
import 'package:app/core/Errors/execption.dart';
import 'package:app/core/network/APi_consumer.dart';
import 'package:app/core/network/endpoints.dart';
import 'package:dartz/dartz.dart';

class BrandsProductRepo {
  BrandsProductRepo(this.api);
  ApiConsumer api;
  Future<Either<ErrorModel, BrandProductModel>> BrandProduct({
    required final skip,
    required final limit,
    name,
  }) async {
    try {
      final response = await api.get(
        Endpoints.getNamedBrand(name),
        queryParameters: {ApiKeys.limit: limit, ApiKeys.skip: skip},
      );

      final producrBrands = BrandProductModel.fromJson(response);

      return Right(producrBrands);
    } on AppException catch (e) {
      return left(e.errModel);
    }
  }
}
