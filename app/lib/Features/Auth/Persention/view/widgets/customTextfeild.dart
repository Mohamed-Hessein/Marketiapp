import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/core/theme/colors.dart';
import 'package:app/core/theme/styles.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    required this.assetImage,
    required this.hintText,
    required this.wigeth,
    required this.height,
    required this.labelText,
    this.controler,
  });
  final String assetImage;
  final String hintText;
  final String labelText;
  final double wigeth;
  final double height;
  final dynamic controler;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: TextFormField(
        controller: controler,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 18),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: SizedBox(
              height: 16,
              width: 16,
              child: SvgPicture.asset(
                assetImage,
                height: height,
                width: wigeth,
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

class CustomTextPhoneFeild extends StatelessWidget {
  const CustomTextPhoneFeild({
    super.key,
    required this.assetImage,
    required this.hintText,
    required this.wigeth,
    required this.height,
    required this.SecassetImage,
    required this.labelText,
    this.controler,
  });
  final String assetImage;
  final String SecassetImage;
  final controler;
  final String hintText;
  final double wigeth;
  final String labelText;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: TextFormField(
        controller: controler,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 18),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: wigeth,
                height: height,
                child: SvgPicture.asset(
                  assetImage,
                  height: height,
                  width: wigeth,
                ),
              ),
              SizedBox(width: 3),
              SizedBox(
                width: wigeth,
                height: height,
                child: SvgPicture.asset(SecassetImage),
              ),
            ],
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 25.w,
            minHeight: 25.h,
          ),
          hintText: hintText,
          hintStyle: AppTextSyles.textpopns12BlueforgotColor,
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
