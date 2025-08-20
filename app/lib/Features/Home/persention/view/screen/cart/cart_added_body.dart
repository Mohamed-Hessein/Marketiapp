import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/Features/Home/persention/view/widget/add_catgory_card.dart';
import 'package:app/Features/Home/persention/view/widget/custom_search_textfield.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/theme/styles.dart';

class CartAddedBody extends StatelessWidget {
  const CartAddedBody({super.key});

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
                      Text('Phones', style: AppTextSyles.textpopns20color),
                      SizedBox(height: 4.h),
                    ],
                  ),
                ),
                SizedBox(
                  height: 812.h,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return CartAddedWidget();
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
