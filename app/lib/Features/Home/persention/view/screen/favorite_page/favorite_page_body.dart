import 'package:app/Features/Home/persention/view_model/details_cubit.dart';
import 'package:app/Features/Home/persention/view_model/favorite_cubit/favorite_cubit.dart';
import 'package:app/Features/Home/persention/view_model/favorite_cubit/favorite_state.dart';
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
import 'package:flutter_svg/svg.dart';

class FavoritePageBody extends StatelessWidget {
  const FavoritePageBody({super.key});

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
                      Text(
                        'Best For Uou',
                        style: AppTextSyles.textpopns20color,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //
          BlocConsumer<getFavoriteCubit, FavoriteState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              final cubit = context.read<DeleteFavoriteCubit>();
              final id;
              final cont = context.read<DetailsCubit>();
              if (state is FavoriteSuecss) {
                return NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                      context.read<ProductCubit>().getAllProduct(
                        isLoadMore: true,
                      );
                    }
                    return true;
                  },
                  child: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      childCount: state.product.list.length,
                      (context, index) {
                        final product = state.product.list[index];

                        return cardAddProduct(
                          onTap: () {
                            // cont.getDatils(id: product.id);
                            // Navigator.pushNamed(context, Approuter.details);
                          },
                          title: product.title,
                          realImage: product.images?[0],
                          price: product.price,
                          image: BlocConsumer<DeleteFavoriteCubit, Set<int>>(
                            listener: (context, state) {
                              // TODO: implement listener
                            },
                            builder: (context, state) {
                              final isFAv = state.contains(product.id);

                              return GestureDetector(
                                onTap: () {
                                  cubit.DeleteFAvoriete(name: product.id);
                                },
                                child: SvgPicture.asset(
                                  key: ValueKey(index),

                                  isFAv
                                      ? ImageManager.heartIcon
                                      : ImageManager.fillHeart,
                                  height: 24.h,

                                  width: 24.w,
                                ),
                              );
                            },
                          ),
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
              } else if (state is FavoriteLoading) {
                return SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (state is FavoriteError) {
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
