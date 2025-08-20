import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/Features/Home/persention/view/screen/cart/cart_added_page.dart';
import 'package:app/Features/Home/persention/view/screen/favorite_page/favorite_page.dart';
import 'package:app/Features/Home/persention/view/screen/home_page/home_page.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/theme/colors.dart';

class NavgiateBarWidget extends StatefulWidget {
  const NavgiateBarWidget({super.key});

  @override
  State<NavgiateBarWidget> createState() => _NavgiateBarWidgetState();
}

class _NavgiateBarWidgetState extends State<NavgiateBarWidget> {
  int index = 0;
  final pages = [HomePage(), CartAddedPage(), FavoritePage()];
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
      body: pages[index],
    );
  }
}
