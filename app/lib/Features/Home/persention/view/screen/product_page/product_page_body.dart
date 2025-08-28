import 'package:app/Features/Favorite/Persention/View/widget/fav_icon.dart';
import 'package:app/Features/Home/data/models/all_product_model.dart';
import 'package:app/Features/Home/persention/view/widget/add_catgory_card.dart';
import 'package:app/Features/Cart/Persention/vm/cart_cubit/cart_cubit.dart';
import 'package:app/Features/details/Persention/vm/details_cubit.dart';
import 'package:app/Features/Favorite/Persention/vm/favorite_cubit/favorite_cubit.dart';
import 'package:app/Features/Favorite/Persention/vm/favorite_cubit/favorite_state.dart';
import 'package:app/core/Router/appRouter.dart';
import 'package:app/core/services/services_locator.dart';
import 'package:app/core/theme/colors.dart';
import 'package:app/core/widgets/custom_error_widget.dart';
import 'package:app/core/widgets/shammar.dart';
import 'package:app/core/widgets/shimmer_product.dart';
import 'package:dartz/dartz.dart';
import 'package:app/Features/Home/persention/view_model/product_cubit.dart';
import 'package:app/Features/Home/persention/view_model/product_state.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/Features/Home/persention/view/widget/GridProductView.dart';
import 'package:app/Features/Home/persention/view/widget/card_widget.dart';
import 'package:app/Features/Home/persention/view/widget/custom_search_textfield.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/theme/styles.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:flutter_svg/svg.dart';

class ProductPageBody extends StatelessWidget {
  ProductPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<ProductCubit>().getAllProduct(isLoadMore: true);
      },
      child: Padding(
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
                        Text(
                          'All Product',
                          style: AppTextSyles.textpopns20color,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            BlocConsumer<ProductCubit, ProductState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                // final id;
                // final cont = context.read<DetailsCubit>();
                if (state is ProductAllSuecss) {
                  return NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      if (scrollInfo.metrics.pixels ==
                          scrollInfo.metrics.maxScrollExtent) {
                        sl<ProductCubit>().getAllProduct(isLoadMore: true);
                      }
                      return true;
                    },
                    child: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        childCount: state.product.list.length,
                        (context, index) {
                          bool isFAv = false;
                          final product = state.product.list[index];
                          isFAv = state.product.list!.any(
                            (p) => p.id == product.id,
                          );
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
                                  sl<cartCubit>().AddCart(name: product.id);
                                },
                                child: Text(
                                  'Add',
                                  style: AppTextSyles.textpopns14bcolor,
                                ),
                              ),
                            ),
                            onTap: () {
                              // cont.getDatils(id: product.id);
                              Navigator.pushNamed(
                                context,
                                Approuter.details,
                                arguments: product.id,
                              );
                            },
                            title: product.title,
                            realImage: product.images[0],
                            price: product.price,
                            image: FavroiteIcon(name: product.id, isFAv: isFAv),
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
                } else if (state is ProductAllLoading) {
                  return SliverGridShammer();
                } else if (state is ProductAllError) {
                  return SliverToBoxAdapter(
                    child: CustomErrorWidget(
                      errorMessage: state.message.errMessage,
                    ),
                  );
                } else {
                  return SliverToBoxAdapter(child: SizedBox());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
