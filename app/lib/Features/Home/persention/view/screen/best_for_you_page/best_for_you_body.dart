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

class BestForYouBody extends StatelessWidget {
  const BestForYouBody({super.key});

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

          // BlocConsumer<ProductCubit, ProductState>(
          //   listener: (context, state) {
          //     // TODO: implement listener
          //   },
          //   builder: (context, state) {
          //     if (state is ProductBrandsSuecss) {
          //       return GridProductView(
          //         mainAxisExtent: 210,
          //         itemBuilder: (context, index) {
          //           final prodcutreal = state.product;
          //           return Padding(
          //             padding: const EdgeInsets.only(left: 6),
          //             child: cardAddProduct(

          //               onTap: () {},
          //               image: ImageManager.heartIcon,
          //             ),
          //           );
          //         },

          //         crossAxisSpacing: 3,
          //         mainAxisSpacing: 3,
          //         crossAxisCount: 2,
          //         itemCount: state.product.list.length,
          //       );
          //     } else if (state is ProductLoading) {
          //       return Center(child: CircularProgressIndicator());
          //     } else if (state is ProductError) {
          //       return Text(state.message.errMessage);
          //     } else {
          //       return SizedBox();
          //     }
          //   },
          // ),
        ],
      ),
    );
  }
}
