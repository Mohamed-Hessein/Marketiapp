import 'package:app/Features/Auth/data/Repo/Auth_repo.dart';
import 'package:app/Features/Home/data/models/all_product_model.dart';
import 'package:app/Features/Home/data/models/brand_product_model.dart';
import 'package:app/Features/Home/data/repo/home_repo.dart';
import 'package:app/Features/product_by_brands/Persention/vm/brand_product_state.dart';
import 'package:app/Features/Home/persention/view_model/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrandsCubit extends Cubit<BrandsState> {
  BrandsCubit(super.initialState, this.homeRepo);

  final HomeRepo homeRepo;
  getProductBrands() async {
    emit(ProductBrandsLoading());
    final response = await homeRepo.getProductBrands();

    response.fold(
      ((errorMessga) => emit(ProductBrandsError(message: errorMessga))),
      (suecss) => emit(ProductBrandsSuecss(product: suecss)),
    );
  }
}
