import 'package:app/Features/Home/persention/view_model/product_cubit.dart';
import 'package:app/core/services/services_locator.dart';
import 'package:app/core/widgets/svg_theme_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/Features/Home/persention/view/screen/product_page/product_page_body.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/theme/styles.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Row(
          children: [
            Spacer(flex: 2),
            // SizedBox(width: 45.w),
            Text("All Products"),
            Spacer(flex: 3),
          ],
        ),
        leading: SizedBox(
          height: 80.h,
          width: 80.w,
          child: Row(
            children: [
              SizedBox(width: 20.h),

              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SizedBox(
                  height: 30.h,
                  width: 30.w,
                  child: AppSvgIcon(assetName: ImageManager.backArrow),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ProductPageBody(),
    );
  }
}
