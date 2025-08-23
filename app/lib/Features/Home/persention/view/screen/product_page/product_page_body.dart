import 'package:app/Features/Home/data/all_product_model.dart';
import 'package:app/Features/Home/persention/view/widget/add_catgory_card.dart';
import 'package:flutter/material.dart';
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

class ProductPageBody extends StatefulWidget {
  ProductPageBody({super.key});

  @override
  State<ProductPageBody> createState() => _ProductPageBodyState();
}

class _ProductPageBodyState extends State<ProductPageBody> {
  static const int pagesize = 10;
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

          BlocConsumer<ProductCubit, ProductState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is ProductAllSuecss) {
                return PagewiseSliverGrid<Product>.count(
                  pageSize: pagesize, // عدد العناصر في كل صفحة

                  crossAxisCount: 2, // عدد الأعمدة
                  mainAxisSpacing: 8, // المسافة الرأسية بين العناصر
                  crossAxisSpacing: 8, // المسافة الأفقية
                  childAspectRatio: 1, // نسبة العرض للارتفاع

                  itemBuilder: (context, entry, index) {
                    final product = state.product.list[index];
                    return cardAddProduct(
                      onTap: () {},
                      image: entry.images,
                      price: entry.price,
                    );
                  },
                  pageFuture: (pageIndex) async {
                    return context.read<ProductCubit>().getAllProduct(
                      pageIndex!,
                      pagesize,
                    );
                  },
                );
              } else if (state is ProductLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ProductError) {
                return Text(state.message.errMessage);
              } else {
                return SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
