import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/Features/Home/persention/view/screen/home_page/home_page_body.dart';

import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/theme/styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Hi, Mohamed", style: AppTextSyles.textpopns20color),
        actions: [
          SizedBox(width: 6.w),
          SizedBox(
            height: 35.h,
            width: 35.w,

            child: SvgPicture.asset(ImageManager.bellIcon),
          ),
        ],
      ),
      body: HomePageBody(),
    );
  }
}
