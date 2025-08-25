import 'package:app/Features/Home/data/all_product_model.dart';
import 'package:app/Features/Home/data/brands_model.dart';
import 'package:app/Features/Home/data/brands_models.dart';
import 'package:app/Features/Home/data/catgory_model.dart';
import 'package:app/Features/Home/data/product_catgory_model.dart';
import 'package:app/Features/Home/data/serachModel.dart';
import 'package:app/core/Errors/ErrorModel.dart';

class ProductState {}

class ProductLoading extends ProductState {}

class ProductSuecss extends ProductState {
  final ProductList product;

  ProductSuecss({required this.product});
}

class ProductError extends ProductState {
  final ErrorModel message;

  ProductError({required this.message});
}

class Productinital extends ProductState {}

class CatgoryState {}

class ProductCatgroyLoading extends CatgoryState {}

class ProductCatgroySuecss extends CatgoryState {
  final List<CategoriesModel> product;

  ProductCatgroySuecss({required this.product});
}

class ProductCatgroyError extends CatgoryState {
  final String message;

  ProductCatgroyError({required this.message});
}

class ProductCatgroyinital extends CatgoryState {}

class BrandsState {}

class ProductBrandsLoading extends BrandsState {}

class ProductBrandsSuecss extends BrandsState {
  final List<BrandsModel> product;

  ProductBrandsSuecss({required this.product});
}

class ProductBrandsError extends BrandsState {
  final ErrorModel message;

  ProductBrandsError({required this.message});
}

class ProductBrandsinital extends BrandsState {}

class ProductBrandLoading extends ProductState {}

class ProductBrandSuecss extends ProductState {
  final ProductListBrands product;

  ProductBrandSuecss({required this.product});
}

class ProductBrandError extends ProductState {
  final ErrorModel message;

  ProductBrandError({required this.message});
}

class ProductBrandinital extends ProductState {}

class ProductAllLoading extends ProductState {}

class ProductAllSuecss extends ProductState {
  final ProductList product;

  ProductAllSuecss({required this.product});
}

class ProductAllError extends ProductState {
  final ErrorModel message;

  ProductAllError({required this.message});
}

class ProductAllinital extends ProductState {}

class SearchState {}

class SaerchLoading extends SearchState {}

class SaerchSuecss extends SearchState {
  final SearchModel product;

  SaerchSuecss({required this.product});
}

class SaerchError extends SearchState {
  final ErrorModel message;

  SaerchError({required this.message});
}

class Searchlinital extends SearchState {}
