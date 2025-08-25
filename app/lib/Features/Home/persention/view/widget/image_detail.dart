import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';

class ImageDetail extends StatelessWidget {
  const ImageDetail({super.key, this.itemBuilder});
  final itemBuilder;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 75),
      child: SizedBox(
        width: 375.w,
        height: 56.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: itemBuilder,
          itemCount: 4,
        ),
      ),
    );
  }
}
