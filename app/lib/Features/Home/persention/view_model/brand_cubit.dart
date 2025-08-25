import 'package:app/Features/Auth/data/Repo/Auth_repo.dart';
import 'package:app/Features/Home/data/all_product_model.dart';
import 'package:app/Features/Home/data/brand_product_model.dart';
import 'package:app/Features/Home/persention/view_model/brand_product_state.dart';
import 'package:app/Features/Home/persention/view_model/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandsCubit extends Cubit<BrandsState> {
  BrandsCubit(super.initialState, this.authRepo);

  final AuthRepo authRepo;
  getProductBrands() async {
    emit(ProductBrandsLoading());
    final response = await authRepo.getProductBrands();

    response.fold(
      ((errorMessga) => emit(ProductBrandsError(message: errorMessga))),
      (suecss) => emit(ProductBrandsSuecss(product: suecss)),
    );
  }
}

class BrandProdctCubit extends Cubit<BrandState> {
  BrandProdctCubit(super.initialState, this.authRepo);
  AuthRepo authRepo;
  int limit = 10;
  int skip = 0;
  bool hasMore = true;
  List<ProductModel> productLi = [];
  getBrandPRoduct({bool isLoadMOre = false, name}) async {
    if (!hasMore && isLoadMOre) return;
    if (!isLoadMOre) {
      skip = 0;
      hasMore = true;
      productLi.clear();
      emit(BrandProductLoading());
    }
    final response = await authRepo.BrandProduct(
      skip: skip,
      limit: limit,
      name: name,
    );

    response.fold(
      ((errorMessga) => emit(BrandProductError(message: errorMessga))),
      (suecss) {
        if (suecss.list.isEmpty) {
          hasMore = false;
        } else {
          productLi.addAll(suecss.list);
          skip += limit;
          emit(BrandProductSuecss(product: suecss));
        }
      },
    );
  }
}
