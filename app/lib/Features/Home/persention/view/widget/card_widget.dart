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
  });
  final Function() onTap;
  final image;
  final realImage;
  final title;
  final double price;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          SizedBox(
            height: 184.h,
            width: 180.w,
            child: Card(
              color: Colors.white,
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
                        Text(
                          "$price",
                          style: AppTextSyles.textpopns12BlueforgotColor,
                        ),
                        SizedBox(width: 53),
                        SvgPicture.asset(
                          ImageManager.starIcon,
                          height: 20.h,
                          width: 20.w,
                        ),
                        Text(
                          '4.9',
                          style: AppTextSyles.textpopns12BlueforgotColor,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9),
                      child: Row(
                        children: [
                          Text('$title', style: TextStyle(fontSize: 8)),
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
            child: SvgPicture.asset(
              ImageManager.heartIcon,
              height: 24.h,
              width: 24.w,
            ),
          ),
        ],
      ),
    );
  }
}

class cardAddProduct extends StatelessWidget {
  const cardAddProduct({
    super.key,
    required this.onTap,
    required this.image,
    this.realImage,
    this.title,
    required this.price,
  });
  final Function() onTap;
  final image;
  final realImage;
  final title;
  final double price;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: Stack(
          children: [
            SizedBox(
              height: 270.h,
              width: 215.w,
              child: Card(
                color: Colors.white,
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
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "    $price",
                                style: AppTextSyles.textpopns12BlueforgotColor,
                              ),
                              SizedBox(width: 60.w),
                              SvgPicture.asset(
                                ImageManager.starIcon,
                                height: 20.h,
                                width: 20.w,
                              ),
                              Text(
                                '4.9',
                                style: AppTextSyles.textpopns12BlueforgotColor,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            children: [
                              Text(title, style: TextStyle(fontSize: 9.sp)),
                            ],
                          ),
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
              child: SvgPicture.asset(image, height: 24.h, width: 24.w),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * .015,
              left: MediaQuery.of(context).size.height * .050,
              child: SizedBox(
                width: 124.w,
                height: 38.h,
                child: TextButton(
                  style: TextButton.styleFrom(
                    fixedSize: Size(10, 7),

                    side: BorderSide(color: Constants.Textfeildborder),
                  ),
                  onPressed: () {},
                  child: Text('Add', style: AppTextSyles.textpopns14bcolor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
