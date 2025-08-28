import 'package:app/Features/Home/data/models/all_product_model.dart';
import 'package:app/Features/Home/data/models/brands_model.dart';
import 'package:app/Features/Home/data/models/brands_by_names_models.dart';
import 'package:app/Features/Home/data/models/catgory_model.dart';
import 'package:app/core/Errors/ErrorModel.dart';
import 'package:app/core/Errors/execption.dart';
import 'package:app/core/network/APi_consumer.dart';
import 'package:app/core/network/endpoints.dart';
import 'package:dartz/dartz.dart';

class HomeRepo {
  HomeRepo(this.api);
  ApiConsumer api;
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

      final catgroy = CategoriesModel.fromJson(response);
      id = catgroy.name;
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

      final brands = BrandsModel.fromJson(response);
      List<BrandsModel> brandList = [];
      if (response['list'] != null) {
        for (var brand in response['list']) {
          brandList.add(BrandsModel.fromJson(brand));
        }
      }
      return Right(brandList);
    } on AppException catch (e) {
      return left(e.errModel);
    }
  }

  Future<Either<ErrorModel, ProductListBrands>> getBrands() async {
    try {
      final response = await api.get(Endpoints.getproduct);

      final brands = ProductListBrands.fromJson(response);

      return Right(brands);
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

      final allProduct = ProductList.fromJson(response);

      return Right(allProduct);
    } on AppException catch (e) {
      return left(e.errModel);
    }
  }
}
