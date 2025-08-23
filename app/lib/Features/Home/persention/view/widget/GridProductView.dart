import 'package:flutter/material.dart';

class GridProductView extends StatelessWidget {
  const GridProductView({
    super.key,

    this.crossAxisCount,
    this.itemCount,
    required this.crossAxisSpacing,
    required this.mainAxisSpacing,
    required this.mainAxisExtent,
    this.itemBuilder,
  });

  final crossAxisCount;
  final itemCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final itemBuilder;

  final double mainAxisExtent;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(childCount: itemCount, itemBuilder),

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        mainAxisExtent: mainAxisExtent,
      ),
    );
  }
}
