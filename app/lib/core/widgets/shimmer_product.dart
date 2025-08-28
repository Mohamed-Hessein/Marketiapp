import 'package:app/core/widgets/shammar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliverGridShammer extends StatelessWidget {
  const SliverGridShammer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(childCount: 10, (context, index) {
        return ShimmerCardAddProduct();
      }),

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,

        crossAxisSpacing: 5,
        mainAxisSpacing: 10,
        mainAxisExtent: 250.h,
      ),
    );
  }
}
