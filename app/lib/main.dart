import 'package:app/Features/Home/persention/view_model/brand_cubit.dart';
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
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => Signupcubit(
                ChangePassinitial(),
                AuthRepo(DioConsumer(dio: Dio())),
              ),
            ),
            BlocProvider(
              create: (context) => ProductCubit(
                Productinital(),
                AuthRepo(DioConsumer(dio: Dio()))..getProduct(),
              ),
            ),
            BlocProvider(
              create: (context) => Signupcubit(
                SignIninitial(),
                AuthRepo(DioConsumer(dio: Dio())),
              ),
            ),
            BlocProvider(
              create: (context) => BrandsCubit(
                ProductBrandsinital(),
                AuthRepo(DioConsumer(dio: Dio()))..getProductBrands(),
              ),
            ),
            BlocProvider(
              create: (context) => catgoryCubit(
                ProductCatgroyinital(),
                AuthRepo(DioConsumer(dio: Dio()))..getProductCatgory(),
              ),
            ),
            BlocProvider(
              create: (context) => Signupcubit(
                Signupinitial(),
                AuthRepo(DioConsumer(dio: Dio())),
              ),
            ),
            BlocProvider(
              create: (context) => Signupcubit(
                AcvtiveResetCodeinitial(),
                AuthRepo(DioConsumer(dio: Dio())),
              ),
            ),
            BlocProvider(
              create: (context) => Signupcubit(
                ResetCodeinitial(),
                AuthRepo(DioConsumer(dio: Dio())),
              ),
            ),
            BlocProvider(
              create: (context) => ProductCubit(
                ProductAllinital(),
                AuthRepo(DioConsumer(dio: Dio())),
              ),
            ),
          ],

          child: MaterialApp(
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
          ),
        );
      },
    );
  }
}
