import 'package:app/Features/Profile/Persention/vm/image_cubit.dart';
import 'package:app/Features/Profile/Persention/vm/image_state.dart';
import 'package:app/core/Router/appRouter.dart';
import 'package:app/core/extention/theme_extn.dart';
import 'package:app/core/widgets/svg_theme_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileStateSuecss) {
              return Text(
                "Hi, ${state.product.name}",
                style: context.theme.appBarTheme.toolbarTextStyle,
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
        actions: [
          SizedBox(width: 6.w),
          SizedBox(
            height: 35.h,
            width: 35.w,

            child: AppSvgIcon(assetName: ImageManager.bellIcon),
          ),
        ],
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Approuter.profile);
              },
              icon: SizedBox(
                height: 40.h,
                width: 40.h,
                child: CircleAvatar(
                  child: Image(image: AssetImage(ImageManager.avatr)),
                ),
              ),
            );
          },
        ),
      ),

      body: HomePageBody(),
    );
  }
}
