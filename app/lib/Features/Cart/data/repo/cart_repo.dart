import 'package:app/Features/Auth/data/Model/signup_model.dart';
import 'package:app/Features/Home/data/models/all_product_model.dart';
import 'package:app/core/Errors/ErrorModel.dart';
import 'package:app/core/Errors/execption.dart';
import 'package:app/core/network/APi_consumer.dart';
import 'package:app/core/network/endpoints.dart';
import 'package:dartz/dartz.dart';

class CartRepo {
  CartRepo(this.api);
  ApiConsumer api;
  Future<Either<ErrorModel, ProductList>> getCart({name}) async {
    try {
      final response = await api.get(Endpoints.getCArt);

      final productModel = ProductList.fromJson(response);

      return Right(productModel);
    } on AppException catch (e) {
      return left(e.errModel);
    }
  }

  Future<Either<ErrorModel, String>> deleteCart({favid}) async {
    try {
      final response = await api.delete(
        Endpoints.deleteCart,
        data: {ApiKeys.favProductId: favid},
      );
      final favPost = Signupmodel.fromJson(response);
      return Right(ApiKeys.ErrorMessage);
    } on AppException catch (e) {
      return left(e.errModel);
    }
  }

  Future<Either<ErrorModel, Signupmodel>> AddCart({cartid}) async {
    try {
      final response = await api.post(
        Endpoints.addCart,
        data: {ApiKeys.favProductId: cartid},
      );
      final favPost = Signupmodel.fromJson(response);
      return Right(favPost);
    } on AppException catch (e) {
      return left(e.errModel);
    }
  }
}
