import 'package:app/Features/product_by_catgroy/Persention/view/Screens/catgory_product/catgory_product_body.dart';
import 'package:app/Features/product_by_catgroy/Persention/view/Screens/catgory_product/vm/catgroy_product_cubit.dart';
import 'package:app/core/Router/appRouter.dart';
import 'package:app/core/services/services_locator.dart';
import 'package:app/core/widgets/svg_theme_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app/Features/Home/persention/view/screen/product_page/product_page_body.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/theme/styles.dart';

class CatgoryProduct extends StatelessWidget {
  const CatgoryProduct({super.key, this.catgroyName});
  final catgroyName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Row(
          children: [
            Spacer(flex: 2),
            // SizedBox(width: 45.w),
            Text("Catgoryies"),
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
                  Navigator.pushNamed(context, Approuter.homePage);
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
      body: CatgoryProductBody(),
    );
  }
}
