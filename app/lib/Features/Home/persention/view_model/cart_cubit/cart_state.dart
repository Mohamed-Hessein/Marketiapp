import 'package:app/Features/Auth/data/Model/signup_model.dart';
import 'package:app/Features/Home/data/all_product_model.dart';
import 'package:app/Features/Home/data/brand_product_model.dart';
import 'package:app/Features/Home/data/catgroy_product_model.dart';
import 'package:app/Features/Home/data/dateils_model.dart';
import 'package:app/Features/Home/data/get_favprite_model.dart';
import 'package:app/core/Errors/ErrorModel.dart';

class CartState {}

class CartLoading extends CartState {}

class CArtSuecss extends CartState {
  final ProductList product;

  CArtSuecss({required this.product});
}

class CartError extends CartState {
  final ErrorModel message;

  CartError({required this.message});
}

class cartlinital extends CartState {}
