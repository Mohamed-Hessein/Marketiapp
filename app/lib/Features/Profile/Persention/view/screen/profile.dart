import 'package:app/Features/Profile/Persention/view/screen/profile_page_body.dart';
import 'package:app/Features/Profile/Persention/vm/image_cubit.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/services/services_locator.dart';
import 'package:app/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                ImageManager.backArrow,
                width: 45.w,
                height: 45.h,
              ),
            ),

            Text("MyProfile", style: AppTextSyles.textpopns20color),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset(
                ImageManager.cartNoti,
                width: 30.w,
                height: 30.h,
              ),
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) => sl<ProfileCubit>()..getProfileData(),
        child: ProfilePageBody(),
      ),
    );
  }
}
