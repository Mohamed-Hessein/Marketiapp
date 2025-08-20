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

class CatgoryPageScreenBody extends StatefulWidget {
  const CatgoryPageScreenBody({super.key});

  @override
  State<CatgoryPageScreenBody> createState() => _CatgoryPageScreenBodyState();
}

class _CatgoryPageScreenBodyState extends State<CatgoryPageScreenBody> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<ProductCubit>().getProductCatgoru();
    super.initState();
  }

  ProductCatgory? productCatgory;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductCatgroySuecss) {
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
                              'Catgoryies',
                              style: AppTextSyles.textpopns20color,
                            ),
                            SizedBox(height: 4.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                GridProductView(
                  mainAxisExtent: 130,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  widget: CatgoryWidget(
                    images: productCatgory!.images,
                    onTap: () {
                      Navigator.pushNamed(context, Approuter.addCatgoryPage);
                    },
                  ),
                  crossAxisCount: productCatgory!.images.length,
                  itemCount: 20,
                ),
              ],
            ),
          );
        } else if (state is ProductCatgroyError) {
          return Text(state.message);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
