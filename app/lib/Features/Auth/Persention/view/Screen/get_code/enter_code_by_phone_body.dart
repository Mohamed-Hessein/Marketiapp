import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/Features/Auth/Persention/view/widgets/boxgetcode.dart';
import 'package:app/Features/OnBording/Persention/view/widgets/custtomButtonNext.dart';
import 'package:app/core/Router/appRouter.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/constant/textconst.dart';
import 'package:app/core/theme/styles.dart';

class Entercodebyphonebody extends StatelessWidget {
  const Entercodebyphonebody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 44, left: 16, right: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset(
              ImageManager.verificationCodeWithPhone,
              height: 256.h,
              width: 344.3.w,
            ),
            SizedBox(height: 22.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                textAlign: TextAlign.center,
                Textconst.getCode,
                style: AppTextSyles.textpopns16color,
              ),
            ),
            SizedBox(height: 22.h),
            Pincodefeilds(),
            SizedBox(height: 22.h),
            Custtombuttonnext(
              onTap: () {
                Navigator.pushNamed(context, Approuter.changePass);
              },
              text: 'Verify Code',
            ),
            SizedBox(height: 22.h),
            Text('00:46', style: AppTextSyles.textpopns16Sreachcolor),
            SizedBox(height: 22.h),
            Text('Resend Code', style: AppTextSyles.textpopns16Sreachcolor),
          ],
        ),
      ),
    );
  }
}
