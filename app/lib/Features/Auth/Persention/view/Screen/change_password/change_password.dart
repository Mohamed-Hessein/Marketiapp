import 'package:app/Features/Auth/Persention/ViewModel/sign_up_cubit.dart';
import 'package:app/core/services/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/Features/Auth/Persention/view/Screen/change_password/change_pawword_body.dart';

import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/constant/textconst.dart';
import 'package:app/core/theme/styles.dart';

class Changepassword extends StatelessWidget {
  const Changepassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 8.h),
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
            Text(
              Textconst.createNewPassword,
              style: AppTextSyles.textpopns12Color,
            ),
          ],
        ),
      ),
      body: Changepawwordbody(),
    );
  }
}
