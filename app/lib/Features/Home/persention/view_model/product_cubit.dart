import 'package:app/Features/Home/persention/view_model/details_state.dart';
import 'package:app/Features/Home/persention/view_model/product_cubit.dart'
    as authRepo;
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
  getProduct({id}) async {
    emit(ProductLoading());
    final response = await authRepo.getProduct(id);

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

  int limit = 10;
  int skip = 0;
  bool hasMore = true;
  List<Product> productLi = [];
  getAllProduct({bool isLoadMore = false}) async {
    if (!hasMore && isLoadMore) return;
    if (!isLoadMore) {
      skip = 0;
      hasMore = true;
      productLi.clear();
      emit(ProductAllLoading());
    }

    final response = await authRepo.getAllProduct(limit: limit, skip: skip);

    response.fold(
      ((errorMessga) => emit(ProductAllError(message: errorMessga))),
      (suecss) {
        if (suecss.list.isEmpty) {
          hasMore = false;
        } else {
          productLi.addAll(suecss.list);
          skip += limit;
        }
        emit(
          ProductAllSuecss(product: ProductList(list: List.from(productLi))),
        );
      },
    );
  }
}

class catgoryCubit extends Cubit<CatgoryState> {
  catgoryCubit(super.initialState, this.authRepo);

  final AuthRepo authRepo;
  getProductCatgoru({name}) async {
    emit(ProductCatgroyLoading());
    final response = await authRepo.getProductCatgory(id: name);

    response.fold(
      ((errorMessga) => emit(ProductCatgroyError(message: errorMessga))),
      (suecss) => emit(ProductCatgroySuecss(product: suecss)),
    );
  }
}
