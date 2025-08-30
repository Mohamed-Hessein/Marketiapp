import 'package:app/core/Router/appRouter.dart';
import 'package:app/core/widgets/svg_theme_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/Features/Cart/Persention/view/Screen/cart/cart_page_body.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/theme/styles.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key, this.id});
  final id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Row(
          children: [
            Spacer(flex: 2),
            // SizedBox(width: 45.w),
            Text("Cart"),
            Spacer(flex: 3),
          ],
        ),
        leading: SizedBox(
          height: 80.h,
          width: 80.w,
          child: Row(
            children: [
              SizedBox(width: 20.h),

              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Approuter.homePage);
                },
                child: SizedBox(
                  height: 30.h,
                  width: 30.w,
                  child: AppSvgIcon(assetName: ImageManager.backArrow),
                ),
              ),
            ],
          ),
        ),
      ),
      body: CartPageBody(),
    );
  }
}
