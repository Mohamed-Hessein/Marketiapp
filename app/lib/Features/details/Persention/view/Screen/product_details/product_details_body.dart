import 'package:app/Features/details/Persention/vm/details_cubit.dart';
import 'package:app/Features/details/Persention/vm/details_state.dart';
import 'package:app/Features/Home/persention/view_model/product_cubit.dart';
import 'package:app/core/services/services_locator.dart';
import 'package:app/core/widgets/details_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/Features/Home/persention/view/widget/image_detail.dart';
import 'package:app/Features/Home/persention/view/widget/rate_widget.dart';
import 'package:app/Features/Home/persention/view/widget/size_widget.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/theme/colors.dart';
import 'package:app/core/theme/styles.dart';

class ProductDetailsBody extends StatelessWidget {
  ProductDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsCubit, Detailstate>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is DetailSuecss) {
          final product = state.product;

          return Padding(
            padding: EdgeInsets.only(top: 24.h),
            child: CustomScrollView(
              scrollDirection: Axis.vertical,
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Image.network(
                        product.thumbnail,
                        height: 200.h,
                        width: 199.w,
                      ),
                      SizedBox(height: 16.h),
                      ImageDetail(
                        itemBuilder: (context, index) {
                          return Image.network(product.images[0]);
                        },
                      ),
                      SizedBox(height: 37..h),
                      RateWidget(rate: product.rating),
                      SizedBox(height: 8.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 15.w),
                          Text(
                            product.title,
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
                            product.title,
                            style: AppTextSyles.textpopns16color.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 17),
                        child: Text(product.description),
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
                              '   Price\n${product.price}',
                              style: AppTextSyles.textpopns18color,
                            ),
                            SizedBox(width: 3.w),
                            SizedBox(
                              width: 232.w,
                              height: 48.h,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  fixedSize: Size(10, 7),
                                  side: BorderSide(
                                    color: Constants.Textfeildborder,
                                  ),
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
        } else if (state is DetailLoading) {
          return ShimmerProductDetails();
        } else if (state is DetailError) {
          return Text(state.message.errMessage);
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
