import 'package:flutter/material.dart';

class ListViewProduct extends StatelessWidget {
  const ListViewProduct({
    super.key,
    required this.heigth,

    this.length,
    this.itemBuilder,
  });
  final double heigth;

  final length;
  final itemBuilder;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 14),
      child: SizedBox(
        height: heigth,
        child: ListView.builder(
          itemCount: length,
          scrollDirection: Axis.horizontal,
          itemBuilder: itemBuilder,
        ),
      ),
    );
  }
}
