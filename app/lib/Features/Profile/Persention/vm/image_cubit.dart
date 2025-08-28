import 'package:app/Features/Auth/data/Repo/Auth_repo.dart';
import 'package:app/Features/Profile/Persention/vm/image_state.dart';
import 'package:app/Features/Profile/data/repo/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit(super.initialState, this.profileRepo);
  XFile? image;
  final ProfileRepo profileRepo;
  uploadimage(XFile pikcec) async {
    image = pikcec;
    emit(ImageStateLoading());
    final response = await profileRepo.uploadImage(pikcec);

    response.fold(
      ((errorMessga) => emit(ImageStateError(message: errorMessga))),
      (suecss) => emit(ImageStateSuecss(product: suecss)),
    );
  }
}

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(super.initialState, this.profileRepo);
  ProfileRepo profileRepo;
  getProfileData() async {
    emit(ProfileStateLoading());
    final response = await profileRepo.getProfileData();

    response.fold(
      ((errorMessga) => emit(ProfileStateError(message: errorMessga))),
      (suecss) => emit(ProfileStateSuecss(product: suecss)),
    );
  }
}
