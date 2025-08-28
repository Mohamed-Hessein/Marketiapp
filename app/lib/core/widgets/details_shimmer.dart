import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProductDetails extends StatelessWidget {
  const ShimmerProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.h, left: 15.w, right: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 200.h,
              width: double.infinity,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 100.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: 80.w,
                    height: 100.h,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(height: 20.h, width: 150.w, color: Colors.white),
          ),
          SizedBox(height: 10.h),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 14.h,
              width: double.infinity,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10.h),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 48.h,
              width: double.infinity,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
