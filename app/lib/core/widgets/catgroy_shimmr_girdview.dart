import 'package:app/Features/Home/persention/view/widget/Grid_view_product.dart';
import 'package:app/core/widgets/shammar.dart';
import 'package:flutter/material.dart'
    show BuildContext, Widget, StatelessWidget;

class GridCatgroyShimmer extends StatelessWidget {
  const GridCatgroyShimmer({super.key, this.height, this.scrollDI});
  final height;
  final scrollDI;

  @override
  Widget build(BuildContext context) {
    return GridViewProduct(
      itemBuilder: (context, index) {
        return ShimmerCatgoryCard();
      },
      hieght: height,
      scrollDir: scrollDI,
      itemCount: 20,
      crossAxisCount: 2,
    );
  }
}
