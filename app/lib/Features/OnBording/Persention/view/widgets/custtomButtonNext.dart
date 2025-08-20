import 'package:flutter/material.dart';
import 'package:app/core/theme/colors.dart';
import 'package:app/core/theme/styles.dart';

class Custtombuttonnext extends StatelessWidget {
  Custtombuttonnext({super.key, required this.onTap, required this.text});
  Function() onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Container(
          height: 48,
          width: 347,
          padding: EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: Constants.buttonColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(text, style: AppTextSyles.textpopns18wcolor),
          ),
        ),
      ),
    );
  }
}
