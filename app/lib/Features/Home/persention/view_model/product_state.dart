import 'package:app/Features/Home/data/all_product_model.dart';
import 'package:app/Features/Home/data/brands_model.dart';
import 'package:app/Features/Home/data/product_catgory_model.dart';
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

class ProductCatgroyLoading extends ProductState {}

class ProductCatgroySuecss extends ProductState {
  final List<ProductCatgory> product;

  ProductCatgroySuecss({required this.product});
}

class ProductCatgroyError extends ProductState {
  final String message;

  ProductCatgroyError({required this.message});
}

class ProductCatgroyinital extends ProductState {}

class ProductBrandsLoading extends ProductState {}

class ProductBrandsSuecss extends ProductState {
  final List<ProductBrands> product;

  ProductBrandsSuecss({required this.product});
}

class ProductBrandsError extends ProductState {
  final String message;

  ProductBrandsError({required this.message});
}

class ProductBrandsinital extends ProductState {}
