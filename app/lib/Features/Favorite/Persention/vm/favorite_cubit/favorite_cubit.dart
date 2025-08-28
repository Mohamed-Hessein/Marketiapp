import 'package:app/Features/Auth/data/Repo/Auth_repo.dart';
import 'package:app/Features/Favorite/data/repo/favroite_repo.dart';
import 'package:app/Features/Favorite/data/model/get_favprite_model.dart';
import 'package:app/Features/Favorite/Persention/vm/favorite_cubit/favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class getFavoriteCubit extends Cubit<FavoriteState> {
  getFavoriteCubit(super.initialState, this.favroiteRepo);
  final List<ProductListItem> favoriets = [];
  final FavroiteRepo favroiteRepo;
  getfav({id}) async {
    emit(FavoriteLoading());
    final response = await favroiteRepo.getFavorite(name: id);

    response.fold(
      ((errorMessga) => emit(FavoriteError(message: errorMessga))),
      (suecss) => emit(FavoriteSuecss(product: suecss)),
    );
  }

  DeleteFAvoriete({name}) async {
    emit(FavoriteLoading());
    final response = await favroiteRepo.deletfavorite(favid: name);
    response.fold(
      ((errorMessga) => emit(FavoriteError(message: errorMessga))),
      (suecss) async {
        await getfav();
      },
    );
  }

  AddFAvoriete({name}) async {
    emit(FavoriteLoading());
    final response = await favroiteRepo.favoritePost(favid: name);
    response.fold(
      ((errorMessga) => emit(FavoriteError(message: errorMessga))),
      (suecss) async {
        await getfav();
      },
    );
  }
}
