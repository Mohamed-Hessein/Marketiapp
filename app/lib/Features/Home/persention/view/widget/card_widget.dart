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
              color: Theme.of(context).cardTheme.color,
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
            right: MediaQuery.of(context).size.height * .022,
            top: MediaQuery.of(context).size.height * .0165,
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
                color: Theme.of(context).cardTheme.color,
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
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            Spacer(flex: 2),
                            AppSvgIcon(
                              assetName: ImageManager.starIcon,
                              size: 20.h,
                            ),
                            SizedBox(width: 1.w),
                            Text(
                              '$rating',
                              style: Theme.of(context).textTheme.labelSmall,
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
                                style: Theme.of(context).textTheme.labelSmall,
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
              right: MediaQuery.of(context).size.height * .028,
              top: MediaQuery.of(context).size.height * .0165,
              child: image,
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * .015,
              left: MediaQuery.of(context).size.height * .050,
              child: button,
            ),
          ],
        ),
      ),
    );
  }
}
