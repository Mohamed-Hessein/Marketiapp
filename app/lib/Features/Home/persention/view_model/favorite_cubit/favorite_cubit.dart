import 'package:app/Features/Auth/data/Repo/Auth_repo.dart';
import 'package:app/Features/Home/persention/view_model/favorite_cubit/favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<Set<int>> {
  FavoriteCubit(this.authRepo) : super({});

  final AuthRepo authRepo;
  AddFAvoriete({name}) async {
    if (state.contains(name)) {
      final newSet = Set<int>.from(state)..remove(name);
      emit(newSet);
    } else {
      final newset2 = Set<int>.from(state)..add(name);
      emit(newset2);
      bool isFav(int id) => state.contains(id);
      final response = await authRepo.favoritePost(favid: name);
    }
  }
}

class getFavoriteCubit extends Cubit<FavoriteState> {
  getFavoriteCubit(super.initialState, this.authRepo);

  final AuthRepo authRepo;
  getfav({id}) async {
    emit(FavoriteLoading());
    final response = await authRepo.getFavorite(name: id);

    response.fold(
      ((errorMessga) => emit(FavoriteError(message: errorMessga))),
      (suecss) => emit(FavoriteSuecss(product: suecss)),
    );
  }
}

class DeleteFavoriteCubit extends Cubit<Set<int>> {
  DeleteFavoriteCubit(this.authRepo) : super({});

  final AuthRepo authRepo;
  DeleteFAvoriete({name}) async {
    if (state.contains(name)) {
      final newSet = Set<int>.from(state)..remove(name);

      emit(newSet);
    }
    final response = await authRepo.deletfavorite(favid: name);
  }
}
