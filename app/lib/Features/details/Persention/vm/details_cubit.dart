import 'package:app/Features/Auth/data/Repo/Auth_repo.dart';
import 'package:app/Features/details/Persention/data/repo/details_repo.dart';
import 'package:app/Features/details/Persention/vm/details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsCubit extends Cubit<Detailstate> {
  DetailsCubit(super.initialState, this.detailsRepo);
  DetailsRepo detailsRepo;
  getDatils({id}) async {
    emit(DetailLoading());
    final response = await detailsRepo.detialsProduct(id: id);

    response.fold(
      ((errorMessga) => emit(DetailError(message: errorMessga))),
      (suecss) => emit(DetailSuecss(product: suecss)),
    );
  }

  void clear() {
    emit(Detailslinital());
  }
}
