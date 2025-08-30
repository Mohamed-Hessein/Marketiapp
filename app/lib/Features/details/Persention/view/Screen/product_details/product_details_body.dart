import 'package:app/Features/Cart/Persention/widgets/custom_text_button.dart';
import 'package:app/Features/details/Persention/vm/details_cubit.dart';
import 'package:app/Features/details/Persention/vm/details_state.dart';
import 'package:app/Features/Home/persention/view_model/product_cubit.dart';
import 'package:app/Features/details/Persention/widget/custom_cart_button.dart';
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
                          Flexible(
                            child: Text(
                              product.title,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
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
                            style: Theme.of(context).textTheme.titleLarge,
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
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            SizedBox(width: 3.w),
                            CustomCartButton(id: product.id),
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
