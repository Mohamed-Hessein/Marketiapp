import 'dart:async' show Future;
import 'dart:core';

import 'package:app/Features/Home/data/brand_product_model.dart';
import 'package:app/Features/Home/data/brands_models.dart';
import 'package:app/Features/Home/data/catgory_model.dart';
import 'package:app/Features/Home/data/catgroy_product_model.dart';
import 'package:app/Features/Home/data/dateils_model.dart';
import 'package:app/Features/Home/data/get_favprite_model.dart';
import 'package:app/Features/Home/data/serachModel.dart';
import 'package:app/core/function/upLoade_image.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:app/Features/Auth/data/Model/signin_model.dart';
import 'package:app/Features/Auth/data/Model/signup_model.dart';
import 'package:app/Features/Home/data/all_product_model.dart';
import 'package:app/Features/Home/data/brands_model.dart';
import 'package:app/Features/Home/data/product_catgory_model.dart';
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

  Future<Either<ErrorModel, ProductList>> getProduct(id) async {
    try {
      final response = await api.get(Endpoints.getproduct);

      final productModel = ProductList.fromJson(response);
      id = productModel.list.first.id;
      return Right(productModel);
    } on AppException catch (e) {
      return left(e.errModel);
    }
  }

  Future<Either<String, List<CategoriesModel>>> getProductCatgory({id}) async {
    try {
      final response = await api.get(Endpoints.catgroyNames);

      final productModel = CategoriesModel.fromJson(response);
      id = productModel.name;
      List<CategoriesModel> catgorylist = [];
      if (response['list'] != null) {
        for (var catgroy in response['list']) {
          catgorylist.add(CategoriesModel.fromJson(catgroy));
        }
      }
      return Right(catgorylist);
    } on AppException catch (e) {
      return left(e.errModel.errMessage);
    }
  }

  Future<Either<ErrorModel, List<BrandsModel>>> getProductBrands() async {
    try {
      final response = await api.get(Endpoints.getAllBrands);

      final productModel = BrandsModel.fromJson(response);
      List<BrandsModel> bramdList = [];
      if (response['list'] != null) {
        for (var brand in response['list']) {
          bramdList.add(BrandsModel.fromJson(brand));
        }
      }
      return Right(bramdList);
    } on AppException catch (e) {
      return left(e.errModel);
    }
  }

  Future<Either<ErrorModel, ProductListBrands>> getBrands() async {
    try {
      final response = await api.get(Endpoints.getproduct);

      final productModel = ProductListBrands.fromJson(response);

      return Right(productModel);
    } on AppException catch (e) {
      return left(e.errModel);
    }
  }

  Future<Either<ErrorModel, ProductList>> getAllProduct({
    required final skip,
    required final limit,
  }) async {
    try {
      final response = await api.get(
        Endpoints.getALLproduct,
        queryParameters: {ApiKeys.limit: limit, ApiKeys.skip: skip},
      );

      final productModel = ProductList.fromJson(response);

      return Right(productModel);
    } on AppException catch (e) {
      return left(e.errModel);
    }
  }

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
      final productModel = SearchModel.fromJson(response);

      return Right(productModel);
    } on AppException catch (e) {
      return left(e.errModel);
    }
  }

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

      final productModel = ProductListResponse.fromJson(response);

      return Right(productModel);
    } on AppException catch (e) {
      return left(e.errModel);
    }
  }

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

      final productModel = BrandProductModel.fromJson(response);

      return Right(productModel);
    } on AppException catch (e) {
      return left(e.errModel);
    }
  }

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

      final productModel = FavProductListResponse.fromJson(response);

      return Right(productModel);
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
      final favPost = Signupmodel.fromJson(response);
      return Right(ApiKeys.ErrorMessage);
    } on AppException catch (e) {
      return left(e.errModel);
    }
  }

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
