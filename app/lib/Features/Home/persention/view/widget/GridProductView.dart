import 'package:flutter/material.dart';

class GridProductView extends StatelessWidget {
  const GridProductView({
    super.key,

    required this.widget,
    this.crossAxisCount,
    this.itemCount,
    required this.crossAxisSpacing,
    required this.mainAxisSpacing,
    required this.mainAxisExtent,
  });

  final Widget widget;
  final crossAxisCount;
  final itemCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;

  final double mainAxisExtent;
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(childCount: itemCount, (
        context,
        index,
      ) {
        return widget;
      }),

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        mainAxisExtent: mainAxisExtent,
      ),
    );
  }
}
