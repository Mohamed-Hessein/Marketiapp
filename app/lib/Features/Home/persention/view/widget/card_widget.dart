import 'package:app/core/extention/mediaquery_extn.dart';
import 'package:app/core/extention/theme_extn.dart';
import 'package:app/core/widgets/svg_theme_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/theme/colors.dart';
import 'package:app/core/theme/styles.dart';

class cardProduct extends StatelessWidget {
  const cardProduct({
    super.key,
    required this.onTap,
    this.image,
    this.realImage,
    this.title,
    required this.price,
    this.rating,
  });
  final Function() onTap;
  final image;
  final realImage;
  final title;
  final double price;
  final rating;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          SizedBox(
            height: 190.h,
            width: 180.w,
            child: Card(
              color: context.theme.cardTheme.color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(14),
              ),
              elevation: 1,

              shadowColor: Color(0xFFB2CCFF),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 9),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(5),
                      child: Image.network(
                        realImage,
                        height: 96.h,
                        width: 152.w,

                        fit: BoxFit.fill,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("$price", style: TextStyle(fontSize: 10)),
                        SizedBox(width: 53),
                        AppSvgIcon(
                          assetName: ImageManager.starIcon,
                          size: 20.h,
                        ),
                        Text('$rating', style: TextStyle(fontSize: 10)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9),
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              '$title',
                              style: TextStyle(fontSize: 8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            right: context.screenHeight * .022,
            top: context.screenHeight * .0165,
            child: AppSvgIcon(assetName: ImageManager.heartIcon, size: 24.h),
          ),
        ],
      ),
    );
  }
}

class cardAddProduct extends StatelessWidget {
  cardAddProduct({
    super.key,
    required this.onTap,
    required this.image,
    this.realImage,
    this.title,
    required this.price,
    required this.button,
    this.rating,
  });
  final Function() onTap;
  final dynamic image;
  final dynamic realImage;
  final title;
  final dynamic price;
  final Widget button;
  final rating;
  bool isCliked = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: Stack(
          children: [
            SizedBox(
              height: 270.h,
              width: 220.w,
              child: Card(
                color: context.theme.cardTheme.color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(14),
                ),
                elevation: 1,

                shadowColor: Color(0xFFB2CCFF),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30, left: 15),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(5),
                          child: Image.network(
                            realImage,

                            height: 96.h,
                            width: 205.w,

                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "$price",
                              style: context.theme.textTheme.labelSmall,
                            ),
                            Spacer(flex: 2),
                            AppSvgIcon(
                              assetName: ImageManager.starIcon,
                              size: 20.h,
                            ),
                            SizedBox(width: 1.w),
                            Text(
                              '$rating',
                              style: context.theme.textTheme.labelSmall,
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                softWrap: true,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                title,
                                style: context.theme.textTheme.labelSmall,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              right: context.screenHeight * .028,
              top: context.screenHeight * .0165,
              child: image,
            ),
            Positioned(
              bottom: context.screenHeight * .015,
              left: context.screenHeight * .050,
              child: button,
            ),
          ],
        ),
      ),
    );
  }
}
