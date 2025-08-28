import 'package:app/Features/Auth/data/Model/signup_model.dart';
import 'package:app/Features/Favorite/data/model/get_favprite_model.dart';
import 'package:app/core/Errors/ErrorModel.dart';
import 'package:app/core/Errors/execption.dart';
import 'package:app/core/network/APi_consumer.dart';
import 'package:app/core/network/endpoints.dart';
import 'package:dartz/dartz.dart';

class FavroiteRepo {
  FavroiteRepo(this.api);
  ApiConsumer api;
  Future<Either<ErrorModel, String>> favoritePost({favid}) async {
    try {
      final response = await api.post(
        Endpoints.favPost,
        data: {ApiKeys.favProductId: favid},
      );
      final favPost = Signupmodel.fromJson(response);
      return Right(ApiKeys.ErrorMessage);
    } on AppException catch (e) {
      return left(e.errModel);
    }
  }

  Future<Either<ErrorModel, FavProductListResponse>> getFavorite({name}) async {
    try {
      final response = await api.get(Endpoints.getfav);

      final getFavResponse = FavProductListResponse.fromJson(response);

      return Right(getFavResponse);
    } on AppException catch (e) {
      return left(e.errModel);
    }
  }

  Future<Either<ErrorModel, String>> deletfavorite({favid}) async {
    try {
      final response = await api.delete(
        Endpoints.deletefav,
        data: {ApiKeys.favProductId: favid},
      );
      final favdelete = Signupmodel.fromJson(response);
      return Right(ApiKeys.ErrorMessage);
    } on AppException catch (e) {
      return left(e.errModel);
    }
  }
}
