import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/Features/Auth/Persention/view/Screen/congratules/congrat_body.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';

class Congr extends StatelessWidget {
  const Congr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 8.w),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SizedBox(
                height: 48.h,
                width: 48.w,
                child: SvgPicture.asset(ImageManager.backArrow),
              ),
            ),

            SizedBox(width: 6.w),
          ],
        ),
      ),
      body: Congrebody(),
    );
  }
}
