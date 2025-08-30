import 'package:app/Features/Home/persention/view/widget/Grid_view_product.dart';
import 'package:app/core/widgets/shammar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show BuildContext, Widget, StatelessWidget;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandsShimmerGridView extends StatelessWidget {
  const BrandsShimmerGridView({super.key, this.height, this.scrollDI});
  final height;
  final scrollDI;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(childCount: 20, (context, index) {
        return BrandsShimmer();
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

class catgroyshimmer extends StatelessWidget {
  const catgroyshimmer({super.key, this.height, this.scrollDI});
  final height;
  final scrollDI;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(childCount: 20, (context, index) {
        return ShimmerCatgoryCard();
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
