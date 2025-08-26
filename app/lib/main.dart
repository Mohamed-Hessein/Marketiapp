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
import 'package:app/Features/Home/persention/view_model/search_cubit.dart';
import 'package:app/core/services/services_locator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/Features/Auth/Persention/ViewModel/sign_up_cubit.dart';
import 'package:app/Features/Auth/Persention/ViewModel/sign_up_state.dart';
import 'package:app/Features/Auth/data/Repo/Auth_repo.dart';
import 'package:app/Features/Home/persention/view_model/product_cubit.dart';
import 'package:app/Features/Home/persention/view_model/product_state.dart';
import 'package:app/core/network/Dio_consumer.dart';
import 'package:app/core/network/cachehelper.dart';
import 'package:app/Features/Splash/Persention/view/Screens/Splash.dart';
import 'package:app/core/Router/appRouter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/core/theme/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  initsetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Approuter.generateRoute,
          theme: ThemeData.light(useMaterial3: true).copyWith(
            scaffoldBackgroundColor: Colors.white,
            shadowColor: Color(0xFFB2CCFF),
            cardTheme: CardThemeData().copyWith(
              shadowColor: Constants.Textfeildborder,
            ),
          ),
          initialRoute: Approuter.splash,
        );
      },
    );
  }
}
