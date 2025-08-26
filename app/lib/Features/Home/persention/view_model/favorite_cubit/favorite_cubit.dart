import 'package:app/Features/Auth/data/Repo/Auth_repo.dart';
import 'package:app/Features/Home/data/get_favprite_model.dart';
import 'package:app/Features/Home/persention/view_model/favorite_cubit/favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class getFavoriteCubit extends Cubit<FavoriteState> {
  getFavoriteCubit(super.initialState, this.authRepo);
  final List<ProductListItem> favoriets = [];
  final AuthRepo authRepo;
  getfav({id}) async {
    emit(FavoriteLoading());
    final response = await authRepo.getFavorite(name: id);

    response.fold(
      ((errorMessga) => emit(FavoriteError(message: errorMessga))),
      (suecss) => emit(FavoriteSuecss(product: suecss)),
    );
  }

  DeleteFAvoriete({name}) async {
    emit(FavoriteLoading());
    final response = await authRepo.deletfavorite(favid: name);
    response.fold(
      ((errorMessga) => emit(FavoriteError(message: errorMessga))),
      (suecss) async {
        await getfav();
      },
    );
  }

  AddFAvoriete({name}) async {
    emit(FavoriteLoading());
    final response = await authRepo.favoritePost(favid: name);
    response.fold(
      ((errorMessga) => emit(FavoriteError(message: errorMessga))),
      (suecss) async {
        await getfav();
      },
    );
  }
}
