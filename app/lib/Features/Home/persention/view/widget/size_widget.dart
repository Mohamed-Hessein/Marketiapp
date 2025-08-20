import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/theme/styles.dart';

class SelectSize extends StatefulWidget {
  const SelectSize({super.key});

  @override
  State<SelectSize> createState() => _SelectSizeState();
}

class _SelectSizeState extends State<SelectSize> {
  int? selecteIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 15.w),
            Text(
              "Select Size",
              style: AppTextSyles.textpopns16color.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 15.w),
            SizedBox(
              height: 55.h,
              width: 172.w,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  bool isClicked = selecteIndex == index;
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selecteIndex = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.fromBorderSide(
                            isClicked
                                ? BorderSide(color: Colors.blue)
                                : BorderSide(color: Colors.grey),
                          ),
                        ),
                        width: 48.w,
                        height: 48.h,
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                '2',
                                style: isClicked
                                    ? AppTextSyles.textpopns24wcolor
                                    : AppTextSyles.textpopns24owcolor,
                              ),

                              if (isClicked)
                                SvgPicture.asset(
                                  ImageManager.vectorTrue,
                                  width: 14.w,
                                  height: 14.h,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
