import 'package:app/Features/Auth/Persention/ViewModel/sign_up_cubit.dart';
import 'package:app/Features/Auth/Persention/ViewModel/sign_up_state.dart';
import 'package:app/Features/Auth/data/Repo/Auth_repo.dart';
import 'package:app/Features/Cart/Persention/vm/cart_cubit/cart_cubit.dart';
import 'package:app/Features/Cart/Persention/vm/cart_cubit/cart_state.dart';
import 'package:app/Features/Cart/data/repo/cart_repo.dart';
import 'package:app/Features/Favorite/data/repo/favroite_repo.dart';
import 'package:app/Features/Home/data/repo/home_repo.dart';
import 'package:app/Features/details/Persention/data/repo/details_repo.dart';
import 'package:app/Features/product_by_catgroy/data/model/catgroy_product_model.dart';
import 'package:app/Features/Home/persention/view_model/brand_cubit.dart';
import 'package:app/Features/Search/Persention/vm/search_cubit.dart';
import 'package:app/Features/Search/data/repo/search_repo.dart';
import 'package:app/Features/product_by_brands/Persention/vm/brand_product_state.dart';
import 'package:app/Features/product_by_brands/Persention/vm/product_by_brands_cubit.dart';
import 'package:app/Features/product_by_brands/data/repo/brands_product_repo.dart';
import 'package:app/Features/product_by_catgroy/Persention/view/Screens/catgory_product/vm/catgroy_product_cubit.dart';
import 'package:app/Features/product_by_catgroy/Persention/view/Screens/catgory_product/vm/catgroy_product_state.dart';
import 'package:app/Features/details/Persention/vm/details_cubit.dart';
import 'package:app/Features/details/Persention/vm/details_state.dart';
import 'package:app/Features/Favorite/Persention/vm/favorite_cubit/favorite_cubit.dart';
import 'package:app/Features/Favorite/Persention/vm/favorite_cubit/favorite_state.dart';
import 'package:app/Features/Home/persention/view_model/product_cubit.dart';
import 'package:app/Features/Home/persention/view_model/product_state.dart';
import 'package:app/Features/Profile/Persention/vm/image_cubit.dart';
import 'package:app/Features/Profile/Persention/vm/image_state.dart';
import 'package:app/Features/Profile/data/repo/profile_repo.dart';
import 'package:app/Features/product_by_catgroy/data/repo/catgroy_product_repo.dart';
import 'package:app/core/network/Dio_consumer.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
void initsetup() {
  sl.registerLazySingleton<AuthRepo>(() => AuthRepo(DioConsumer(dio: Dio())));

  sl.registerLazySingleton<HomeRepo>(() => HomeRepo(DioConsumer(dio: Dio())));

  sl.registerLazySingleton<CartRepo>(() => CartRepo(DioConsumer(dio: Dio())));

  sl.registerLazySingleton<CatgroyProductRepo>(
    () => CatgroyProductRepo(DioConsumer(dio: Dio())),
  );

  sl.registerLazySingleton<BrandsProductRepo>(
    () => BrandsProductRepo(DioConsumer(dio: Dio())),
  );

  sl.registerLazySingleton<SearchRepo>(
    () => SearchRepo(DioConsumer(dio: Dio())),
  );

  sl.registerLazySingleton<DetailsRepo>(
    () => DetailsRepo(DioConsumer(dio: Dio())),
  );
  sl.registerLazySingleton<FavroiteRepo>(
    () => FavroiteRepo(DioConsumer(dio: Dio())),
  );

  sl.registerLazySingleton<ProfileRepo>(
    () => ProfileRepo(DioConsumer(dio: Dio())),
  );
  sl.registerLazySingleton<Signupcubit>(() => Signupcubit(sl<AuthRepo>()));

  sl.registerFactory<CatgroyProductCubit>(
    () => CatgroyProductCubit(Catgroylinital(), sl<CatgroyProductRepo>()),
  );
  sl.registerFactory<catgoryCubit>(
    () => catgoryCubit(ProductCatgroyinital(), sl<HomeRepo>()),
  );
  sl.registerFactory<BrandsCubit>(
    () => BrandsCubit(ProductBrandsinital(), sl<HomeRepo>()),
  );

  sl.registerFactory<BrandProdctCubit>(
    () => BrandProdctCubit(BrandProductlinital(), sl<BrandsProductRepo>()),
  );

  sl.registerFactory<getFavoriteCubit>(
    () => getFavoriteCubit(Favoritelinital(), sl<FavroiteRepo>()),
  );
  sl.registerFactory<ProductCubit>(
    () => ProductCubit(ProductAllinital(), sl<HomeRepo>()),
  );

  sl.registerFactory<DetailsCubit>(
    () => DetailsCubit(Detailslinital(), sl<DetailsRepo>()),
  );
  sl.registerFactory<ImageCubit>(
    () => ImageCubit(ImageStatelinital(), sl<ProfileRepo>()),
  );
  sl.registerFactory<ProfileCubit>(
    () => ProfileCubit(ProfileStatelinital(), sl<ProfileRepo>()),
  );

  sl.registerFactory<cartCubit>(() => cartCubit(cartlinital(), sl<CartRepo>()));

  sl.registerFactory<SearchCubit>(
    () => SearchCubit(Searchlinital(), sl<SearchRepo>()),
  );
}
