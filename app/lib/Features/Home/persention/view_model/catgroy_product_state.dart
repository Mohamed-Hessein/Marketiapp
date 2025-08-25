import 'package:app/Features/Home/data/catgroy_product_model.dart';
import 'package:app/Features/Home/data/dateils_model.dart';
import 'package:app/core/Errors/ErrorModel.dart';

class catgroyState {}

class CatgroyLoading extends catgroyState {}

class CatgroySuecss extends catgroyState {
  final ProductListResponse product;

  CatgroySuecss({required this.product});
}

class CatgroyError extends catgroyState {
  final ErrorModel message;

  CatgroyError({required this.message});
}

class Catgroylinital extends catgroyState {}
