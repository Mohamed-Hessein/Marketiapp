import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/Features/Auth/data/Repo/Auth_repo.dart';
import 'package:app/Features/Home/data/all_product_model.dart';
import 'package:app/Features/Home/data/product_catgory_model.dart';
import 'package:app/Features/Home/persention/view_model/product_state.dart';
import 'package:app/core/Errors/execption.dart';
import 'package:app/core/network/APi_consumer.dart';
import 'package:app/core/network/cachehelper.dart';
import 'package:app/core/network/endpoints.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(super.initialState, this.authRepo);

  final AuthRepo authRepo;
  ProductList? productList;
  ProductListCatgory? productListCatgory;
  getProduct() async {
    emit(ProductLoading());
    final response = await authRepo.getProduct();

    response.fold(
      ((errorMessga) => emit(ProductError(message: errorMessga))),
      (suecss) => emit(ProductSuecss(product: suecss)),
    );
  }

  getBrandProduct() async {
    emit(ProductBrandLoading());
    final response = await authRepo.getBrands();

    response.fold(
      ((errorMessga) => emit(ProductBrandError(message: errorMessga))),
      (suecss) => emit(ProductBrandSuecss(product: suecss)),
    );
  }

  getAllProduct(int index, int limit) async {
    emit(ProductAllLoading());
    final skip = index * limit;
    final response = await authRepo.getAllProduct(limit: limit, index: skip);

    response.fold(
      ((errorMessga) => emit(ProductAllError(message: errorMessga))),
      (suecss) => emit(ProductAllSuecss(product: suecss)),
    );
  }
}

class catgoryCubit extends Cubit<CatgoryState> {
  catgoryCubit(super.initialState, this.authRepo);

  final AuthRepo authRepo;
  getProductCatgoru() async {
    emit(ProductCatgroyLoading());
    final response = await authRepo.getProductCatgory();

    response.fold(
      ((errorMessga) => emit(ProductCatgroyError(message: errorMessga))),
      (suecss) => emit(ProductCatgroySuecss(product: suecss)),
    );
  }
}
