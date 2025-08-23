import 'package:flutter/material.dart';

class GridViewProduct extends StatelessWidget {
  const GridViewProduct({
    super.key,
    this.hieght,

    this.crossAxisCount,
    required this.itemCount,
    this.itemBuilder,
    this.scrollDir,
  });
  final hieght;

  final crossAxisCount;
  final int itemCount;
  final itemBuilder;
  final scrollDir;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14),
      child: SizedBox(
        height: hieght,
        child: GridView.builder(
          scrollDirection: scrollDir,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        ),
      ),
    );
  }
}
