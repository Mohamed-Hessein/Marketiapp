import 'package:app/core/extention/mediaquery_extn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/Features/OnBording/Persention/view/screens/onbording2.dart';
import 'package:app/Features/OnBording/Persention/view/screens/onbording_odel.dart';
import 'package:app/Features/OnBording/Persention/view/widgets/custtomButtonNext.dart';
import 'package:app/core/Router/appRouter.dart';
import 'package:app/core/constant/textconst.dart';

class onbordingpage extends StatelessWidget {
  onbordingpage({super.key});
  final pages = getOnbording();
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    final heigth = context.screenHeight;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: pages.length,
              itemBuilder: (_, index) {
                final page = pages[index];

                return Onbording2(
                  controller: controller,
                  image: page.image,
                  title: page.title,
                  desc: page.desc,
                );
              },
            ),
          ),
          SizedBox(height: 22.h),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Custtombuttonnext(
              text: Textconst.nextButton,
              onTap: () {
                final currntpage = controller.page?.round() ?? 0;
                if (currntpage == getOnbording().length - 1) {
                  Navigator.pushNamed(context, Approuter.logIn);
                } else {
                  controller.nextPage(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
