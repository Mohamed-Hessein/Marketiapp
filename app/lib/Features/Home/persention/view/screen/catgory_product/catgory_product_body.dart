import 'package:app/Features/Home/persention/view/widget/card_widget.dart';
import 'package:app/Features/Home/persention/view/widget/custom_search_textfield.dart';
import 'package:app/Features/Home/persention/view_model/cart_cubit/cart_cubit.dart';
import 'package:app/Features/Home/persention/view_model/catgroy_product_cubit.dart';
import 'package:app/Features/Home/persention/view_model/catgroy_product_state.dart';
import 'package:app/Features/Home/persention/view_model/details_cubit.dart';
import 'package:app/Features/Home/persention/view_model/details_state.dart';
import 'package:app/Features/Home/persention/view_model/product_cubit.dart';
import 'package:app/core/Router/appRouter.dart';
import 'package:app/core/services/services_locator.dart';
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

class CatgoryProductBody extends StatelessWidget {
  CatgoryProductBody({super.key});
  final detailsPROduct = sl<DetailsCubit>();
  final allProduct = sl<ProductCubit>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 14.h),
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomSearchTextfield(
                  assetImagesuf: ImageManager.filterIcon,
                  assetImage: ImageManager.serachIcon,
                  hintText: 'What are you looking for ?',
                  wigeth: 35.w,
                  height: 35.h,
                ),
                SizedBox(height: 16.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text('All Product', style: AppTextSyles.textpopns20color),
                    ],
                  ),
                ),
              ],
            ),
          ),

          BlocConsumer<CatgroyProductCubit, catgroyState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is CatgroySuecss) {
                return NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                      allProduct.getAllProduct(isLoadMore: true);
                    }
                    return true;
                  },
                  child: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      childCount: state.product.list.length,
                      (context, index) {
                        final product = state.product.list[index];
                        return cardAddProduct(
                          button: SizedBox(
                            width: 124.w,
                            height: 38.h,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                fixedSize: Size(10, 7),

                                side: BorderSide(
                                  color: Constants.Textfeildborder,
                                ),
                              ),
                              onPressed: () {
                                context.read<cartCubit>().AddCart(
                                  name: product.id,
                                );
                              },
                              child: Text(
                                'Add',
                                style: AppTextSyles.textpopns14bcolor,
                              ),
                            ),
                          ),
                          onTap: () {
                            detailsPROduct.getDatils(id: product.id);
                            Navigator.pushNamed(context, Approuter.details);
                          },
                          title: product.title,
                          realImage: product.images[0],
                          price: product.price,
                          image: SvgPicture.asset(ImageManager.heartIcon),
                        );
                      },
                    ),

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,

                      crossAxisSpacing: 5,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 250.h,
                    ),
                  ),
                );
              } else if (state is CatgroyLoading) {
                return SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (state is CatgroyError) {
                return SliverToBoxAdapter(
                  child: Text(state.message.errMessage),
                );
              } else {
                return SliverToBoxAdapter(child: SizedBox());
              }
            },
          ),
        ],
      ),
    );
  }
}
