import 'package:app/Features/Auth/data/Model/signup_model.dart';
import 'package:app/Features/Home/data/models/brand_product_model.dart';
import 'package:app/Features/product_by_catgroy/data/model/catgroy_product_model.dart';
import 'package:app/Features/details/Persention/data/models/dateils_model.dart';
import 'package:app/Features/Favorite/data/model/get_favprite_model.dart';
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

class FavoriteaddRemoveState {}

class FavoriteladRemveLoading extends FavoriteaddRemoveState {}

class FavoriteladRemveSuecss extends FavoriteaddRemoveState {
  final Signupmodel product;

  FavoriteladRemveSuecss({required this.product});
}

class FavoriteladRemveError extends FavoriteaddRemoveState {
  final ErrorModel message;
  FavoriteladRemveError({required this.message});
}

class FavoriteladRemveinital extends FavoriteaddRemoveState {}
