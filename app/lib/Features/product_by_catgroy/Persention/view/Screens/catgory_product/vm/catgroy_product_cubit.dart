import 'package:app/Features/Auth/data/Repo/Auth_repo.dart';
import 'package:app/Features/product_by_catgroy/data/model/catgroy_product_model.dart';
import 'package:app/Features/product_by_catgroy/Persention/view/Screens/catgory_product/vm/catgroy_product_state.dart';
import 'package:app/Features/details/Persention/vm/details_state.dart';
import 'package:app/Features/product_by_catgroy/data/repo/catgroy_product_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatgroyProductCubit extends Cubit<catgroyState> {
  CatgroyProductCubit(super.initialState, this.catgroyProductRepo);
  CatgroyProductRepo catgroyProductRepo;
  int limit = 10;
  int skip = 0;
  bool hasMore = true;
  List<Product> productLi = [];
  getCatgroyPRoduct({bool isLoadMOre = false, name}) async {
    if (!hasMore && isLoadMOre) return;
    if (!isLoadMOre) {
      skip = 0;
      hasMore = true;
      productLi.clear();
      emit(CatgroyLoading());
    }
    final response = await catgroyProductRepo.CatgroyProduct(
      skip: skip,
      limit: limit,
      name: name,
    );

    response.fold(((errorMessga) => emit(CatgroyError(message: errorMessga))), (
      suecss,
    ) {
      if (suecss.list.isEmpty) {
        hasMore = false;
      } else {
        productLi.addAll(suecss.list);
        skip += limit;
        emit(CatgroySuecss(product: suecss));
      }
    });
  }
}
