import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/Features/Home/data/all_product_model.dart';
import 'package:app/Features/Home/persention/view/widget/Grid_view_product.dart';
import 'package:app/Features/Home/persention/view/widget/Row_view_all.dart';
import 'package:app/Features/Home/persention/view/widget/card_widget.dart';
import 'package:app/Features/Home/persention/view/widget/catogry_card.dart';
import 'package:app/Features/Home/persention/view/widget/custom_search_textfield.dart';
import 'package:app/Features/Home/persention/view/widget/list_view_product_card.dart';
import 'package:app/Features/Home/persention/view_model/product_cubit.dart';
import 'package:app/Features/Home/persention/view_model/product_state.dart';
import 'package:app/core/Router/appRouter.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';

class HomePageBody extends StatefulWidget {
  HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<ProductCubit>().getProduct();
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 14.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomSearchTextfield(
              assetImagesuf: ImageManager.filterIcon,
              assetImage: ImageManager.serachIcon,
              hintText: 'What are you looking for ?',
              wigeth: 35.w,
              height: 35.h,
            ),
            // SizedBox(height: 16.h),
            // Image.asset(ImageManager.offerImage, height: 120.h, width: 347.w),
            // SizedBox(height: 14.h),
            // RowViewAll(
            //   text: 'Populer product',
            //   onTap: () {},
            //   text2: 'View all',
            // ),
            // SizedBox(height: 15),
            // ListViewProduct(
            //   itemBuilder: (context, index) {
            //     return cardProduct(
            //       onTap: () {
            //         Navigator.pushNamed(context, Approuter.product);
            //       },
            //     );
            //   },
            //   length: 5,
            //   heigth: 160.h,
            // ),

            // SizedBox(height: 14.h),
            // RowViewAll(
            //   text: 'Catgory',
            //   onTap: () {
            //     Navigator.pushNamed(context, Approuter.catgorPage);
            //   },
            //   text2: 'View all',
            // ),
            // SizedBox(height: 15.h),
            // GridViewProduct(
            //   widget: CatgoryWidget(images: ImageManager.catgory, onTap: () {}),
            //   hieght: 250.h,
            //   itemCount: 6,
            //   crossAxisCount: 2,
            // ),
            // SizedBox(height: 15.h),
            // RowViewAll(text: 'Best For You', onTap: () {}, text2: 'View all'),
            // SizedBox(height: 15.h),
            BlocConsumer<ProductCubit, ProductState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is ProductSuecss) {
                  return ListViewProduct(
                    itemBuilder: (context, index) {
                      final prodcutreal = state.product.list[index];
                      return cardAddProduct(
                        price: prodcutreal.price,
                        title: prodcutreal.title,
                        realImage: prodcutreal.images[1],
                        image: ImageManager.heartIcon,
                        onTap: () {
                          Navigator.pushNamed(context, Approuter.bestForYou);
                        },
                      );
                    },
                    heigth: 203.h,
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
            SizedBox(height: 15.h),

            // RowViewAll(
            //   text: 'Brands',
            //   text2: 'View all',
            //   onTap: () {
            //     Navigator.pushNamed(context, Approuter.brandsPage);
            //   },
            // ),
            // SizedBox(height: 15),
            // GridViewProduct(
            //   widget: CatgoryWidget(
            //     images: ImageManager.allBrands,
            //     onTap: () {},
            //   ),
            //   hieght: 150.h,
            //   crossAxisCount: 1,
            //   itemCount: 3,
            // ),
            // SizedBox(height: 15.h),
            // RowViewAll(
            //   text: 'Best For You',
            //   onTap: () {
            //     Navigator.pushNamed(context, Approuter.bestForYou);
            //   },
            //   text2: 'View all',
            // ),
            // SizedBox(height: 15.h),
            // ListViewProduct(
            //   heigth: 203.h,
            //   itemBuilder: (context, index) {
            //     return cardAddProduct(
            //       image: ImageManager.heartIcon,
            //       onTap: () {
            //         Navigator.pushNamed(context, Approuter.bestForYou);
            //       },
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
