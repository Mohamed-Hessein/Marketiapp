import 'package:app/Features/Home/data/brand_product_model.dart';
import 'package:app/Features/Home/data/catgroy_product_model.dart';
import 'package:app/Features/Home/data/dateils_model.dart';
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
