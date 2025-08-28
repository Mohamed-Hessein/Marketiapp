import 'package:app/Features/Favorite/Persention/vm/favorite_cubit/favorite_cubit.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/services/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FavroiteIcon extends StatefulWidget {
  FavroiteIcon({super.key, this.name, this.isFAv});
  final name;
  final isFAv;

  @override
  State<FavroiteIcon> createState() => _FavroiteIconState();
}

class _FavroiteIconState extends State<FavroiteIcon> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (widget.isFAv) {
          sl<getFavoriteCubit>().AddFAvoriete(name: widget.name);
        } else {
          sl<getFavoriteCubit>().DeleteFAvoriete(name: widget.name);
        }
      },
      icon: widget.isFAv
          ? SvgPicture.asset(ImageManager.heartIcon, height: 24.h, width: 24.w)
          : SvgPicture.asset(ImageManager.fillHeart, height: 24.h, width: 24.w),
    );
  }
}
