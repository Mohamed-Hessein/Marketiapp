import 'package:app/Features/Home/data/dateils_model.dart';
import 'package:app/core/Errors/ErrorModel.dart';

class Detailstate {}

class DetailLoading extends Detailstate {}

class DetailSuecss extends Detailstate {
  final ProductDetails product;

  DetailSuecss({required this.product});
}

class DetailError extends Detailstate {
  final ErrorModel message;

  DetailError({required this.message});
}

class Detailslinital extends Detailstate {}
