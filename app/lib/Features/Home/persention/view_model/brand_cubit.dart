import 'package:app/Features/Auth/data/Repo/Auth_repo.dart';
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
