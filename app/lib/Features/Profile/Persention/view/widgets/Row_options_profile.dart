import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/theme/styles.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RowOptionsProfile extends StatelessWidget {
  const RowOptionsProfile({
    super.key,
    this.image,
    this.imageselceted,
    this.text,
    this.wight,
    this.higth,
  });
  final image;
  final imageselceted;
  final wight;
  final higth;
  final text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(image, width: wight, height: higth),

        Text(text, style: AppTextSyles.textpopns16color),

        Row(
          children: [
            SvgPicture.asset(imageselceted, width: wight, height: higth),
          ],
        ),
      ],
    );
  }
}
