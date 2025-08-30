import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/theme/styles.dart';
import 'package:app/core/theme/theme_cubit.dart';
import 'package:app/core/widgets/svg_theme_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RowOptionsProfile extends StatelessWidget {
  const RowOptionsProfile({
    super.key,
    this.image,
    this.imageselceted,
    this.text,
    this.wight,

    this.onTAp,
  });
  final image;
  final imageselceted;
  final wight;

  final text;
  final onTAp;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: AppSvgIcon(assetName: image, size: wight),
          ),
          Spacer(flex: 1),
          Text(text),
          Spacer(flex: 6),
          GestureDetector(
            onTap: onTAp,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [AppSvgIcon(assetName: imageselceted, size: wight)],
            ),
          ),
        ],
      ),
    );
  }
}

class RowOptionsDarkModeProfile extends StatefulWidget {
  const RowOptionsDarkModeProfile({
    super.key,
    this.image,
    this.imageselceted,
    this.text,
    this.wight,
    this.higth,
    this.onTAp,
  });
  final image;
  final imageselceted;
  final wight;
  final higth;
  final text;
  final onTAp;

  @override
  State<RowOptionsDarkModeProfile> createState() =>
      _RowOptionsDarkModeProfileState();
}

class _RowOptionsDarkModeProfileState extends State<RowOptionsDarkModeProfile> {
  bool isSwith = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: AppSvgIcon(assetName: widget.image, size: widget.wight),
          ),
          Spacer(flex: 1),
          Text(widget.text),
          Spacer(flex: 6),
          GestureDetector(
            onTap: widget.onTAp,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BlocBuilder<themeCubit, ThemeMode>(
                  builder: (context, state) {
                    return Switch(
                      value: state == ThemeMode.dark,
                      onChanged: (value) {
                        context.read<themeCubit>().refreshMode();
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
