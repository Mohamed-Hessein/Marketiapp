import 'package:app/Features/Cart/Persention/vm/cart_cubit/cart_cubit.dart';
import 'package:app/Features/Favorite/Persention/vm/favorite_cubit/favorite_cubit.dart';
import 'package:app/core/services/services_locator.dart';
import 'package:app/core/widgets/svg_theme_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/Features/Cart/Persention/view/Screen/cart/cart_page.dart';
import 'package:app/Features/Favorite/Persention/View/Screen/favorite_page/favorite_page.dart';
import 'package:app/Features/Home/persention/view/screen/home_page/home_page.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/theme/colors.dart';

class NavgiateBarWidget extends StatefulWidget {
  const NavgiateBarWidget({super.key});

  @override
  State<NavgiateBarWidget> createState() => _NavgiateBarWidgetState();
}

class _NavgiateBarWidgetState extends State<NavgiateBarWidget> {
  late final List<Widget> pages = [
    HomePage(),
    BlocProvider(
      create: (context) => sl<cartCubit>()..getCart(),
      child: CartPage(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<getFavoriteCubit>()..getfav()),
        BlocProvider(create: (context) => sl<cartCubit>()..getCart()),
      ],
      child: FavoritePage(),
    ),
  ];
  Widget getcurrent() {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return CartPage();
      case 2:
        return FavoritePage();
      default:
        return HomePage();
    }
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Constants.Textfeildborder)),
        ),

        child: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),

          backgroundColor: Theme.of(context).navigationBarTheme.backgroundColor,
          height: 66,

          destinations: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: NavigationDestination(
                icon: AppSvgIcon(assetName: ImageManager.fillHome, size: 55.w),
                label: '',
                selectedIcon: AppSvgIcon(
                  assetName: ImageManager.homeIcon,
                  size: 55.w,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: NavigationDestination(
                icon: AppSvgIcon(assetName: ImageManager.cartIcon, size: 55.w),
                label: '',
                selectedIcon: AppSvgIcon(
                  assetName: ImageManager.fillCart,
                  size: 55.w,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: NavigationDestination(
                icon: AppSvgIcon(
                  assetName: ImageManager.favoritueIcon,
                  size: 55.w,
                ),
                label: '',
                selectedIcon: AppSvgIcon(
                  assetName: ImageManager.fillFavorite,
                  size: 55.w,
                ),
              ),
            ),
          ],
        ),
      ),
      body: IndexedStack(children: pages, index: index),
    );
  }
}
