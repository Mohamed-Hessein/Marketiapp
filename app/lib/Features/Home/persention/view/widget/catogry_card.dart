import 'package:app/core/extention/theme_extn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/core/theme/colors.dart';

class CatgoryWidget extends StatelessWidget {
  const CatgoryWidget({super.key, required this.onTap, this.limit, this.colum});
  final colum;
  final limit;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 118.h,
        width: 164.w,
        child: Card(
          color: context.theme.cardTheme.color,
          borderOnForeground: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(15),
            side: BorderSide(color: Constants.Textfeildborder),
          ),
          elevation: 0,
          child: colum,
        ),
      ),
    );
  }
}

class CatgoryCardWidget extends StatelessWidget {
  const CatgoryCardWidget({super.key, this.images, required this.onTap});
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
          child: Column(
            children: [Image.network(images), SizedBox(height: 12)],
          ),
        ),
      ),
    );
  }
}

class CatgoryBrandsWidget extends StatelessWidget {
  const CatgoryBrandsWidget({
    super.key,
    required this.onTap,
    this.limit,
    this.colum,
    this.title,
  });
  final colum;
  final title;
  final limit;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: 118.h,
            width: 164.w,
            child: Card(
              color: context.theme.cardTheme.color,
              borderOnForeground: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(15),
                side: BorderSide(color: Constants.Textfeildborder),
              ),
              elevation: 0,
              child: Center(child: Text("$colum")),
            ),
          ),
          Text("$title"),
        ],
      ),
    );
  }
}
