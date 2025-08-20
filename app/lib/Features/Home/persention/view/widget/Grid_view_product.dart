import 'package:flutter/material.dart';

class GridViewProduct extends StatelessWidget {
  const GridViewProduct({
    super.key,
    this.hieght,
    required this.widget,
    this.crossAxisCount,
    this.itemCount,
  });
  final hieght;
  final Widget widget;
  final crossAxisCount;
  final itemCount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14),
      child: SizedBox(
        height: hieght,
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return widget;
          },
        ),
      ),
    );
  }
}
