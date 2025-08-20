import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/core/theme/colors.dart';

class CatgoryWidget extends StatelessWidget {
  const CatgoryWidget({super.key, this.images, required this.onTap});
  final images;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 118.h,
        width: 164.w,
        child: Card(
          color: Colors.white,
          borderOnForeground: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(15),
            side: BorderSide(color: Constants.Textfeildborder),
          ),
          elevation: 0,
          child: Image.asset(images),
        ),
      ),
    );
  }
}
