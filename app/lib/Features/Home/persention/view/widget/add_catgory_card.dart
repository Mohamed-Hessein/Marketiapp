import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/theme/colors.dart';
import 'package:app/core/theme/styles.dart';

class AddCatgoryCard extends StatelessWidget {
  const AddCatgoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 347.w,
      height: 180.h,
      child: Stack(
        children: [
          Card(
            elevation: .5,
            color: Colors.white,
            child: Row(
              children: [
                Image.asset(ImageManager.earPods, height: 120.h, width: 108.w),

                SizedBox(width: 8.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pampers Swaddlers',
                          style: AppTextSyles.textpopns14color,
                        ),
                        SizedBox(width: 40.w),
                        SvgPicture.asset(
                          ImageManager.heartIcon,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Text('84 Diapers', style: AppTextSyles.textpopns12Color),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          ImageManager.timeTwon,
                          height: 14.h,
                          width: 14.w,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          'Deliver in 60 mins',
                          style: AppTextSyles.textpopns12BlueforgotColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price: 345,00 EGP',
                          style: AppTextSyles.textpopns14color,
                        ),
                        SizedBox(width: 35.w),
                        SvgPicture.asset(
                          ImageManager.starIcon,
                          height: 20.h,
                          width: 20.w,
                        ),
                        Text(
                          '4.9',
                          style: AppTextSyles.textpopns12BlueforgotColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    SizedBox(
                      width: 232.w,
                      height: 40.h,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          fixedSize: Size(10, 7),

                          side: BorderSide(color: Constants.Textfeildborder),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Add',
                          style: AppTextSyles.textpopns14bcolor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartAddedWidget extends StatelessWidget {
  const CartAddedWidget({super.key, this.iamge, this.button, this.text});
  final iamge;
  final button;
  final text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400.w,
      height: 180.h,
      child: Stack(
        children: [
          Card(
            elevation: .5,
            color: Colors.white,
            child: Row(
              children: [
                Image.network(iamge, height: 120.h, width: 75.w),

                SizedBox(width: 8.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          text,
                          style: TextStyle(fontSize: 10, fontFamily: "poppins"),
                        ),
                        SizedBox(width: 40.w),
                        SvgPicture.asset(
                          ImageManager.heartIcon,
                          height: 25.h,
                          width: 25.w,
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Flexible(
                      child: Text(
                        '84 Diapers',
                        style: AppTextSyles.textpopns12Color,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          ImageManager.timeTwon,
                          height: 14.h,
                          width: 14.w,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          'Deliver in 60 mins',
                          style: AppTextSyles.textpopns12BlueforgotColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Price: 345,00 EGP',
                          style: AppTextSyles.textpopns14color,
                        ),
                        SizedBox(width: 35.w),
                        SvgPicture.asset(
                          ImageManager.starIcon,
                          height: 20.h,
                          width: 20.w,
                        ),
                        Text(
                          '4.9 ',
                          style: AppTextSyles.textpopns12BlueforgotColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),

                    Row(children: [button]),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
