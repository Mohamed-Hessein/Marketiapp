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
        backgroundColor: Colors.white,
        title: Row(
          children: [
            SizedBox(
              height: 80.h,
              width: 80.w,
              child: Row(
                children: [
                  SizedBox(height: 20.h),
                  SizedBox(width: 8.w),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      height: 40.h,
                      width: 45.w,
                      child: SvgPicture.asset(ImageManager.backArrow),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 38.w),
            Row(
              children: [Text("Phones", style: AppTextSyles.textpopns20color)],
            ),
          ],
        ),
      ),
      body: CartPageBody(),
    );
  }
}
