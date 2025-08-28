import 'package:app/Features/details/Persention/data/models/dateils_model.dart';
import 'package:app/core/Errors/ErrorModel.dart';
import 'package:app/core/Errors/execption.dart';
import 'package:app/core/network/APi_consumer.dart';
import 'package:app/core/network/endpoints.dart';
import 'package:dartz/dartz.dart';

class DetailsRepo {
  DetailsRepo(this.api);
  ApiConsumer api;
  Future<Either<ErrorModel, ProductDetails>> detialsProduct({id}) async {
    try {
      final response = await api.get(Endpoints.Details(id));
      print(' detilas res$response');
      final productModel = ProductDetails.fromJson(response);

      return Right(productModel);
    } on AppException catch (e) {
      return left(e.errModel);
    }
  }
}
