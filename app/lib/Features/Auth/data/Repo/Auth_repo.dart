import 'dart:async' show Future;
import 'dart:core';

import 'package:app/Features/Home/data/models/brand_product_model.dart';
import 'package:app/Features/Home/data/models/brands_by_names_models.dart';
import 'package:app/Features/Home/data/models/catgory_model.dart';
import 'package:app/Features/product_by_catgroy/data/model/catgroy_product_model.dart';
import 'package:app/Features/details/Persention/data/models/dateils_model.dart';
import 'package:app/Features/Favorite/data/model/get_favprite_model.dart';
import 'package:app/Features/Search/data/model/serachModel.dart';
import 'package:app/core/function/upLoade_image.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:app/Features/Auth/data/Model/signin_model.dart';
import 'package:app/Features/Auth/data/Model/signup_model.dart';
import 'package:app/Features/Home/data/models/all_product_model.dart';
import 'package:app/Features/Home/data/models/brands_model.dart';
import 'package:app/Features/Home/data/models/product_catgory_model.dart';
import 'package:app/core/Errors/ErrorModel.dart';
import 'package:app/core/Errors/execption.dart';
import 'package:app/core/network/APi_consumer.dart';
import 'package:app/core/network/cachehelper.dart';
import 'package:app/core/network/endpoints.dart';

class AuthRepo {
  Signupmodel? signupmodel;
  LoginResponse? loginResponse;
  ApiConsumer api;

  AuthRepo(this.api);
  Future<Either<String, LoginResponse>> signIn({
    required password,
    required email,
  }) async {
    try {
      final response = await api.post(
        Endpoints.signIn,
        data: {ApiKeys.email: email, ApiKeys.password: password},
        isFromData: false,
      );
      final loginResponse = LoginResponse.fromJson(response);
      // final Decoder = JwtDecoder.decode(loginResponse!.token);
      CacheHelper().saveData(key: ApiKeys.token, value: loginResponse.token);
      // CacheHelper().saveData(key: ApiKeys.id, value: [ApiKeys.id]);
      return Right(loginResponse);
    } on AppException catch (e) {
      return left(e.errModel.errMessage);
    }
  }

  Future<Either<String, Signupmodel>> signUp({
    required email,
    required phone,
    required password,
    required name,
    required confrimPassword,
  }) async {
    try {
      final response = await api.post(
        Endpoints.signup,
        data: {
          ApiKeys.name: name,
          ApiKeys.email: email,
          ApiKeys.Phone: phone,
          ApiKeys.password: password,
          ApiKeys.confrimPawword: confrimPassword,
        },
      );
      final signup = Signupmodel.fromJson(response);
      return Right(signup);
    } on AppException catch (e) {
      return left(e.errModel.errMessage);
    }
  }

  Future<Either<String, Signupmodel>> resetCode({required email}) async {
    try {
      final response = await api.post(
        Endpoints.resetCode,
        isFromData: false,
        data: {ApiKeys.email: email},
      );
      final reset = Signupmodel.fromJson(response);
      return Right(reset);
    } on AppException catch (e) {
      return left(e.errModel.errMessage);
    }
  }

  Future<Either<String, Signupmodel>> enterCode({
    required email,
    required code,
  }) async {
    try {
      final response = await api.post(
        Endpoints.activeCode,
        data: {ApiKeys.email: email, ApiKeys.code: code},
      );
      final getCode = Signupmodel.fromJson(response);
      return Right(getCode);
    } on AppException catch (e) {
      return left(e.errModel.errMessage);
    }
  }

  Future<Either<String, Signupmodel>> changePass({
    required email,
    required password,
    required confrimpass,
  }) async {
    try {
      final response = await api.post(
        Endpoints.changePass,
        data: {
          ApiKeys.email: email,
          ApiKeys.password: password,
          ApiKeys.confrimPawword: confrimpass,
        },
      );
      final changepass = Signupmodel.fromJson(response);
      return Right(changepass);
    } on AppException catch (e) {
      return left(e.errModel.errMessage);
    }
  }

  Logou() async {
    await CacheHelper().clearData(key: ApiKeys.token);
  }

  Future getProductCatgory({required id}) async {}
}
