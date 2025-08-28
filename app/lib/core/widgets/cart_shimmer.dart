import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CartAddedShimmer extends StatelessWidget {
  const CartAddedShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400.w,
      height: 180.h,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Card(
          elevation: .5,
          color: Colors.white,
          child: Row(
            children: [
              // صورة
              Container(height: 120.h, width: 75.w, color: Colors.grey[300]),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // عنوان
                    Container(
                      height: 12.h,
                      width: 120.w,
                      color: Colors.grey[300],
                    ),
                    SizedBox(height: 6.h),
                    // تفاصيل
                    Container(
                      height: 10.h,
                      width: 80.w,
                      color: Colors.grey[300],
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      height: 10.h,
                      width: 100.w,
                      color: Colors.grey[300],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Container(
                          height: 10.h,
                          width: 60.w,
                          color: Colors.grey[300],
                        ),
                        SizedBox(width: 20.w),
                        Container(
                          height: 10.h,
                          width: 40.w,
                          color: Colors.grey[300],
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    // زرار
                    Container(
                      height: 30.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
