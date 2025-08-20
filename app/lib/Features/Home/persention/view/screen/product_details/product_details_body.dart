import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/Features/Home/persention/view/widget/image_detail.dart';
import 'package:app/Features/Home/persention/view/widget/rate_widget.dart';
import 'package:app/Features/Home/persention/view/widget/size_widget.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/theme/colors.dart';
import 'package:app/core/theme/styles.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.h),
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Image.asset(ImageManager.pampures, height: 200.h, width: 199.w),
                SizedBox(height: 16.h),
                ImageDetail(),
                SizedBox(height: 37..h),
                RateWidget(),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 15.w),
                    Text(
                      "Product Details",
                      style: AppTextSyles.textpopns20color,
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 15.w),
                    Text(
                      "Product Details",
                      style: AppTextSyles.textpopns16color.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Text(
                    'Fear no leaks with new and improved Pampers Swaddlers Pampers Swaddlers \nhelps prevent up to 100% of leaks\n, even blowouts Plus, Dual Leak-Guard Barriers at the legs help protect where leaks happen most With Swaddlers, you can rest assured that you have superior leak protection* while keeping baby’s skin healthy See more  ',
                  ),
                ),
                SizedBox(height: 4.h),
                SelectSize(),
                SizedBox(height: 12.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text(
                        '   Price\n345.00 EGP',
                        style: AppTextSyles.textpopns18color,
                      ),
                      SizedBox(width: 3.w),
                      SizedBox(
                        width: 232.w,
                        height: 48.h,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            fixedSize: Size(10, 7),
                            side: BorderSide(color: Constants.Textfeildborder),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ImageManager.cartIconOnly,
                                width: 28.w,
                                height: 28.h,
                              ),
                              Text(
                                'Add To Cart',
                                style: AppTextSyles.textpopns14bcolor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
