import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';

class ImageDetail extends StatelessWidget {
  const ImageDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 75),
      child: SizedBox(
        width: 375.w,
        height: 56.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Image.asset(
              ImageManager.pampures,
              height: 56.h,
              width: 56.w,
            );
          },
          itemCount: 4,
        ),
      ),
    );
  }
}
