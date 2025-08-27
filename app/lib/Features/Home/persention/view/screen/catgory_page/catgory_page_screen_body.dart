import 'package:app/Features/Home/persention/view/widget/Grid_view_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/Features/Home/data/product_catgory_model.dart';
import 'package:app/Features/Home/persention/view/widget/GridProductView.dart';
import 'package:app/Features/Home/persention/view/widget/catogry_card.dart';
import 'package:app/Features/Home/persention/view/widget/custom_search_textfield.dart';
import 'package:app/Features/Home/persention/view_model/product_cubit.dart';
import 'package:app/Features/Home/persention/view_model/product_state.dart';
import 'package:app/core/Router/appRouter.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/theme/styles.dart';

class CatgoryPageScreenBody extends StatelessWidget {
  CatgoryPageScreenBody({super.key});

  @override
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
                      Text('Catgoryies', style: AppTextSyles.textpopns20color),
                      SizedBox(height: 4.h),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Approuter.catgroyProduct);
                  },
                  child: BlocConsumer<catgoryCubit, CatgoryState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      if (state is ProductCatgroySuecss) {
                        return GridViewProduct(
                          itemBuilder: (context, index) {
                            final catgroy = state.product[index];
                            final image = catgroy.image;
                            return CatgoryWidget(
                              colum: Image.network(image!),
                              onTap: () {
                                //   catgorproudctubit.getCatgroyPRoduct(name: catgroy.name);
                                Navigator.pushNamed(
                                  context,
                                  Approuter.catgroyProduct,
                                  arguments: catgroy.name,
                                );
                              },
                            );
                          },
                          hieght: 810.h,
                          scrollDir: Axis.vertical,
                          itemCount: state.product.length,
                          crossAxisCount: 2,
                        );
                      } else if (state is ProductCatgroyLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is ProductCatgroyError) {
                        return Text(state.message);
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
