import 'package:app/Features/Home/data/models/brand_product_model.dart';
import 'package:app/Features/product_by_catgroy/data/model/catgroy_product_model.dart';
import 'package:app/Features/details/Persention/data/models/dateils_model.dart';
import 'package:app/core/Errors/ErrorModel.dart';

class BrandState {}

class BrandProductLoading extends BrandState {}

class BrandProductSuecss extends BrandState {
  final BrandProductModel product;

  BrandProductSuecss({required this.product});
}

class BrandProductError extends BrandState {
  final ErrorModel message;

  BrandProductError({required this.message});
}

class BrandProductlinital extends BrandState {}
