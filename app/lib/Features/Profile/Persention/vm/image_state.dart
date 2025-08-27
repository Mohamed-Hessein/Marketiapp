import 'package:app/Features/Auth/data/Model/signin_model.dart';
import 'package:app/Features/Auth/data/Model/signup_model.dart';
import 'package:app/Features/Profile/data/models/getProfile_model.dart';
import 'package:app/core/Errors/ErrorModel.dart';

class ImageState {}

class ImageStateLoading extends ImageState {}

class ImageStateSuecss extends ImageState {
  final Signupmodel product;

  ImageStateSuecss({required this.product});
}

class ImageStateError extends ImageState {
  final ErrorModel message;

  ImageStateError({required this.message});
}

class ImageStatelinital extends ImageState {}

class ProfileState {}

class ProfileStateLoading extends ProfileState {}

class ProfileStateSuecss extends ProfileState {
  final Message product;

  ProfileStateSuecss({required this.product});
}

class ProfileStateError extends ProfileState {
  final ErrorModel message;

  ProfileStateError({required this.message});
}

class ProfileStatelinital extends ProfileState {}
