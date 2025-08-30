import 'package:app/Features/Favorite/Persention/vm/favorite_cubit/favorite_cubit.dart';
import 'package:app/Features/Favorite/Persention/vm/favorite_cubit/favorite_state.dart';
import 'package:app/core/constant/image_manager/image_manager.dart';
import 'package:app/core/services/services_locator.dart';
import 'package:app/core/widgets/svg_theme_widgets.dart';
import 'package:dartz/dartz.dart' as product;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FavroiteIcon extends StatelessWidget {
  FavroiteIcon({super.key, this.id});
  final id;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<getFavoriteCubit, FavoriteState>(
      builder: (context, state) {
        final isFAv = context.read<getFavoriteCubit>().isFAvroite(id);
        return IconButton(
          onPressed: () {
            if (isFAv) {
              context.read<getFavoriteCubit>().DeleteFAvoriete(name: id);
            } else {
              context.read<getFavoriteCubit>().AddFAvoriete(name: id);
            }
          },
          icon: isFAv
              ? AppSvgIcon(assetName: ImageManager.fillHeart, size: 24.h)
              : AppSvgIcon(assetName: ImageManager.heartIcon, size: 24.h),
        );
      },
    );
  }
}
