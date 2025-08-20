import 'package:flutter/material.dart';
import 'package:app/core/theme/styles.dart';

class RowViewAll extends StatelessWidget {
  const RowViewAll({
    super.key,
    required this.text,
    required this.text2,
    required this.onTap,
  });
  final String text;
  final String text2;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: AppTextSyles.textpopns20color),

          GestureDetector(
            onTap: onTap,
            child: Text(text2, style: AppTextSyles.textpopns16bcolor),
          ),
        ],
      ),
    );
  }
}
