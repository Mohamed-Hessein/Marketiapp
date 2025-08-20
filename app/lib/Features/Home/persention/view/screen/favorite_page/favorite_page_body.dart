import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/Features/Home/persention/view/widget/GridProductView.dart';
import 'package:app/Features/Home/persention/view/widget/card_widget.dart';
import 'package:app/Features/Home/persention/view/widget/custom_search_textfield.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/theme/styles.dart';

class FavoritePageBody extends StatelessWidget {
  const FavoritePageBody({super.key});

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

          GridProductView(
            mainAxisExtent: 210,
            crossAxisSpacing: 3,
            mainAxisSpacing: 3,
            widget: cardAddProduct(onTap: () {}, image: ImageManager.fillHeart),
            crossAxisCount: 2,
            itemCount: 20,
          ),
        ],
      ),
    );
  }
}
