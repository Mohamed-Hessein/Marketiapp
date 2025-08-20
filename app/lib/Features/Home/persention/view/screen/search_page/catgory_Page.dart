import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/Features/Home/persention/view/screen/search_page/catgoru_body.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';

class CatgoryPage extends StatelessWidget {
  const CatgoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: Row(
          children: [
            SizedBox(height: 20.h),
            SizedBox(width: 8.w),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SizedBox(
                height: 45.h,
                width: 45.w,
                child: SvgPicture.asset(ImageManager.backArrow),
              ),
            ),
          ],
        ),
      ),
      body: CatgoruBody(),
    );
  }
}
