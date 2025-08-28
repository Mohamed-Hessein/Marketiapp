import 'package:app/Features/Search/data/model/serachModel.dart';
import 'package:app/core/Errors/ErrorModel.dart';
import 'package:app/core/Errors/execption.dart';
import 'package:app/core/network/APi_consumer.dart';
import 'package:app/core/network/endpoints.dart';
import 'package:dartz/dartz.dart';

class SearchRepo {
  SearchRepo(this.api);
  ApiConsumer api;
  Future<Either<ErrorModel, SearchModel>> SearchPost({
    search,
    skip,
    limit,
  }) async {
    try {
      final response = await api.post(
        Endpoints.search,
        data: {
          ApiKeys.serach: search,
          ApiKeys.limit: limit,
          ApiKeys.skip: skip,
        },
      );
      print(' serach res$response');
      final searchResponse = SearchModel.fromJson(response);

      return Right(searchResponse);
    } on AppException catch (e) {
      return left(e.errModel);
    }
  }
}
