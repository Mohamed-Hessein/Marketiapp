import 'package:app/Features/Auth/data/Repo/Auth_repo.dart';
import 'package:app/Features/Home/data/all_product_model.dart';
import 'package:app/Features/Home/data/serachModel.dart';
import 'package:app/Features/Home/persention/view_model/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(super.initialState, this.authRepo);
  AuthRepo authRepo;
  TextEditingController controller = TextEditingController();
  int limit = 10;
  int skip = 0;
  bool hasMore = true;
  List<ProductS> productLi = [];
  Search({bool isLoadMOre = false}) async {
    final query = controller.text.trim();
    if (!hasMore && isLoadMOre) return;
    if (!isLoadMOre) {
      skip = 0;
      hasMore = true;
      productLi.clear();
      emit(SaerchLoading());
    }

    final response = await authRepo.SearchPost(
      search: query,
      limit: limit,
      skip: skip,
    );
    print(" hndouogherlgay8yh5y8$query");
    response.fold(((errorMessga) => emit(SaerchError(message: errorMessga))), (
      suecss,
    ) {
      if (suecss.list.isEmpty) {
        hasMore = false;
      } else {
        productLi.addAll(suecss.list);
        skip += limit;
        emit(SaerchSuecss(product: suecss));
      }
    });
  }
}
