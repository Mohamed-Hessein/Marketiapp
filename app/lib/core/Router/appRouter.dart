import 'package:app/Features/Auth/Persention/ViewModel/sign_up_cubit.dart';
import 'package:app/Features/Auth/Persention/ViewModel/sign_up_state.dart';
import 'package:app/Features/Auth/data/Repo/Auth_repo.dart';
import 'package:app/Features/Profile/Persention/vm/image_cubit.dart';
import 'package:app/Features/Search/data/repo/search_repo.dart';
import 'package:app/Features/product_by_brands/Persention/view/screens/brand_product/brand_product.dart';
import 'package:app/Features/Cart/Persention/view/Screen/cart/cart_page.dart';
import 'package:app/Features/product_by_brands/Persention/vm/product_by_brands_cubit.dart';
import 'package:app/Features/product_by_catgroy/Persention/view/Screens/catgory_product/catgory_product.dart';
import 'package:app/Features/Favorite/Persention/View/Screen/favorite_page/favorite_page.dart';
import 'package:app/Features/Home/persention/view/screen/home_page/home_page.dart';
import 'package:app/Features/Home/persention/view/screen/home_page/home_page_body.dart';
import 'package:app/Features/Home/persention/view_model/brand_cubit.dart';
import 'package:app/Features/product_by_brands/Persention/vm/brand_product_state.dart';
import 'package:app/Features/Cart/Persention/vm/cart_cubit/cart_cubit.dart';
import 'package:app/Features/Cart/Persention/vm/cart_cubit/cart_state.dart';
import 'package:app/Features/product_by_catgroy/Persention/view/Screens/catgory_product/vm/catgroy_product_cubit.dart';
import 'package:app/Features/product_by_catgroy/Persention/view/Screens/catgory_product/vm/catgroy_product_state.dart';
import 'package:app/Features/details/Persention/vm/details_cubit.dart';
import 'package:app/Features/details/Persention/vm/details_state.dart';
import 'package:app/Features/Favorite/Persention/vm/favorite_cubit/favorite_cubit.dart';
import 'package:app/Features/Favorite/Persention/vm/favorite_cubit/favorite_state.dart';
import 'package:app/Features/Home/persention/view_model/product_cubit.dart';
import 'package:app/Features/Home/persention/view_model/product_state.dart';
import 'package:app/Features/Search/Persention/vm/search_cubit.dart';
import 'package:app/Features/Profile/Persention/view/screen/profile.dart';
import 'package:app/core/network/Dio_consumer.dart';
import 'package:app/core/services/services_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:app/Features/Auth/Persention/view/Screen/login/login.dart';
import 'package:app/Features/Auth/Persention/view/Screen/sign_up/sign_up.dart';
import 'package:app/Features/Auth/Persention/view/Screen/change_password/change_password.dart';
import 'package:app/Features/Auth/Persention/view/Screen/congratules/congr.dart';
import 'package:app/Features/Auth/Persention/view/Screen/get_code/enter_code.dart';
import 'package:app/Features/Auth/Persention/view/Screen/get_code/enter_code_by_email.dart';
import 'package:app/Features/Auth/Persention/view/Screen/forgot_password/forgot_Password.dart';
import 'package:app/Features/Auth/Persention/view/Screen/forgot_password/forgot_password_by_email.dart';
import 'package:app/Features/Home/persention/view/screen/brands_page/brands_pages.dart';
import 'package:app/Features/details/Persention/view/Screen/product_details/product_details_page.dart';
import 'package:app/Features/Search/Persention/view/Screen/search_page/Search_page.dart';
import 'package:app/Features/Home/persention/view/screen/catgory_page/catgory_page_screen.dart';
import 'package:app/Features/Home/persention/view/screen/empty_cart_page/empty_cart.dart';
import 'package:app/Features/Home/persention/view/screen/product_page/product_page.dart';
import 'package:app/Features/Home/persention/view/widget/navgiate_bar_widget.dart';
import 'package:app/Features/OnBording/Persention/view/screens/onbordingpage.dart';
import 'package:app/Features/Splash/Persention/view/Screens/Splash.dart';
import 'package:app/Features/Splash/Persention/view/Screens/splach_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Approuter {
  static const logIn = '/login';
  static const onBording = '/onbording';
  static const signUp = '/signup';
  static const forgotPasswordEmail = '/forgtepassmail';
  static const changePass = '/createnewpassword';
  static const forgotPasswordPhone = '/forgtepass';
  static const enterCode = '/Entercodebyemailbody';
  static const congra = '/congra';
  static const returnPassword = '/returnforgtepass';
  static const enterCodoPhone = '/Entercodebyphonebody';
  static const homePage = '/home';
  static const catogroy = '/catogry';
  static const product = '/product';
  static const search = '/search';
  static const bestForYou = '/bestforyoy';
  static const emptyCart = '/emptyCart';
  static const catgorPage = '/catgorPage';
  static const brandsPage = '/brandsPage';
  static const addCatgoryPage = '/addCatgoryPage';
  static const details = '/details';
  static const catgroyProduct = '/catgroyProduct';
  static const favoritepage = '/fav';
  static const profile = '/profile';
  static const splash = '/spalsh';

  static const brandProduct = '/brandProduct';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => Splash());
      case onBording:
        return MaterialPageRoute(builder: (_) => onbordingpage());
      case logIn:
        return MaterialPageRoute(builder: (_) => const Login());
      case forgotPasswordPhone:
        return MaterialPageRoute(builder: (_) => const Forgotpassword());
      case forgotPasswordEmail:
        return MaterialPageRoute(builder: (_) => const Forgotpasswordbyemail());

      case returnPassword:
        return MaterialPageRoute(builder: (_) => const Login());
      case '/returnforgtepassmail':
        return MaterialPageRoute(builder: (_) => const Forgotpassword());
      case signUp:
        return MaterialPageRoute(builder: (_) => Signup());
      case enterCodoPhone:
        return MaterialPageRoute(builder: (_) => const Entercode());
      case enterCode:
        return MaterialPageRoute(builder: (_) => const Entercodebyemail());
      case changePass:
        return MaterialPageRoute(builder: (_) => const Changepassword());
      case congra:
        return MaterialPageRoute(builder: (_) => const Congr());
      case homePage:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => sl<ProductCubit>()..getProduct()),

              BlocProvider(create: (_) => sl<ProfileCubit>()..getProfileData()),
            ],
            child: NavgiateBarWidget(),
          ),
        );
      case catogroy:
        return MaterialPageRoute(builder: (_) => const SearchPage());
      case catgroyProduct:
        final catgroy = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) =>
                sl<CatgroyProductCubit>()..getCatgroyPRoduct(name: catgroy),
            child: CatgoryProduct(catgroyName: catgroy),
          ),
          settings: settings,
        );
      case product:
        final id = settings.arguments as dynamic;
        return MaterialPageRoute(
          builder: (_) => const ProductPage(),
          settings: settings,
        );
      case emptyCart:
        final id = settings.arguments as dynamic;
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => CartPage(id: id),
        );
      case catgorPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<catgoryCubit>()..getProductCatgoru(),
            child: const CatgoryPageScreen(),
          ),
        );
      case brandsPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<BrandsCubit>()..getProductBrands(),
            child: const BrandsPages(),
          ),
        );
      case addCatgoryPage:
        return MaterialPageRoute(builder: (_) => const ProductDetailsPage());
      case details:
        final id = settings.arguments as dynamic;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<DetailsCubit>()..getDatils(id: id),
            child: ProductDetailsPage(id: id),
          ),
          settings: settings,
        );

      case favoritepage:
        final id = settings.arguments as dynamic;
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => FavoritePage(id: id),
        );
      case brandProduct:
        final brands = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) =>
                sl<BrandProdctCubit>()..getBrandPRoduct(name: brands),
            child: BrandProduct(brandName: brands),
          ),
          settings: settings,
        );

      case search:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => BlocProvider(
            create: (_) => sl<SearchCubit>(),

            child: SearchPage(),
          ),
        );
      case profile:
        return MaterialPageRoute(builder: (_) => Profile());

      default:
        return MaterialPageRoute(builder: (_) => const SplachBody());
    }
  }
}
