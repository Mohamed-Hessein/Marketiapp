import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/core/theme/colors.dart';
import 'package:app/core/theme/styles.dart';

class Buttonsearch extends StatelessWidget {
  const Buttonsearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        height: 250.h,
        child: GridView.builder(
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(50),
              child: Center(
                child: SizedBox(
                  width: 120.w,
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Constants.coloSearchButton,
                    ),
                    child: Text(
                      'Pampers',
                      style: AppTextSyles.textpopnsbw16color,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            );
          },

          itemCount: 9,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3 / 1.5,
            crossAxisCount: 3,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
          ),
        ),
      ),
    );
  }
}
