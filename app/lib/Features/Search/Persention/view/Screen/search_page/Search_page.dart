import 'package:app/Features/Search/Persention/view/Screen/search_page/search_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:flutter_svg/svg.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        leading: Row(
          children: [
            SizedBox(height: 20.h),
            SizedBox(width: 8.w),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SizedBox(
                height: 35.h,
                width: 35.w,
                child: SvgPicture.asset(ImageManager.backArrow),
              ),
            ),
          ],
        ),
      ),
      body: SearchPageBody(),
    );
  }
}
