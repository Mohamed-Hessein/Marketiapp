import 'package:app/Features/Cart/Persention/vm/cart_cubit/cart_cubit.dart';
import 'package:app/Features/details/Persention/vm/details_cubit.dart';
import 'package:app/Features/Favorite/Persention/vm/favorite_cubit/favorite_cubit.dart';
import 'package:app/Features/Favorite/Persention/vm/favorite_cubit/favorite_state.dart';
import 'package:app/Features/Home/persention/view_model/product_cubit.dart';
import 'package:app/Features/Home/persention/view_model/product_state.dart';
import 'package:app/core/Router/appRouter.dart';
import 'package:app/core/services/services_locator.dart';
import 'package:app/core/theme/colors.dart';
import 'package:app/core/widgets/custom_error_widget.dart';
import 'package:app/core/widgets/shimmer_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/Features/Home/persention/view/widget/GridProductView.dart';
import 'package:app/Features/Home/persention/view/widget/card_widget.dart';
import 'package:app/Features/Home/persention/view/widget/custom_search_textfield.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/theme/styles.dart';
import 'package:flutter_svg/svg.dart';

class FavoritePageBody extends StatefulWidget {
  FavoritePageBody({super.key});

  @override
  State<FavoritePageBody> createState() => _FavoritePageBodyState();
}

class _FavoritePageBodyState extends State<FavoritePageBody> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<getFavoriteCubit>().getfav();
      },
      child: Padding(
        padding: EdgeInsets.only(top: 14.h),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Approuter.search);
                    },
                    child: AbsorbPointer(
                      child: CustomSearchTextfield(
                        assetImagesuf: ImageManager.filterIcon,
                        assetImage: ImageManager.serachIcon,
                        hintText: 'What are you looking for ?',
                        wigeth: 35.w,
                        height: 35.h,
                      ),
                    ),
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
                          bool isFAv = false;
                          isFAv = state.product.list.any(
                            (p) => p.id == product.id,
                          );
                          return cardAddProduct(
                            onTap: () {
                              // cont.getDatils(id: product.id);
                              // Navigator.pushNamed(context, Approuter.details);
                            },
                            title: product.title,
                            realImage: product.images?[0],
                            price: product.price,
                            image: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isFAv = !isFAv;
                                });
                                if (isFAv) {
                                  sl<getFavoriteCubit>().DeleteFAvoriete(
                                    name: product.id,
                                  );
                                } else {
                                  sl<getFavoriteCubit>().AddFAvoriete(
                                    name: product.id,
                                  );
                                }
                              },
                              child: SvgPicture.asset(
                                isFAv
                                    ? ImageManager.fillHeart
                                    : ImageManager.heartIcon,
                                height: 24.h,

                                width: 24.w,
                              ),
                            ),
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
                  return SliverGridShammer();
                } else if (state is FavoriteError) {
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
