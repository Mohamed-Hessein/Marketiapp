import 'package:app/Features/Auth/data/Repo/Auth_repo.dart';
import 'package:app/Features/Home/data/models/brand_product_model.dart';
import 'package:app/Features/product_by_brands/Persention/vm/brand_product_state.dart';
import 'package:app/Features/product_by_brands/data/repo/brands_product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandProdctCubit extends Cubit<BrandState> {
  BrandProdctCubit(super.initialState, this.brandsProductRepo);
  BrandsProductRepo brandsProductRepo;
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
    final response = await brandsProductRepo.BrandProduct(
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
