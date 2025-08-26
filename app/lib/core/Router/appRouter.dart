import 'package:app/Features/Auth/Persention/ViewModel/sign_up_cubit.dart';
import 'package:app/Features/Auth/Persention/ViewModel/sign_up_state.dart';
import 'package:app/Features/Auth/data/Repo/Auth_repo.dart';
import 'package:app/Features/Home/persention/view/screen/brand_product/brand_product.dart';
import 'package:app/Features/Home/persention/view/screen/cart/cart_added_page.dart';
import 'package:app/Features/Home/persention/view/screen/catgory_product/catgory_product.dart';
import 'package:app/Features/Home/persention/view/screen/favorite_page/favorite_page.dart';
import 'package:app/Features/Home/persention/view/screen/home_page/home_page.dart';
import 'package:app/Features/Home/persention/view/screen/home_page/home_page_body.dart';
import 'package:app/Features/Home/persention/view_model/brand_cubit.dart';
import 'package:app/Features/Home/persention/view_model/brand_product_state.dart';
import 'package:app/Features/Home/persention/view_model/cart_cubit/cart_cubit.dart';
import 'package:app/Features/Home/persention/view_model/cart_cubit/cart_state.dart';
import 'package:app/Features/Home/persention/view_model/catgroy_product_cubit.dart';
import 'package:app/Features/Home/persention/view_model/catgroy_product_state.dart';
import 'package:app/Features/Home/persention/view_model/details_cubit.dart';
import 'package:app/Features/Home/persention/view_model/details_state.dart';
import 'package:app/Features/Home/persention/view_model/favorite_cubit/favorite_cubit.dart';
import 'package:app/Features/Home/persention/view_model/favorite_cubit/favorite_state.dart';
import 'package:app/Features/Home/persention/view_model/product_cubit.dart';
import 'package:app/Features/Home/persention/view_model/product_state.dart';
import 'package:app/Features/Home/persention/view_model/search_cubit.dart';
import 'package:app/core/network/Dio_consumer.dart';
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
import 'package:app/Features/Home/persention/view/screen/best_for_you_page/best_for_you.dart';
import 'package:app/Features/Home/persention/view/screen/brands_page/brands_pages.dart';
import 'package:app/Features/Home/persention/view/screen/product_details/product_details_page.dart';
import 'package:app/Features/Home/persention/view/screen/search_page/catgory_Page.dart';
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
  static const splash = '/spalsh';

  static const brandProduct = '/brandProduct';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => Splash());
      case onBording:
        return MaterialPageRoute(builder: (_) => onbordingpage());
      case logIn:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                Signupcubit(SignIninitial(), AuthRepo(DioConsumer(dio: Dio()))),

            child: const Login(),
          ),
        );
      case forgotPasswordPhone:
        return MaterialPageRoute(builder: (_) => const Forgotpassword());
      case forgotPasswordEmail:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => Signupcubit(
              ResetCodeinitial(),
              AuthRepo(DioConsumer(dio: Dio())),
            ),

            child: const Forgotpasswordbyemail(),
          ),
        );

      case returnPassword:
        return MaterialPageRoute(builder: (_) => const Login());
      case '/returnforgtepassmail':
        return MaterialPageRoute(builder: (_) => const Forgotpassword());
      case signUp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                Signupcubit(Signupinitial(), AuthRepo(DioConsumer(dio: Dio()))),

            child: const Signup(),
          ),
        );
      case enterCodoPhone:
        return MaterialPageRoute(builder: (_) => const Entercode());
      case enterCode:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => Signupcubit(
              AcvtiveResetCodeinitial(),
              AuthRepo(DioConsumer(dio: Dio())),
            ),

            child: const Entercodebyemail(),
          ),
        );
      case changePass:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => Signupcubit(
              ChangePassinitial(),
              AuthRepo(DioConsumer(dio: Dio())),
            ),

            child: const Changepassword(),
          ),
        );
      case congra:
        return MaterialPageRoute(builder: (_) => const Congr());
      case homePage:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ProductCubit(
                  Productinital(),
                  AuthRepo(DioConsumer(dio: Dio())),
                )..getProduct(),
              ),

              BlocProvider(
                create: (context) => SearchCubit(
                  Searchlinital(),
                  AuthRepo(DioConsumer(dio: Dio())),
                )..Search(),
              ),
            ],
            child: NavgiateBarWidget(),
          ),
        );
      case catogroy:
        return MaterialPageRoute(builder: (_) => const CatgoryPage());
      case catgroyProduct:
        return MaterialPageRoute(builder: (_) => CatgoryProduct());
      case product:
        return MaterialPageRoute(builder: (_) => const ProductPage());
      case emptyCart:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                cartCubit(cartlinital(), AuthRepo(DioConsumer(dio: Dio())))
                  ..getCart(),

            child: const CartAddedPage(),
          ),
        );
      case catgorPage:
        final args = settings.arguments as Map;
        return MaterialPageRoute(builder: (_) => const CatgoryPageScreen());
      case brandsPage:
        final args = settings.arguments as Map;
        return MaterialPageRoute(builder: (_) => const BrandsPages());
      case bestForYou:
        return MaterialPageRoute(builder: (_) => const BestForYou());
      case addCatgoryPage:
        return MaterialPageRoute(builder: (_) => const ProductDetailsPage());
      case details:
        return MaterialPageRoute(builder: (_) => ProductDetailsPage());

      case favoritepage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getFavoriteCubit(
              Favoritelinital(),
              AuthRepo(DioConsumer(dio: Dio())),
            )..getfav(),

            child: FavoritePage(),
          ),
        );
      case brandProduct:
        return MaterialPageRoute(builder: (_) => BrandProduct());

      case search:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SearchCubit(
              Searchlinital(),
              AuthRepo(DioConsumer(dio: Dio()))..SearchPost(),
            ),

            child: const CatgoryPage(),
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => const SplachBody());
    }
  }
}
