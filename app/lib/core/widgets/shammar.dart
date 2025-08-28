import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerCardProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 184.h,
      width: 180.w,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 9),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 96.h,
                  width: 152.w,
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                ),
                SizedBox(height: 10.h),
                Container(
                  height: 12.h,
                  width: 80.w,
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                ),
                SizedBox(height: 6.h),
                Container(
                  height: 12.h,
                  width: 40.w,
                  color: Colors.white,
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShimmerCardAddProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270.h,
      width: 215.w,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30, left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(height: 96.h, width: 205.w, color: Colors.white),
                SizedBox(height: 15.h),
                Container(height: 12.h, width: 60.w, color: Colors.white),
                SizedBox(height: 10.h),
                Container(height: 12.h, width: 120.w, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShimmerCatgoryCard extends StatelessWidget {
  const ShimmerCatgoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
        ),
        height: 120.h,
        width: double.infinity,
      ),
    );
  }
}

class BrandsShimmer extends StatelessWidget {
  const BrandsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
        ),

        height: 180.h,
        width: double.infinity,
      ),
    );
  }
}
