import 'package:app/Features/Auth/data/Repo/Auth_repo.dart';
import 'package:app/Features/Home/persention/view_model/details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsCubit extends Cubit<Detailstate> {
  DetailsCubit(super.initialState, this.authRepo);
  AuthRepo authRepo;
  getDatils({id}) async {
    emit(DetailLoading());
    final response = await authRepo.detialsProduct(id: id);

    response.fold(
      ((errorMessga) => emit(DetailError(message: errorMessga))),
      (suecss) => emit(DetailSuecss(product: suecss)),
    );
  }

  void clear() {
    emit(Detailslinital());
  }
}
