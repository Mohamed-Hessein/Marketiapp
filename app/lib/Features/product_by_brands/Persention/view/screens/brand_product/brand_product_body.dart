import 'package:app/Features/Cart/Persention/widgets/custom_text_button.dart';
import 'package:app/Features/Favorite/Persention/View/widget/fav_icon.dart';
import 'package:app/Features/Home/persention/view/widget/card_widget.dart';
import 'package:app/Features/Home/persention/view/widget/custom_search_textfield.dart';
import 'package:app/Features/Home/persention/view_model/brand_cubit.dart';
import 'package:app/Features/product_by_brands/Persention/vm/brand_product_state.dart';
import 'package:app/Features/Cart/Persention/vm/cart_cubit/cart_cubit.dart';
import 'package:app/Features/product_by_brands/Persention/vm/product_by_brands_cubit.dart';
import 'package:app/Features/product_by_catgroy/Persention/view/Screens/catgory_product/vm/catgroy_product_cubit.dart';
import 'package:app/Features/product_by_catgroy/Persention/view/Screens/catgory_product/vm/catgroy_product_state.dart';
import 'package:app/Features/details/Persention/vm/details_cubit.dart';
import 'package:app/Features/details/Persention/vm/details_state.dart';
import 'package:app/Features/Home/persention/view_model/product_cubit.dart';
import 'package:app/Features/Home/persention/view_model/product_state.dart';
import 'package:app/core/Router/appRouter.dart';
import 'package:app/core/services/services_locator.dart';
import 'package:app/core/widgets/custom_error_widget.dart';
import 'package:app/core/widgets/shimmer_product.dart';
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

class BrandProductBody extends StatefulWidget {
  BrandProductBody({super.key});

  @override
  State<BrandProductBody> createState() => _BrandProductBodyState();
}

class _BrandProductBodyState extends State<BrandProductBody> {
  final allProduct = sl<ProductCubit>();
  bool isLoadMore = false;
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        context.read<ProductCubit>().getAllProduct(isLoadMore: true);
      }
    });
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<BrandProdctCubit>().getBrandPRoduct(
          isLoadMOre: true,
        );
      },
      child: Padding(
        padding: EdgeInsets.only(top: 14.h),
        child: CustomScrollView(
          controller: scrollController,
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

            BlocConsumer<BrandProdctCubit, BrandState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is BrandProductSuecss) {
                  return NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      if (scrollInfo.metrics.pixels ==
                          scrollInfo.metrics.maxScrollExtent) {
                        context.read<BrandProdctCubit>().getBrandPRoduct(
                          isLoadMOre: true,
                        );
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
                            button: CustomTextButton(id: product.id),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Approuter.details,
                                arguments: product.id,
                              );
                            },
                            rating: product.rating,
                            title: product.title,
                            realImage: product.images[0],
                            price: product.price,

                            image: FavroiteIcon(id: product.id),
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
                } else if (state is BrandProductLoading) {
                  return SliverGridShammer();
                } else if (state is BrandProductError) {
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

  @override
  void dispose() {
    scrollController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
