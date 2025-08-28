import 'package:app/Features/Home/data/models/brands_model.dart';
import 'package:app/Features/Home/persention/view/widget/Grid_view_product.dart';
import 'package:app/Features/Home/persention/view/widget/card_widget.dart';
import 'package:app/Features/Home/persention/view_model/brand_cubit.dart';
import 'package:app/core/Router/appRouter.dart';
import 'package:app/core/widgets/brands_shimmer_Grid_view.dart';
import 'package:app/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/Features/Home/persention/view/widget/GridProductView.dart';
import 'package:app/Features/Home/persention/view/widget/catogry_card.dart';
import 'package:app/Features/Home/persention/view/widget/custom_search_textfield.dart';
import 'package:app/Features/Home/persention/view_model/product_cubit.dart';
import 'package:app/Features/Home/persention/view_model/product_state.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/theme/styles.dart';

class BrandsPageBody extends StatelessWidget {
  BrandsPageBody({super.key});

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
                      Text('Brands', style: AppTextSyles.textpopns20color),
                      SizedBox(height: 4.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
          BlocConsumer<BrandsCubit, BrandsState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is ProductBrandsSuecss) {
                return SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    childCount: state.product.length,
                    (context, index) {
                      final brands = state.product[index];
                      final image = brands.emoji;
                      return CatgoryBrandsWidget(
                        title: brands.name,
                        colum: brands.emoji,
                        onTap: () {
                          //   catgorproudctubit.getCatgroyPRoduct(name: catgroy.name);
                          Navigator.pushNamed(
                            context,
                            Approuter.brandProduct,
                            arguments: brands.name,
                          );
                        },
                      );
                    },
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,

                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 250.h,
                  ),
                );
              } else if (state is ProductBrandsLoading) {
                return BrandsShimmerGridView(
                  scrollDI: Axis.vertical,
                  height: 810.h,
                );
              } else if (state is ProductBrandsError) {
                return SliverToBoxAdapter(
                  child: CustomErrorWidget(
                    errorMessage: state.message.errMessage,
                  ),
                );
              } else {
                return SliverToBoxAdapter(child: SizedBox.shrink());
              }
            },
          ),
        ],
      ),
    );
  }
} ///////////////////////
