import 'package:app/Features/Home/data/brands_model.dart';
import 'package:app/Features/Home/persention/view/widget/Grid_view_product.dart';
import 'package:app/Features/Home/persention/view/widget/card_widget.dart';
import 'package:app/Features/Home/persention/view_model/brand_cubit.dart';
import 'package:app/core/Router/appRouter.dart';
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
                BlocConsumer<BrandsCubit, BrandsState>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    if (state is ProductBrandsSuecss) {
                      return GridViewProduct(
                        itemCount: state.product.length,
                        itemBuilder: (context, index) {
                          final brands = state.product[index];

                          return CatgoryBrandsWidget(
                            colum: brands.emoji,
                            onTap: () {
                              // productbyBrndsCubit.getBrandPRoduct(name: brands.name);
                              Navigator.pushNamed(
                                context,
                                Approuter.brandProduct,
                                arguments: brands.name,
                              );
                            },
                            title: "${brands.name}",
                          );
                        },
                        scrollDir: Axis.vertical,
                        hieght: 810.h,
                        crossAxisCount: 2,
                      );
                    } else if (state is ProductBrandsLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is ProductBrandsError) {
                      return Text(state.message.errMessage);
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} ///////////////////////
