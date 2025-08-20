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

  getProductCatgoru() async {
    emit(ProductCatgroyLoading());
    final response = await authRepo.getProductCatgory(
      token: CacheHelper().getData(key: ApiKeys.token),
    );

    response.fold(
      ((errorMessga) => emit(ProductCatgroyError(message: errorMessga))),
      (suecss) => emit(ProductCatgroySuecss(product: suecss)),
    );
  }

  getProductBrands() async {
    emit(ProductBrandsLoading());
    final response = await authRepo.getProductBrands();

    response.fold(
      ((errorMessga) => emit(ProductBrandsError(message: errorMessga))),
      (suecss) => emit(ProductBrandsSuecss(product: suecss)),
    );
  }
}
