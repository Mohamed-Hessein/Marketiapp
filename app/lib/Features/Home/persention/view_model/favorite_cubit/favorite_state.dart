import 'package:app/Features/Auth/data/Model/signup_model.dart';
import 'package:app/Features/Home/data/brand_product_model.dart';
import 'package:app/Features/Home/data/catgroy_product_model.dart';
import 'package:app/Features/Home/data/dateils_model.dart';
import 'package:app/Features/Home/data/get_favprite_model.dart';
import 'package:app/core/Errors/ErrorModel.dart';

class FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteSuecss extends FavoriteState {
  final FavProductListResponse product;

  FavoriteSuecss({required this.product});
}

class FavoriteError extends FavoriteState {
  final ErrorModel message;

  FavoriteError({required this.message});
}

class Favoritelinital extends FavoriteState {}
