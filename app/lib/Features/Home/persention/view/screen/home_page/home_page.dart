import 'package:app/core/Router/appRouter.dart';
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
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: SizedBox(
                height: 40.h,
                width: 40.h,
                child: CircleAvatar(
                  child: Image(image: AssetImage(ImageManager.earPods)),
                ),
              ),
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              width: 273.w,
              height: 112.h,
              child: DrawerHeader(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 40.h,
                      width: 40.h,
                      child: CircleAvatar(
                        child: Image(image: AssetImage(ImageManager.earPods)),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          'Welcome',
                          style: AppTextSyles.textpopns16Sreachcolor,
                        ),
                        Text('Mohamed'),
                      ],
                    ),
                    SvgPicture.asset(ImageManager.closeIcon),
                  ],
                ),
              ),
            ),

            ListTile(
              title: Text(
                'Account Settings',
                style: AppTextSyles.textpopns18color,
              ),
              leading: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, Approuter.profile);
                },
                icon: SvgPicture.asset(
                  ImageManager.settinIcon,
                  height: 24.h,
                  width: 24.w,
                ),
              ),
            ),
          ],
        ),
      ),
      body: HomePageBody(),
    );
  }
}
