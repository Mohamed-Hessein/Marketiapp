import 'package:app/core/extention/theme_extn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/theme/styles.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({super.key, this.rate});
  final rate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: [
          SizedBox(height: 15.w),
          Container(
            width: 142.w,
            height: 29.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.fromBorderSide(BorderSide(color: Colors.blue)),
            ),
            child: Center(
              child: Text(
                'Free Shipping',
                style: AppTextSyles.textpopns12forgotColor,
              ),
            ),
          ),
          SizedBox(width: 100.w),
          SvgPicture.asset(ImageManager.vectorStar, height: 15.h, width: 15.w),
          SvgPicture.asset(ImageManager.vectorStar, height: 15.h, width: 15.w),
          SvgPicture.asset(ImageManager.vectorStar, height: 15.h, width: 15.w),
          SvgPicture.asset(ImageManager.vectorStar, height: 15.h, width: 15.w),

          SvgPicture.asset(ImageManager.vectorStar, height: 15.h, width: 15.w),
          SizedBox(width: 5.w),
          Flexible(
            child: Text('($rate)', style: context.theme.textTheme.labelSmall),
          ),
        ],
      ),
    );
  }
}
