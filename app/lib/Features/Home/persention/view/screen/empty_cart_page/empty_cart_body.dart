import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/Features/OnBording/Persention/view/widgets/custtomButtonNext.dart';
import 'package:app/core/Router/appRouter.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/constant/textconst.dart';
import 'package:app/core/theme/styles.dart';

class EmptyCartBody extends StatelessWidget {
  const EmptyCartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 44),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset(
              ImageManager.emptyCart,
              height: 256.h,
              width: 344.3.w,
            ),
            SizedBox(height: 22.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                textAlign: TextAlign.center,
                Textconst.emptyCartText,
                style: AppTextSyles.textpopns24wcolor,
              ),
            ),
            SizedBox(height: 22.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                textAlign: TextAlign.center,
                Textconst.emptyDIolad,
                style: AppTextSyles.textpopns16Sreachcolor,
              ),
            ),
            SizedBox(height: 22.h),
            Custtombuttonnext(
              onTap: () {
                Navigator.pushNamed(context, Approuter.logIn);
              },
              text: 'Start Shopping',
            ),
          ],
        ),
      ),
    );
  }
}
