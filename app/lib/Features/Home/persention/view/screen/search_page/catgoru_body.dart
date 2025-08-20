import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/Features/Home/persention/view/widget/button_search.dart';
import 'package:app/Features/Home/persention/view/widget/custom_search_textfield.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/theme/styles.dart';

class CatgoruBody extends StatelessWidget {
  const CatgoruBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
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
            SizedBox(height: 14.h),
            RowSearch(text: 'Popular Search', image: ImageManager.arrowDown),
            SizedBox(height: 14.h),
            Buttonsearch(),
            SizedBox(height: 5.h),
            RowSearch(text: 'Popular Search', image: ImageManager.arrowDown),
            SizedBox(height: 14.h),
            RowSearch(text: 'iphone XS Max', image: ImageManager.closeIcon),
            SizedBox(height: 14.h),
            RowSearch(text: 'iphone XS Max', image: ImageManager.closeIcon),

            SizedBox(height: 14.h),
            RowSearch(text: 'iphone XS Max', image: ImageManager.closeIcon),
            SizedBox(height: 14.h),
            RowSearch(text: 'iphone XS Max', image: ImageManager.closeIcon),
          ],
        ),
      ),
    );
  }
}

class RowSearch extends StatelessWidget {
  const RowSearch({super.key, this.text, this.image});
  final text;
  final image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$text', style: AppTextSyles.textpopns16color),
          SvgPicture.asset(image),
        ],
      ),
    );
  }
}
