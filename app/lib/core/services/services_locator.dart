import 'package:app/Features/Auth/Persention/ViewModel/sign_up_cubit.dart';
import 'package:app/Features/Auth/Persention/ViewModel/sign_up_state.dart';
import 'package:app/Features/Auth/data/Repo/Auth_repo.dart';
import 'package:app/Features/Home/data/catgroy_product_model.dart';
import 'package:app/Features/Home/persention/view_model/brand_cubit.dart';
import 'package:app/Features/Home/persention/view_model/brand_product_state.dart';
import 'package:app/Features/Home/persention/view_model/catgroy_product_cubit.dart';
import 'package:app/Features/Home/persention/view_model/catgroy_product_state.dart';
import 'package:app/Features/Home/persention/view_model/details_cubit.dart';
import 'package:app/Features/Home/persention/view_model/details_state.dart';
import 'package:app/Features/Home/persention/view_model/favorite_cubit/favorite_cubit.dart';
import 'package:app/Features/Home/persention/view_model/favorite_cubit/favorite_state.dart';
import 'package:app/Features/Home/persention/view_model/product_cubit.dart';
import 'package:app/Features/Home/persention/view_model/product_state.dart';
import 'package:app/Features/Profile/Persention/vm/image_cubit.dart';
import 'package:app/Features/Profile/Persention/vm/image_state.dart';
import 'package:app/Features/Profile/data/repo/profile_repo.dart';
import 'package:app/core/network/Dio_consumer.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
void initsetup() {
  sl.registerLazySingleton<AuthRepo>(() => AuthRepo(DioConsumer(dio: Dio())));

  sl.registerLazySingleton<ProfileRepo>(
    () => ProfileRepo(DioConsumer(dio: Dio())),
  );
  sl.registerLazySingleton<Signupcubit>(() => Signupcubit(sl<AuthRepo>()));

  sl.registerLazySingleton<CatgroyProductCubit>(
    () => CatgroyProductCubit(Catgroylinital(), sl<AuthRepo>()),
  );
  sl.registerLazySingleton<catgoryCubit>(
    () => catgoryCubit(ProductCatgroyinital(), sl<AuthRepo>()),
  );
  sl.registerLazySingleton<BrandsCubit>(
    () => BrandsCubit(ProductBrandsinital(), sl<AuthRepo>()),
  );

  sl.registerLazySingleton<BrandProdctCubit>(
    () => BrandProdctCubit(BrandProductlinital(), sl<AuthRepo>()),
  );

  sl.registerLazySingleton<getFavoriteCubit>(
    () => getFavoriteCubit(Favoritelinital(), sl<AuthRepo>()),
  );
  sl.registerLazySingleton<ProductCubit>(
    () => ProductCubit(ProductAllinital(), sl<AuthRepo>()),
  );

  sl.registerFactory<DetailsCubit>(
    () => DetailsCubit(Detailslinital(), sl<AuthRepo>()),
  );
  sl.registerLazySingleton<ImageCubit>(
    () => ImageCubit(ImageStatelinital(), sl<AuthRepo>()),
  );
  sl.registerLazySingleton<ProfileCubit>(
    () => ProfileCubit(ProfileStatelinital(), sl<ProfileRepo>()),
  );
}
