import 'package:flutter/material.dart';
import 'package:app/Features/OnBording/Persention/view/screens/onbording_odel.dart';
import 'package:app/Features/OnBording/Persention/view/widgets/smooth_widget.dart';

import 'package:app/core/theme/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Onbording2 extends StatelessWidget {
  const Onbording2({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    required this.controller,
  });
  final String image;
  final String title;
  final String desc;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 120.h),
      child: Column(
        children: [
          SectionImageOnBording(controller: controller, image: image),
          SizedBox(height: 24.h),
          SectionTextOnBording(desc: desc, title: title),
        ],
      ),
    );
  }
}

class SectionImageOnBording extends StatelessWidget {
  const SectionImageOnBording({super.key, this.image, this.controller});
  final image;
  final controller;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SvgPicture.asset(
              image,
              width: 255.68360900878906,
              height: 256,
            ),
          ),
          SizedBox(height: 40.h),

          Center(
            child: SmoothWidget(
              controller: controller,
              totalpage: getOnbording().length,
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTextOnBording extends StatelessWidget {
  const SectionTextOnBording({super.key, this.title, this.desc});
  final title;
  final desc;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: AppTextSyles.textpopns20color),
        SizedBox(height: 34.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Text(desc, style: AppTextSyles.textpopns14color),
          ),
        ),
        SizedBox(height: 81.h),
      ],
    );
  }
}
