import 'package:app/Features/Auth/data/Repo/Auth_repo.dart';
import 'package:app/Features/Cart/data/repo/cart_repo.dart';
import 'package:app/Features/Favorite/data/model/get_favprite_model.dart';
import 'package:app/Features/Cart/Persention/vm/cart_cubit/cart_state.dart';
import 'package:app/Features/Favorite/Persention/vm/favorite_cubit/favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class cartCubit extends Cubit<CartState> {
  cartCubit(super.initialState, this.cartRepo);
  final List<dynamic> cart = [];
  final CartRepo cartRepo;
  getCart({id}) async {
    emit(CartLoading());
    final response = await cartRepo.getCart(name: id);

    response.fold(((errorMessga) => emit(CartError(message: errorMessga))), (
      suecss,
    ) {
      cart.clear();
      cart.addAll(suecss.list.map((item) => item.id));
      emit(CArtSuecss(product: suecss));
    });
  }

  DeleteCart({name}) async {
    emit(CartLoading());
    final response = await cartRepo.deleteCart(favid: name);
    response.fold(((errorMessga) => emit(CartError(message: errorMessga))), (
      suecss,
    ) async {
      cart.remove(name);
      await getCart();
    });
  }

  AddCart({name}) async {
    emit(CartLoading());
    final response = await cartRepo.AddCart(cartid: name);
    response.fold(((errorMessga) => emit(CartError(message: errorMessga))), (
      suecss,
    ) async {
      cart.add(name);
      await getCart();
    });
  }

  bool isCart(dynamic id) => cart.contains(id);
}
