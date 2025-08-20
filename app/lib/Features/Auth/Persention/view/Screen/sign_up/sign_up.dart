import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/Features/Auth/Persention/view/Screen/sign_up/Sign_up_body.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 8.w),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SizedBox(
                height: 44.h,
                width: 44.w,
                child: SvgPicture.asset(ImageManager.backArrow),
              ),
            ),
          ],
        ),
      ),
      body: SignupBody(),
    );
  }
}
