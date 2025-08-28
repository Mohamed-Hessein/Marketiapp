import 'package:app/Features/Cart/Persention/vm/cart_cubit/cart_cubit.dart';
import 'package:app/Features/Favorite/Persention/vm/favorite_cubit/favorite_cubit.dart';
import 'package:app/core/services/services_locator.dart';
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
    BlocProvider(
      create: (context) => sl<getFavoriteCubit>()..getfav(),
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

          backgroundColor: Colors.white,
          height: 66,

          destinations: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: NavigationDestination(
                icon: SvgPicture.asset(
                  ImageManager.fillHome,
                  width: 55.w,
                  height: 55.h,
                ),
                label: '',
                selectedIcon: SvgPicture.asset(
                  ImageManager.homeIcon,
                  width: 55.w,
                  height: 55.h,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: NavigationDestination(
                icon: SvgPicture.asset(
                  ImageManager.cartIcon,
                  width: 55.w,
                  height: 55.h,
                ),
                label: '',
                selectedIcon: SvgPicture.asset(
                  ImageManager.fillCart,
                  width: 55.w,
                  height: 55.h,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: NavigationDestination(
                icon: SvgPicture.asset(
                  ImageManager.favoritueIcon,
                  width: 55.w,
                  height: 55.h,
                ),
                label: '',
                selectedIcon: SvgPicture.asset(
                  ImageManager.fillFavorite,
                  width: 55.w,
                  height: 55.h,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: NavigationDestination(
                icon: SvgPicture.asset(
                  ImageManager.menuIcon,
                  width: 55.w,
                  height: 55.h,
                ),
                label: '',
              ),
            ),
          ],
        ),
      ),
      body: IndexedStack(children: pages, index: index),
    );
  }
}
