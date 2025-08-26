import 'dart:math';

import 'package:app/Features/Home/persention/view/screen/brands_page/brands_pages.dart';
import 'package:app/Features/Home/persention/view/screen/catgory_page/catgory_page_screen.dart';
import 'package:app/Features/Home/persention/view/widget/Grid_ctagory_widget.dart';
import 'package:app/Features/Home/persention/view/widget/card_of_brands_homeview.dart';
import 'package:app/Features/Home/persention/view/widget/listviewCard_home_pgae.dart';
import 'package:app/Features/Home/persention/view/widget/populer_product_widget.dart';
import 'package:app/Features/Home/persention/view_model/brand_cubit.dart';
import 'package:app/core/services/services_locator.dart';
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

class HomePageBody extends StatelessWidget {
  HomePageBody({super.key});

  @override
  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 14.h),
      child: SingleChildScrollView(
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
            Image.asset(ImageManager.offerImage, height: 120.h, width: 347.w),
            SizedBox(height: 14.h),
            RowViewAll(
              text: 'Populer product',
              onTap: () {
                Navigator.pushNamed(context, Approuter.product);
              },
              text2: 'View all',
            ),
            SizedBox(height: 15),
            PopulerProductWidget(),
            ////
            SizedBox(height: 14.h),
            RowViewAll(
              text: 'Catgory',
              onTap: () {
                final Widget catgroyWidget = GridCtagoryWidget();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CatgoryPageScreen(
                      catgroy: GridCtagoryWidget(
                        scrollDI: Axis.vertical,
                        height: 810.h,
                      ),
                    ),
                  ),
                );
              },
              text2: 'View all',
            ),
            SizedBox(height: 15.h),
            GridCtagoryWidget(scrollDI: Axis.horizontal, height: 250.h),

            SizedBox(height: 15.h),

            RowViewAll(
              text: 'Brands',
              text2: 'View all',
              onTap: () {
                final Widget myBrand = CardOfBrandsHomeview();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BrandsPages(
                      brands: CardOfBrandsHomeview(
                        colum: 2,
                        hieght: 810.h,
                        scrollDirction: Axis.vertical,
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 15),
            CardOfBrandsHomeview(
              colum: 1,
              hieght: 180.h,
              scrollDirction: Axis.horizontal,
            ),

            RowViewAll(
              text: 'Best For You',
              onTap: () {
                Navigator.pushNamed(context, Approuter.bestForYou);
              },
              text2: 'View all',
            ),

            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}
