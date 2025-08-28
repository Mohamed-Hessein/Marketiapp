import 'package:app/Features/Auth/data/Model/signup_model.dart';
import 'package:app/Features/Home/data/models/all_product_model.dart';
import 'package:app/Features/Profile/data/models/getProfile_model.dart';
import 'package:app/core/Errors/ErrorModel.dart';
import 'package:app/core/Errors/execption.dart';
import 'package:app/core/function/upLoade_image.dart';
import 'package:app/core/network/APi_consumer.dart';
import 'package:app/core/network/endpoints.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

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

  Future<Either<ErrorModel, Signupmodel>> uploadImage(XFile image) async {
    try {
      final file = await uploadImageToAPI(image);
      final fromData = FormData.fromMap({"file": file});
      final response = await api.post(Endpoints.upLoadImage, data: fromData);
      final imagePost = Signupmodel.fromJson(response);
      return Right(imagePost);
    } on AppException catch (e) {
      return left(e.errModel);
    }
  }
}
