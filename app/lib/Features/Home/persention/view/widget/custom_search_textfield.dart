import 'package:app/core/Router/appRouter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/core/theme/colors.dart';
import 'package:app/core/theme/styles.dart';

class CustomSearchTextfield extends StatelessWidget {
  CustomSearchTextfield({
    super.key,

    required this.assetImage,
    required this.hintText,
    required this.wigeth,
    required this.height,
    this.controler,
    required this.assetImagesuf,
    this.onChange,
    this.onSubmitted,
    this.onTap,
  });
  final String assetImagesuf;
  final String assetImage;
  final String hintText;
  Function(String)? onSubmitted;
  final double wigeth;
  final double height;
  final dynamic controler;
  final onTap;
  final onChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: TextField(
        onSubmitted: onSubmitted,
        controller: controler,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 18),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: SizedBox(
              height: 44.h,
              width: 44.w,
              child: SvgPicture.asset(
                assetImagesuf,
                height: height,
                width: wigeth,
              ),
            ),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: SizedBox(
              height: 44.h,
              width: 44.w,
              child: GestureDetector(
                onTap: onTap,
                child: SvgPicture.asset(
                  assetImage,
                  height: height,
                  width: wigeth,
                ),
              ),
            ),
          ),
          prefixIconConstraints: BoxConstraints(minWidth: 25, minHeight: 25),
          hintText: hintText,

          hintStyle: AppTextSyles.textpopns12Color,
          focusedBorder: OutlineInputBorder(
            gapPadding: 2,
            borderSide: BorderSide(color: Constants.Textfeildborder, width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            gapPadding: 2,
            borderSide: BorderSide(color: Constants.Textfeildborder, width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
