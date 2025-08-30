import 'package:app/Features/Auth/data/Repo/Auth_repo.dart';
import 'package:app/Features/Favorite/data/repo/favroite_repo.dart';
import 'package:app/Features/Favorite/data/model/get_favprite_model.dart';
import 'package:app/Features/Favorite/Persention/vm/favorite_cubit/favorite_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class getFavoriteCubit extends Cubit<FavoriteState> {
  getFavoriteCubit(super.initialState, this.favroiteRepo);
  final List<dynamic> favoriets = [];
  final FavroiteRepo favroiteRepo;
  getfav({dynamic id}) async {
    emit(FavoriteLoading());
    final response = await favroiteRepo.getFavorite(name: id);

    response.fold(
      ((errorMessga) => emit(FavoriteError(message: errorMessga))),
      (suecss) {
        favoriets.clear();
        favoriets.addAll(suecss.list.map((item) => item.id));
        emit(FavoriteSuecss(product: suecss));
      },
    );
  }

  DeleteFAvoriete({name}) async {
    emit(FavoriteLoading());
    final response = await favroiteRepo.deletfavorite(favid: name);
    response.fold(
      ((errorMessga) => emit(FavoriteError(message: errorMessga))),
      (suecss) async {
        favoriets.remove(name);
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
        favoriets.add(name);
        await getfav();
      },
    );
  }

  bool isFAvroite(dynamic id) => favoriets.contains(id);
  bool isFav(dynamic id) {
    final currentState = state;
    if (currentState is FavoriteSuecss) {
      return currentState.product.list.any((p) => p.id == id);
    }
    return false;
  }
}
