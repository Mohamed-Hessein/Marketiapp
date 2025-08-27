import 'package:app/Features/Home/data/all_product_model.dart';
import 'package:app/Features/Profile/data/models/getProfile_model.dart';
import 'package:app/core/Errors/ErrorModel.dart';
import 'package:app/core/Errors/execption.dart';
import 'package:app/core/network/APi_consumer.dart';
import 'package:app/core/network/endpoints.dart';
import 'package:dartz/dartz.dart';

class ProfileRepo {
  ProfileRepo(this.api);
  ApiConsumer api;
  Future<Either<ErrorModel, Message>> getProfileData() async {
    try {
      final response = await api.get(Endpoints.getUserPRofile);

      final profileModel = Message.fromJson(response['message']);

      return Right(profileModel);
    } on AppException catch (e) {
      return left(e.errModel);
    }
  }
}
