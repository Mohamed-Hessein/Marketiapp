import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/Features/Auth/Persention/view/widgets/customTextfeild.dart';
import 'package:app/Features/OnBording/Persention/view/widgets/custtomButtonNext.dart';
import 'package:app/core/Router/appRouter.dart';

import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/constant/textconst.dart';
import 'package:app/core/theme/styles.dart';

class Forgotpasswordbody extends StatelessWidget {
  const Forgotpasswordbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 44),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SvgPicture.asset(
              ImageManager.forgotPasswordWithPhone,
              height: 256.h,
              width: 344.3.w,
            ),
            SizedBox(height: 22.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                textAlign: TextAlign.center,
                Textconst.getCodeByPhoneNumber,
                style: AppTextSyles.textpopns16color,
              ),
            ),
            SizedBox(height: 22.h),
            CustomTextPhoneFeild(
              labelText: Textconst.phoneNumberLabel,
              height: 27.h,
              wigeth: 27.w,
              hintText: Textconst.phoneNumberLabel,
              assetImage: ImageManager.phoneIcon,
              SecassetImage: ImageManager.arrowDown,
            ),
            SizedBox(height: 22.h),
            Custtombuttonnext(
              onTap: () {
                Navigator.pushNamed(context, Approuter.forgotPasswordPhone);
              },
              text: 'Send Code',
            ),
            SizedBox(height: 22.h),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/forgtepassmail');
              },
              child: Text(
                Textconst.tryAnthorway,
                style: AppTextSyles.textpopns16bcolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
